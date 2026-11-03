;;; -*- mode: scheme; -*-
;;;
;;; antigravity --- Google Antigravity, the agent-first desktop application.
;;;
;;; Upstream publishes this as a plain Electron tarball:
;;;
;;;   Antigravity.tar.gz  ->  Antigravity-x64/   (Electron 44.5.1)
;;;
;;; There is no source build; the Linux artifact is a prebuilt Electron bundle.
;;; It is packaged the same way as (patches t3-desktop): nonguix's
;;; chromium-binary-build-system supplies the Electron library set, patches the
;;; FHS interpreter to the store's loader, sets a RUNPATH and wraps the launcher
;;; with the matching LD_LIBRARY_PATH.
;;;
;;; Do not confuse this with "Antigravity IDE (Standalone)", which is a separate
;;; VS Code fork on the download page.  This module packages the "Antigravity"
;;; application.
;;;
;;; Two helper executables under resources/bin are spawned by the application and
;;; carry FHS interpreters of their own -- language_server uses
;;; /lib64/ld-linux-x86-64.so.2 and webm_encoder uses Google's grte loader,
;;; /usr/grte/v5/lib64/ld-linux-x86-64.so.2 -- so they are named in the wrapper
;;; plan as well.  Both need only glibc libraries.
;;;
;;; The tarball ships no .desktop file and no icons, so the official
;;; apple-touch-icon is fetched as a second origin and installed into the
;;; hicolor theme.
;;;
;;; The bundled copy of chrome-sandbox cannot keep its setuid bit in the store.
;;; Chromium then uses the unprivileged user-namespace sandbox, which works on
;;; Guix System as long as unprivileged user namespaces are enabled (the stock
;;; kernel configuration allows it).

