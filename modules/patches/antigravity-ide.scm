;;; -*- mode: scheme; -*-
;;;
;;; antigravity-ide --- Google's VS Code-based Antigravity IDE.
;;;
;;; This is the standalone IDE, not Antigravity Hub from (patches antigravity).
;;; T3 Code discovers its CLI as "antigravity-ide" or "agy-ide" and launches
;;; files with --goto.  Upstream supplies the former in bin/ and declares the
;;; latter as aliasName in product.json.
;;;

(define-module (patches antigravity-ide)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages freedesktop)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (nonguix build-system chromium-binary)
  #:use-module (nonguix licenses))

(define %antigravity-ide-build "2.6.0-5526304964083712")

(define-public antigravity-ide
  (package
    (name "antigravity-ide")
    (version "2.6.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/"
             "stable/" %antigravity-ide-build
             "/linux-x64/Antigravity%20IDE.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "0mj3z6k6xdbl34qx81yjlx0x5388lgkqwbvm36vb40wicz3sfq5h"))))
    (build-system chromium-binary-build-system)
    (arguments
     (list
      #:validate-runpath? #f
      #:strip-binaries? #f
      #:install-plan
      #~'(("." "share/antigravity-ide/"))
      #:wrapper-plan
      #~'(("antigravity-ide" (("out" "/share/antigravity-ide")))
          "chrome-sandbox"
          "chrome_crashpad_handler"
          "libffmpeg.so"
          "libvk_swiftshader.so"
          "libvulkan.so.1"
          ("resources/app/node_modules/@vscode/ripgrep/bin/rg"
           (("out" "/share/antigravity-ide"))))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'binary-unpack)
          (replace 'unpack
            (lambda* (#:key source #:allow-other-keys)
              (invoke "tar" "xzf" source)
              (chdir "Antigravity IDE")))
          (add-before 'install-wrapper 'install-cli-and-desktop-integration
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (app (string-append out "/share/antigravity-ide"))
                     (bin (string-append out "/bin"))
                     (applications (string-append out "/share/applications"))
                     (icon-dir (string-append
                                out "/share/icons/hicolor/256x256/apps")))
                (mkdir-p bin)
                (symlink (string-append app "/bin/antigravity-ide")
                         (string-append bin "/antigravity-ide"))
                (symlink (string-append app "/bin/antigravity-ide")
                         (string-append bin "/agy-ide"))

                (let ((sandbox (string-append app "/chrome-sandbox")))
                  (when (file-exists? sandbox)
                    (chmod sandbox #o755)))

                (mkdir-p applications)
                (call-with-output-file
                    (string-append applications "/antigravity-ide.desktop")
                  (lambda (port)
                    (format port "[Desktop Entry]~%")
                    (format port "Type=Application~%")
                    (format port "Name=Antigravity IDE~%")
                    (format port "Comment=Agent-first coding environment~%")
                    (format port "Exec=~a %U~%"
                            (string-append bin "/antigravity-ide"))
                    (format port "Icon=antigravity-ide~%")
                    (format port "Terminal=false~%")
                    (format port "StartupWMClass=antigravity-ide~%")
                    (format port "Categories=Development;~%")
                    (format port "Keywords=agent;code;ai;gemini;~%")
                    (format port "MimeType=x-scheme-handler/antigravity-ide;~%")
                    (format port "StartupNotify=true~%")))

                (mkdir-p icon-dir)
                (copy-file (string-append
                            app "/resources/app/resources/linux/code.png")
                           (string-append icon-dir "/antigravity-ide.png"))
                #t)))
          (add-after 'install-wrapper 'wrap-cli-runtime
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (app (string-append out "/share/antigravity-ide"))
                     (xdg (assoc-ref inputs "xdg-utils")))
                (for-each
                 (lambda (name)
                   (wrap-program (string-append out "/bin/" name)
                     `("LD_LIBRARY_PATH" ":" prefix (,app))
                     `("PATH" ":" prefix (,(string-append xdg "/bin")))))
                 '("antigravity-ide" "agy-ide"))
                #t))))))
    (inputs (list bash-minimal xdg-utils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://antigravity.google/")
    (synopsis "Google's VS Code-based Antigravity IDE")
    (description
     "Antigravity IDE is Google's standalone agent-first editor, based on VS
Code.  This package installs the official Linux Electron bundle and its CLI as
both @command{antigravity-ide} and @command{agy-ide}, including support for
opening files with @option{--goto}.  It is separate from Antigravity Hub.")
    (license (nonfree "https://antigravity.google/terms"))))
