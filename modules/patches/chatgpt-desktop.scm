;;; -*- mode: scheme; -*-
;;;
;;; chatgpt-desktop --- OpenAI's ChatGPT desktop application.
;;;
;;; Upstream publishes the Linux preview as Debian and RPM packages, not as a
;;; plain tarball.  The .deb is an Electron bundle under /usr/lib/chatgpt:
;;;
;;;   ChatGPT                  the Electron runtime
;;;   codex-launcher           a two-line shell script that execs ChatGPT
;;;   browser_crashpad_handler
;;;   resources/               app.asar, the bundled Codex binary, native
;;;                            modules, the built-in Chrome extension host and
;;;                            the Computer Use node runtime
;;;
;;; It is packaged with nonguix's chromium-binary-build-system, which already
;;; knows how to extract a .deb, supplies the Electron library set, patches
;;; FHS interpreters to the store's loader, and wraps the launcher with the
;;; matching LD_LIBRARY_PATH.  The Electron runtime is the one bundled in the
;;; deb, so the native modules built for its ABI keep working.
;;;
;;; The bundled chrome-sandbox helper, if present, cannot keep its setuid bit
;;; in the store; Chromium then uses the unprivileged user-namespace sandbox,
;;; which works on Guix System with the stock kernel configuration.
;;;
;;; The .deb has no icon in /usr/share/icons, but the app carries a 1024x1024
;;; PNG that is installed into the hicolor theme for the desktop entry.

(define-module (patches chatgpt-desktop)
  #:use-module (gnu packages bash)       ; bash-minimal, for the wrapper
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (nonguix build-system chromium-binary)
  #:use-module (nonguix licenses))

(define-public chatgpt-desktop
  (package
    (name "chatgpt-desktop")
    (version "26.1103.32239")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://persistent.oaistatic.com/codex-app-prod/linux/deb/"
             "pool/main/c/chatgpt/chatgpt_" version "_amd64.deb"))
       (file-name (string-append name "-" version ".deb"))
       (sha256
        (base32 "1vv42dwbba83x55bv4aq5hwf6hbps9i36bgrvfw2zid2is00ih8q"))))
    (build-system chromium-binary-build-system)
    (arguments
     (list
      ;; Native modules under resources/ are dlopen'd and carry no RUNPATH of
      ;; their own; the wrapper's LD_LIBRARY_PATH satisfies them.
      #:validate-runpath? #f
      ;; The payload is already stripped by upstream; stripping two gigabytes
      ;; of prebuilt code buys nothing and can damage the app.asar payload.
      #:strip-binaries? #f
      #:install-plan
      #~'(("usr/lib/chatgpt/" "share/chatgpt/")
          ("usr/share/applications/chatgpt.desktop"
           "share/applications/chatgpt.desktop")
          ("usr/lib/chatgpt/resources/icon-chatgpt.png"
           "share/icons/hicolor/1024x1024/apps/chatgpt.png"))
      ;; Patch every ELF executable in the bundle that still carries an FHS
      ;; interpreter: the Electron launcher, the crash handler, the Chrome
      ;; extension host, the Computer Use Node runtime and its helpers.
      ;; The app directory is on the Electron binary's RUNPATH for libEGL.so,
      ;; libGLESv2.so, libffmpeg.so and the other libraries shipped beside it.
      #:wrapper-plan
      #~'(("usr/lib/chatgpt/ChatGPT"
           (("out" "/share/chatgpt")))
          "usr/lib/chatgpt/browser_crashpad_handler"
          "usr/lib/chatgpt/libEGL.so"
          "usr/lib/chatgpt/libGLESv2.so"
          "usr/lib/chatgpt/libqt5_shim.so"
          "usr/lib/chatgpt/libqt6_shim.so"
          "usr/lib/chatgpt/libvk_swiftshader.so"
          "usr/lib/chatgpt/libvulkan.so.1"
          "usr/lib/chatgpt/resources/plugins/openai-bundled/plugins/chrome/extension-host/linux/x64/extension-host"
          "usr/lib/chatgpt/resources/cua_node/bin/node"
          "usr/lib/chatgpt/resources/cua_node/lib/node_modules/@oai/sky/bin/linux/sky_linux_x64"
          "usr/lib/chatgpt/resources/cua_node/lib/node_modules/@oai/cua/bin/linux/sky_linux_x64"
          "usr/lib/chatgpt/resources/cua_node/lib/node_modules/.bin/sky_linux_x64")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install-wrapper 'install-launcher
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/chatgpt"))
                     (bash (which "bash")))
                (mkdir-p bin)
                ;; A tiny launcher rather than upstream's codex-launcher: it
                ;; names the app directory absolutely, so wrapping does not
                ;; depend on readlink resolving the launcher's own path.
                (call-with-output-file (string-append bin "/chatgpt")
                  (lambda (port)
                    (format port "#!~a~%exec \"~a/ChatGPT\" \"$@\"~%"
                            bash app)))
                (chmod (string-append bin "/chatgpt") #o555)
                #t)))
          (add-after 'install-wrapper 'extend-ld-library-path
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (app (string-append out "/share/chatgpt")))
                ;; Libraries beside the Electron binary are dlopen'd by name.
                ;; The binary's RUNPATH covers direct dependencies; adding the
                ;; directory to the wrapper's LD_LIBRARY_PATH covers the rest.
                (wrap-program (string-append out "/bin/chatgpt")
                  `("LD_LIBRARY_PATH" ":" prefix (,app)))
                #t))))))
    (inputs
     (list bash-minimal))
    (supported-systems '("x86_64-linux"))
    (synopsis "ChatGPT desktop application")
    (description
     "ChatGPT is OpenAI's desktop client for its AI assistant, with projects,
local files and Codex integration.  This package installs upstream's
@file{x86_64} Debian package for the Linux preview, including the Electron
runtime bundled with it.  The launcher and the helper programs it spawns are
patched to use the store's ELF loader.")
    (home-page "https://chatgpt.com/download/")
    ;; Upstream ships this as a proprietary binary; no free licence is granted.
    (license (nonfree "https://openai.com/policies/terms-of-use/"))))