(define-module (patches antigravity)
  #:use-module (gnu packages freedesktop)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (nonguix build-system chromium-binary))

;; The build number is part of the download URL and changes every release.
(define %antigravity-build "2.28.2-5937220255875072")

;; The tarball ships no icon; fetch the official apple-touch-icon instead.
;; A local-file here would be resolved relative to whatever directory Guix
;; happens to be invoked from, which is not reliable for a channel module.
(define %antigravity-icon
  (origin
    (method url-fetch)
    (uri "https://antigravity.google/apple-touch-icon.png")
    (file-name "antigravity.png")
    (sha256
     (base32 "094bndn16rbkansbrs4xymh0fhi0l26z5qjd2fw6zmp2cngikqj4"))))

(define-public antigravity
  (package
    (name "antigravity")
    (version "2.28.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://storage.googleapis.com/antigravity-public/"
             "antigravity-hub/" %antigravity-build
             "/linux-x64/Antigravity.tar.gz"))

       (sha256
        (base32 "1hrqw734szwk0xx0g0cmlgl3glphfrpj624bavzvlqw8125r74mx"))))
    (build-system chromium-binary-build-system)
    (arguments
     (list
      ;; Electron's native modules are dlopen'd and carry no RUNPATH of their
      ;; own; the wrapper's LD_LIBRARY_PATH is what satisfies them.
      #:validate-runpath? #f
      ;; The Electron binary is already stripped by upstream; running strip over
      ;; 228 MB of prebuilt code buys nothing.
      #:strip-binaries? #f
      ;; The extracted tree is copied verbatim into share/antigravity so
      ;; Electron finds resources/ beside its own binary.
      #:install-plan
      #~'(("." "share/antigravity/"))
      ;; patchelf the launcher and the helpers it spawns through the FHS loader.
      ;; The launcher's own libraries (libffmpeg.so, libEGL.so, libGLESv2.so,
      ;; ...) sit beside it, hence the ("out" ...) RUNPATH entries.
      #:wrapper-plan
      #~'(("antigravity" (("out" "/share/antigravity")))
          "chrome-sandbox"
          "chrome_crashpad_handler"
          ("resources/bin/language_server"
           (("out" "/share/antigravity")))
          ("resources/bin/webm_encoder"
           (("out" "/share/antigravity"))))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'binary-unpack)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              ;; The tarball has a single top-level directory.
              (invoke "tar" "xzf" source)
              (chdir "Antigravity-x64")))
          (replace 'install-wrapper
            ;; A deliberate replacement for the Chromium build system's own
            ;; wrapper: that one does not put the application's own directory on
            ;; LD_LIBRARY_PATH, where Electron dlopen's libEGL.so and
            ;; libGLESv2.so from.  It also hard-codes the "fontconfig-minimal"
            ;; input label; this version resolves either label.
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (app (string-append out "/share/antigravity"))
                     (exe (string-append out "/bin/antigravity"))
                     (nss (or (assoc-ref inputs "nss") out))
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
                    (,@lib-dirs
                     ,(string-append nss "/lib/nss")
                     ,app
                     ,(string-append app "/resources/bin")))
                  `("PATH" ":" prefix
                    (,@bin-dirs ,(string-append out "/bin")))
                  `("FONTCONFIG_PATH" ":" prefix
                    (,(string-append fontconfig "/etc/fonts")))
                  ;; Electron >= 28: pick Wayland or X11 automatically.
                  `("ELECTRON_OZONE_PLATFORM_HINT" ":" = ("auto")))
                #t)))
          (add-after 'install 'install-desktop-integration
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (app (string-append out "/share/antigravity"))
                     (bin (string-append out "/bin"))
                     (applications (string-append out "/share/applications"))
                     (icon-dir (string-append
                                out "/share/icons/hicolor/256x256/apps")))
                (mkdir-p bin)
                (symlink (string-append app "/antigravity")
                         (string-append bin "/antigravity"))

                ;; Sign-in is driven by the language server, which runs
                ;; `xdg-open' and looks it up in the login-shell PATH it
                ;; hydrates.  That PATH contains ~/.guix-profile/bin but not the
                ;; store paths this package's wrapper adds, so install an
                ;; xdg-open here.  It also puts xdg-utils' own bin directory on
                ;; PATH, because the real xdg-open script shells out to
                ;; xdg-mime/xdg-settings.
                (let ((xdg (assoc-ref inputs "xdg-utils"))
                      (bash (which "bash"))
                      (xdg-open (string-append bin "/xdg-open")))
                  (call-with-output-file xdg-open
                    (lambda (port)
                      (format port "#!~a~%" bash)
                      (format port "export PATH=\"~a/bin${PATH:+:}$PATH\"~%"
                              xdg)
                      (format port "exec -a \"$0\" \"~a/bin/xdg-open\" \"$@\"~%"
                              xdg)))
                  (chmod xdg-open #o555))

                ;; A setuid helper cannot live in the store; Chromium then uses
                ;; the unprivileged user-namespace sandbox.
                (let ((sandbox (string-append app "/chrome-sandbox")))
                  (when (file-exists? sandbox)
                    (chmod sandbox #o755)))

                (mkdir-p applications)
                (call-with-output-file
                    (string-append applications "/antigravity.desktop")
                  (lambda (port)
                    (format port "[Desktop Entry]~%")
                    (format port "Type=Application~%")
                    (format port "Name=Antigravity~%")
                    (format port "Comment=Agent-first coding environment~%")
                    (format port "Exec=~a %U~%"
                            (string-append bin "/antigravity"))
                    (format port "Icon=antigravity~%")
                    (format port "Terminal=false~%")
                    (format port "StartupWMClass=antigravity~%")
                    (format port "Categories=Development;~%")
                    (format port "Keywords=agent;code;ai;gemini;~%")
                    ;; Declare the OAuth callback scheme so the desktop
                    ;; database indexes this entry as its handler; the app
                    ;; registers `antigravity://' itself, but Chromium only
                    ;; hands the redirect back if the handler is known.
                    (format port "MimeType=x-scheme-handler/antigravity;~%")
                    (format port "StartupNotify=true~%")))

                (mkdir-p icon-dir)
                (copy-file #$%antigravity-icon
                           (string-append icon-dir "/antigravity.png"))
                #t))))))
    ;; The Go language server opens the browser by exec'ing `xdg-open',
    ;; searching the login-shell PATH it hydrates (which includes
    ;; ~/.guix-profile/bin but not this package's wrapper PATH).  Keeping
    ;; xdg-utils as an input lets the install phase drop an xdg-open wrapper in
    ;; bin/ so that it is visible on that PATH.
    (inputs (list xdg-utils))
    (supported-systems '("x86_64-linux"))
    (synopsis "Agent-first coding environment from Google")
    (description
     "Google Antigravity is an agent-first development environment: it pairs an
editor with autonomous agents that plan, edit and run code.  This package
installs upstream's prebuilt Linux @file{x86_64} Electron bundle.  The Electron
runtime is bundled with the application, and the launcher and the helper
programs it spawns are patched to use the store's ELF loader.")
    (home-page "https://antigravity.google/")
    ;; Upstream ships this as a proprietary binary; no free licence is granted.
    (license #f)))
