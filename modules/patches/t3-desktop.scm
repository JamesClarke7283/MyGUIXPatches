;;; -*- mode: scheme; -*-
;;;
;;; t3-desktop --- the native T3 Code desktop application.
;;;
;;; (patches ai-clis) provides `t3-code': the CLI, which starts a local server
;;; and opens a browser.  This module packages the desktop application, the same
;;; server wrapped in an Electron shell, which shows a native window instead.
;;;
;;; Why the AppImage, and why the bundled Electron
;;; ---------------------------------------------
;;; Upstream publishes the desktop app only as an electron-builder AppImage
;;; (T3-Code-<version>-x86_64.AppImage).  It bundles Electron 44.10.0 together
;;; with the app's native modules -- node-pty, @napi-rs/keyring, ffi-rs, xa11y --
;;; which are prebuilt for that exact Electron ABI.  nonguix's `electron' is
;;; 41.x, so substituting it would break those modules with a
;;; NODE_MODULE_VERSION mismatch.  The Electron inside the AppImage is therefore
;;; used as-is.
;;;
;;; How it is made to run on Guix
;;; -----------------------------
;;; The AppImage payload is a squashfs image that starts at a fixed byte offset,
;;; so `unsquashfs -o' extracts it without FUSE and without reading
;;; /proc/self/exe.  The Electron binary it contains does carry the FHS
;;; interpreter /lib64/ld-linux-x86-64.so.2, but nonguix's
;;; chromium-binary-build-system patches that to the store's loader, sets a
;;; RUNPATH covering the whole Electron library set, and wraps the launcher with
;;; the matching LD_LIBRARY_PATH.  That is the same machinery nonguix's own
;;; `electron' package relies on.
;;;
;;; The app's copy of chrome-sandbox cannot keep its setuid bit in the store.
;;; Chromium then falls back to the unprivileged user-namespace sandbox, which
;;; works on Guix System as long as unprivileged user namespaces are enabled
;;; (the stock kernel configuration allows it).

