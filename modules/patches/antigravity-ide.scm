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
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages freedesktop)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (nonguix build-system chromium-binary)
  #:use-module (nonguix licenses))

(define %antigravity-ide-build "2.8.0-6733682917113856")
(define %antigravity-cli-version "1.5.13")
(define %antigravity-cli-build "5999302598852608")
(define %antigravity-cli-sha512
  "014b37387703acab1f47cd532c8bb60167a6a3537b0f9891de03f1b1ffa9614307bc83c4b2f7551273b0877d722716b0cd9e26782f6b2a50705db4f05e18c68f")
(define %antigravity-cli-release-base-url
  (string-append "https://antigravity-cli-auto-updater-974169037036."
                 "us-central1.run.app"))

;; The IDE downloads this binary into ~/.gemini/bin/agy at run time.  Bundle the
;; same release so its ELF interpreter can be patched before the IDE starts it.
(define %antigravity-cli-source
  (origin
    (method url-fetch)
    (uri (string-append
          "https://storage.googleapis.com/antigravity-public/antigravity-cli/"
          %antigravity-cli-version "-" %antigravity-cli-build
          "/linux-x64/cli_linux_x64.tar.gz"))
    (file-name "agy_cli_linux_x64.tar.gz")
    (sha256
     (base32 "1cnlc1hcqy9dznqi8irnncmgbc61hrm40z337mln55fhy1nwrabz"))))

(define-public antigravity-ide
  (package
    (name "antigravity-ide")
    (version "2.8.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/"
             "stable/" %antigravity-ide-build
             "/linux-x64/Antigravity%20IDE.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1mwphprn33cks2rxhi4svdc58c76gf7qp5dg05hv8p18mfx3dakv"))))
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
          (add-before 'install-wrapper 'install-backend
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (app (string-append out "/share/antigravity-ide"))
                     (backend-dir (string-append app "/libexec/antigravity-cli"))
                     (backend (string-append backend-dir "/agy"))
                     (installer (string-append backend-dir "/install-backend"))
                     (loader (string-append
                              (assoc-ref inputs "glibc")
                              "/lib/ld-linux-x86-64.so.2"))
                     (bash (which "bash")))
                (mkdir-p backend-dir)
                (invoke "tar" "xzf" #$%antigravity-cli-source
                        "-C" backend-dir "antigravity")
                (rename-file (string-append backend-dir "/antigravity") backend)
                (chmod backend #o755)
                (invoke "patchelf" "--set-interpreter" loader backend)
                (invoke backend "--version")

                ;; Point the extension's fixed per-user path at the patched,
                ;; package-managed binary.  Fresh sidecar statistics and a fresh
                ;; release-check timestamp let it start immediately without an
                ;; update download.  The launcher also disables periodic update
                ;; checks; upgrading this package upgrades the backend.
                (call-with-output-file installer
                  (lambda (port)
                    (format port "#!~a
set -euo pipefail
backend_dir=\"$HOME/.gemini/bin\"
target=\"${0%/*}/agy\"
mkdir -p \"$backend_dir\"
ln -sfn \"$target\" \"$backend_dir/agy\"
rm -f \"$backend_dir/agy.next\"
now=$(date +%s%3N)
size=$(stat -c %s \"$target\")
mtime_ms=$(( $(stat -c %Y \"$target\") * 1000 ))
ino=$(stat -c %i \"$target\")
cat > \"$backend_dir/agy.version.json.tmp.$$\" <<EOF
{
  \"schemaVersion\": 1,
  \"version\": \"~a\",
  \"size\": $size,
  \"mtimeMs\": $mtime_ms,
  \"ino\": $ino,
  \"installedAt\": $now,
  \"sha512\": \"~a\",
  \"releaseBaseUrl\": \"~a\",
  \"lastCheckAt\": $now
}
EOF
mv \"$backend_dir/agy.version.json.tmp.$$\" \"$backend_dir/agy.version.json\"
"
                            bash #$%antigravity-cli-version
                            #$%antigravity-cli-sha512
                            #$%antigravity-cli-release-base-url)))
                (chmod installer #o555)
                #t)))
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

                (substitute* (string-append app "/bin/antigravity-ide")
                  (("^ELECTRON_RUN_AS_NODE=1 ")
                   (string-append
                    "\"$VSCODE_PATH/libexec/antigravity-cli/install-backend\"\n"
                    "export ANTIGRAVITY_PERIODIC_UPDATE_CHECK_INTERVAL_MS=0\n"
                    "export AGY_CLI_DISABLE_AUTO_UPDATE=1\n"
                    "ELECTRON_RUN_AS_NODE=1 ")))

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
    (inputs (list bash-minimal glibc xdg-utils))
    (supported-systems '("x86_64-linux"))
    (home-page "https://antigravity.google/")
    (synopsis "Google's VS Code-based Antigravity IDE")
    (description
     "Antigravity IDE is Google's standalone agent-first editor, based on VS
Code.  This package installs the official Linux Electron bundle and its CLI as
both @command{antigravity-ide} and @command{agy-ide}, including support for
opening files with @option{--goto}.  It is separate from Antigravity Hub.")
    (license (nonfree "https://antigravity.google/terms"))))
