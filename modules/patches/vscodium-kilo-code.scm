;;; -*- mode: scheme; -*-
;;;
;;; Kilo Code for VSCodium.
;;;
;;; Upstream publishes platform-specific VSIX archives.  The Linux x86_64
;;; archive contains the extension's bundled JavaScript, the Kilo CLI, static
;;; FFmpeg and sandbox helpers, and tree-sitter grammars.  Install that archive
;;; unchanged except for the Kilo CLI's ELF interpreter: upstream names the FHS
;;; loader /lib64/ld-linux-x86-64.so.2, which is absent on Guix System.
;;;
;;; VSCodium has no extension search-path environment variable.  The second
;;; package below therefore rebuilds nonguix's VSCodium with Kilo Code linked
;;; into resources/app/extensions, where the editor discovers its bundled
;;; extensions.  User-installed extensions in ~/.vscode-oss/extensions continue
;;; to work normally.

(define-module (patches vscodium-kilo-code)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (gnu packages base)          ; glibc
  #:use-module (gnu packages compression)   ; unzip
  #:use-module (gnu packages elf)           ; patchelf
  #:use-module (nongnu packages editors))   ; vscodium

(define %kilo-code-extension-path
  "/share/vscodium/extensions/kilocode.kilo-code")

(define-public vscodium-kilo-code
  (package
    (name "vscodium-kilo-code")
    (version "7.8.27")                ; latest stable, non-pre-release tag
    (source
     (origin
       (method url-fetch)
       (uri
        (string-append
         "https://github.com/Kilo-Org/kilocode/releases/download/v"
         version "/kilo-vscode-linux-x64.vsix"))
       (file-name (string-append name "-" version "-linux-x64.vsix"))
       (sha256
        (base32 "1capkvzz70gr17zmp84dpyfyaa8vfvagy3z60xfv52b50hzpvqmq"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((source (assoc-ref %build-inputs "source"))
                 (unzip (assoc-ref %build-inputs "unzip"))
                 (patchelf (assoc-ref %build-inputs "patchelf"))
                 (glibc (assoc-ref %build-inputs "glibc"))
                 (extension
                  (string-append %output #$%kilo-code-extension-path))
                 (kilo (string-append extension "/bin/kilo")))
            (invoke (string-append unzip "/bin/unzip") "-q" source)
            (mkdir-p (dirname extension))
            (copy-recursively "extension" extension
                              #:log (%make-void-port "w")
                              #:keep-permissions? #t)

            ;; --extensions-dir expects this manifest even when the directory
            ;; is read-only.  Absolute locations deliberately name the store;
            ;; relativeLocation tells VSCodium which subdirectory to scan.
            (call-with-output-file
                (string-append (dirname extension) "/extensions.json")
              (lambda (port)
                (format port
                        (string-append
                         "[{\"identifier\":{\"id\":\"kilocode.kilo-code\","
                         "\"uuid\":\"\"},\"version\":~s,"
                         "\"relativeLocation\":\"kilocode.kilo-code\","
                         "\"location\":{\"$mid\":1,\"fsPath\":~s,"
                         "\"path\":~s,\"scheme\":\"file\"},"
                         "\"metadata\":{\"id\":\"\",\"publisherId\":\"\","
                         "\"publisherDisplayName\":\"kilocode\","
                         "\"targetPlatform\":\"undefined\","
                         "\"isApplicationScoped\":false,\"updated\":false,"
                         "\"isPreReleaseVersion\":false,"
                         "\"installedTimestamp\":0,\"preRelease\":false}}]~%")
                        #$version extension extension)))

            ;; Kilo is a Bun single-file executable.  Its JavaScript payload is
            ;; in an ELF section, so patchelf preserves it while changing the
            ;; interpreter; do not strip the executable afterwards.
            (invoke (string-append patchelf "/bin/patchelf")
                    "--set-interpreter"
                    (string-append glibc "/lib/ld-linux-x86-64.so.2")
                    kilo)

            ;; Besides checking that the CLI starts, this catches accidental
            ;; corruption of Bun's embedded payload during ELF patching.  Kilo
            ;; creates its configuration directory even for --version, so give
            ;; it a writable home instead of the sandbox's /homeless-shelter.
            (setenv "HOME" (getcwd))
            (invoke kilo "--version")))))
    (native-inputs (list unzip patchelf))
    (inputs (list glibc))
    (supported-systems '("x86_64-linux"))
    (home-page "https://kilo.ai/")
    (synopsis "Kilo Code AI coding agent extension for VSCodium")
    (description
     "Kilo Code is an open-source AI coding agent that generates code from
natural language, automates tasks and runs terminal commands.  It also provides
inline completion, browser automation, automated refactoring and configurable
planning, coding and debugging modes.

This package installs upstream's Linux x86_64 VSIX under
@file{share/vscodium/extensions}.  It includes prebuilt native helpers.  Use
@code{vscodium-with-kilo-code} for an editor that discovers the extension
automatically, or pass this directory with VSCodium's
@option{--extensions-dir} option.  An AI provider account or API key is needed
for model requests.")
    (license license:expat)))

(define-public vscodium-with-kilo-code
  (package
    (inherit vscodium)
    (name "vscodium-with-kilo-code")
    (arguments
     (substitute-keyword-arguments (package-arguments vscodium)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'install-kilo-code-extension
              (lambda* (#:key inputs #:allow-other-keys)
                (let ((extensions
                       "opt/vscodium/resources/app/extensions"))
                  (mkdir-p extensions)
                  (symlink
                   (string-append
                    (assoc-ref inputs "vscodium-kilo-code")
                    #$%kilo-code-extension-path)
                   (string-append extensions "/kilocode.kilo-code")))))))))
    (inputs
     (modify-inputs (package-inputs vscodium)
       (prepend vscodium-kilo-code)))
    ;; The base VSCodium recipe supports other architectures, but this VSIX is
    ;; specifically upstream's glibc-linked Linux x86_64 build.
    (supported-systems '("x86_64-linux"))
    (synopsis "VSCodium with the Kilo Code AI coding agent")
    (description
     "This is nonguix's VSCodium package with the Kilo Code extension included
as a bundled extension.  Kilo Code can be disabled in the Extensions view but,
like VSCodium's other bundled extensions, it is not uninstalled separately.
Extensions installed in @file{~/.vscode-oss/extensions} remain available.")))