(define-module (patches t3-desktop)
  #:use-module (gnu packages compression)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (nonguix build-system chromium-binary))

;; Byte offset of the squashfs payload inside the pinned AppImage, as printed by
;; `T3-Code-0.1.6-x86_64.AppImage --appimage-offset'.  It is a property of the
;; artifact, which the origin below pins by hash.
(define %appimage-squashfs-offset "944632")

(define-public t3-code-desktop
  (package
    (name "t3-code-desktop")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/pingdotgg/t3code/releases/"
                           "download/v" version "/T3-Code-" version
                           "-x86_64.AppImage"))
       (file-name (string-append name "-" version ".AppImage"))
       (sha256
        (base32 "1l1lvxnwk0glqacnhq40sx5i8ifrl6p4ds3b76dk0yf711r51qh9"))))
    (build-system chromium-binary-build-system)
    (arguments
     (list
      ;; The native modules under resources/app.asar.unpacked are dlopen'd by
      ;; Electron and carry no RUNPATH of their own; the wrapper's
      ;; LD_LIBRARY_PATH is what satisfies them.
      #:validate-runpath? #f
      ;; electron-builder already stripped the Electron binary; running strip
      ;; over 228 MB of prebuilt code buys nothing.
      #:strip-binaries? #f
      ;; The tree extracted from the AppImage is copied verbatim into
      ;; share/t3code so Electron finds resources/ beside its own binary.
      #:install-plan
      #~'(("." "share/t3code/"))
      ;; patchelf the Electron launcher and the helpers it spawns through the
      ;; FHS loader.  The launcher's own libraries (libffmpeg.so, libEGL.so,
      ;; libGLESv2.so, ...) sit beside it, hence the ("out" "/share/t3code")
      ;; RUNPATH entry.
      #:wrapper-plan
      #~'(("t3code" (("out" "/share/t3code")))
          "chrome-sandbox"
          "chrome_crashpad_handler")
      #:phases
      #~(modify-phases %standard-phases
          (delete 'binary-unpack)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              ;; Extract the squashfs payload at its fixed offset; this needs
              ;; neither FUSE nor /proc.
              (invoke "unsquashfs" "-o" #$%appimage-squashfs-offset
                      "-d" "squashfs-root" source)
              (chdir "squashfs-root")))
          (replace 'install-wrapper
            ;; A deliberate replacement for the Chromium build system's own
            ;; wrapper: that one does not put the application's own directory on
            ;; LD_LIBRARY_PATH, where Electron's dlopen'd libraries
            ;; (libEGL.so, libGLESv2.so, ...) live.  It also hard-codes the
            ;; "fontconfig-minimal" input label, which is supplied by the
            ;; Chromium build system today but is a fragile thing to rely on; our
            ;; version resolves both labels.
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (app (string-append out "/share/t3code"))
                     (exe (string-append out "/bin/t3code"))
                     (nss (or (assoc-ref inputs "nss") out))
                     ;; The Chromium build system supplies fontconfig under the
                     ;; "fontconfig-minimal" label; fall back to "fontconfig"
                     ;; for other Guix versions.
                     (fontconfig (or (assoc-ref inputs "fontconfig-minimal")
                                     (assoc-ref inputs "fontconfig")
                                     out))
                     (lib-dirs '())
                     (bin-dirs '()))
                ;; Collect every input's lib/ and bin/ directory; the Chromium
                ;; build system supplies the Electron package set.
                (for-each
                 (lambda (path)
                   (let ((lib (string-append path "/lib"))
                         (bin (string-append path "/bin")))
                     (when (file-exists? lib)
                       (set! lib-dirs (cons lib lib-dirs)))
                     (when (file-exists? bin)
                       (set! bin-dirs (cons bin bin-dirs)))))
                 (map cdr inputs))
                (wrap-program exe
                  `("LD_LIBRARY_PATH" ":" prefix
                    (,@lib-dirs ,(string-append nss "/lib/nss")
                     ,app ,(string-append app "/usr/lib")))
                  `("PATH" ":" prefix
                    (,@bin-dirs ,(string-append out "/bin")))
                  `("FONTCONFIG_PATH" ":" prefix
                    (,(string-append fontconfig "/etc/fonts")))
                  ;; Electron >= 28: choose X11 or Wayland automatically.
                  `("ELECTRON_OZONE_PLATFORM_HINT" ":" = ("auto")))
                #t)))
          (add-after 'install 'install-desktop-integration
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (app (string-append out "/share/t3code"))
                     (bin (string-append out "/bin"))
                     (applications (string-append out "/share/applications"))
                     (icons (string-append out "/share/icons/hicolor")))
                (mkdir-p bin)
                (symlink (string-append app "/t3code")
                         (string-append bin "/t3code"))

                ;; A setuid helper cannot live in the store; Chromium then
                ;; uses the unprivileged user-namespace sandbox.
                (let ((sandbox (string-append app "/chrome-sandbox")))
                  (when (file-exists? sandbox)
                    (chmod sandbox #o755)))

                ;; A menu entry that launches the native application, not the
                ;; browser that `t3' opens.
                (mkdir-p applications)
                (call-with-output-file
                    (string-append applications "/t3code.desktop")
                  (lambda (port)
                    (format port "[Desktop Entry]~%")
                    (format port "Type=Application~%")
                    (format port "Name=T3 Code~%")
                    (format port "Comment=Coding agent desktop client~%")
                    (format port "Exec=t3code %U~%")
                    (format port "Icon=t3code~%")
                    (format port "Terminal=false~%")
                    (format port "StartupWMClass=t3code~%")
                    (format port "Categories=Development;~%")
                    (format port "Keywords=agent;code;ai;~%")
                    (format port
                            "MimeType=x-scheme-handler/t3code;x-scheme-handler/t3code-dev;~%")
                    (format port "StartupNotify=true~%")))

                ;; Upstream ships every hicolor size; copy the ones present.
                (for-each
                 (lambda (size)
                   (let ((source-icon
                          (string-append app "/usr/share/icons/hicolor/"
                                         size "/apps/t3code.png"))
                         (target-dir
                          (string-append icons "/" size "/apps")))
                     (when (file-exists? source-icon)
                       (mkdir-p target-dir)
                       (copy-file source-icon
                                  (string-append target-dir "/t3code.png")))))
                 '("16x16" "22x22" "24x24" "32x32" "48x48" "64x64"
                   "128x128" "256x256" "512x512"))
                #t))))))
    (native-inputs (list squashfs-tools))
    (supported-systems '("x86_64-linux"))
    (synopsis "T3 Code desktop application")
    (description
     "T3 Code is a coding-agent client with an agent control surface, a task
list and an approval flow.  This package installs the native desktop
application: upstream's Electron shell around the same local server that
@code{t3-code} exposes over HTTP, so the client runs in its own window rather
than in a browser.  The Electron runtime is the one bundled in upstream's
@file{x86_64} AppImage, because the application's native modules are built for
that exact Electron ABI.")
    (home-page "https://github.com/pingdotgg/t3code")
    ;; Upstream's licence should be recorded here once confirmed; the CLI
    ;; package in (patches ai-clis) leaves it unset for the same reason.
    (license #f)))
