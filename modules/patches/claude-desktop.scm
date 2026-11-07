;;; -*- mode: scheme; -*-
;;;
;;; claude-desktop --- Anthropic's Claude desktop application.
;;;
;;; Upstream ships the Linux beta as a Debian package (amd64 and arm64) from
;;; its APT repository.  The .deb is an Electron bundle under
;;; /usr/lib/claude-desktop:
;;;
;;;   claude-desktop           the Electron runtime
;;;   chrome_crashpad_handler
;;;   chrome-sandbox
;;;   resources/app.asar       the application
;;;   resources/virtiofsd      bundled helper for Cowork's QEMU VM
;;;   resources/chrome-native-host
;;;   resources/disclaimer
;;;
;;; It is packaged with nonguix's chromium-binary-build-system, which extracts
;;; the .deb, supplies the Electron library set, patches FHS interpreters to
;;; the store's loader, and wraps the launcher with the matching
;;; LD_LIBRARY_PATH.  The Electron runtime is the one bundled in the deb, so
;;; the native modules built for its ABI keep working.
;;;
;;; Cowork additionally wants QEMU, OVMF and KVM at run time.  virtiofsd is
;;; included in the bundle; install qemu and ovmf-x86-64 in the same profile
;;; (and make sure /dev/kvm is accessible) if you want Cowork.  The rest of the
;;; app -- Chat, Claude Code, projects and local files -- does not need them.
;;;
;;; chrome-sandbox cannot keep its setuid bit in the store; Chromium uses the
;;; unprivileged user-namespace sandbox, which works on Guix System with the
;;; stock kernel configuration.

(define-module (patches claude-desktop)
  #:use-module (gnu packages admin)      ; libcap-ng, needed by virtiofsd
  #:use-module (gnu packages bash)       ; bash-minimal, for the wrapper
  #:use-module (gnu packages linux)      ; libseccomp, needed by virtiofsd
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (nonguix build-system chromium-binary)
  #:use-module (nonguix licenses))

(define-public claude-desktop
  (package
    (name "claude-desktop")
    (version "4.23118.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://downloads.claude.ai/claude-desktop/apt/stable/"
             "pool/main/c/claude-desktop/claude-desktop_"
             version "_amd64.deb"))
       (file-name (string-append name "-" version ".deb"))
       (sha256
        (base32 "15ssa6bqhwnkp0anyxbiyf29vfxn1k252q34fjrwj1dbrbl9dn8s"))))
    (build-system chromium-binary-build-system)
    (arguments
     (list
      ;; Native modules under resources/app.asar.unpacked are dlopen'd and
      ;; carry no RUNPATH of their own; the wrapper's LD_LIBRARY_PATH
      ;; satisfies them.
      #:validate-runpath? #f
      ;; The payload is already stripped by upstream; stripping prebuilt
      ;; Electron code buys nothing.
      #:strip-binaries? #f
      #:install-plan
      #~'(("usr/lib/claude-desktop/" "share/claude-desktop/")
          ("usr/share/applications/com.anthropic.Claude.desktop"
           "share/applications/com.anthropic.Claude.desktop")
          ("usr/share/icons/" "share/icons/")
          ("usr/share/doc/claude-desktop/" "share/doc/claude-desktop/")
          ("usr/lib/claude-desktop/resources/linux-mime/com.anthropic.Claude.xml"
           "share/mime/packages/com.anthropic.Claude.xml"))
      ;; Patch the Electron launcher and every helper that still carries an
      ;; FHS interpreter.  The app directory is on the Electron binary's
      ;; RUNPATH for libffmpeg.so, libvk_swiftshader.so and libvulkan.so.1.
      #:wrapper-plan
      #~'(("usr/lib/claude-desktop/claude-desktop"
           (("out" "/share/claude-desktop")))
          "usr/lib/claude-desktop/chrome_crashpad_handler"
          "usr/lib/claude-desktop/chrome-sandbox"
          "usr/lib/claude-desktop/libffmpeg.so"
          "usr/lib/claude-desktop/libvk_swiftshader.so"
          "usr/lib/claude-desktop/libvulkan.so.1"
          "usr/lib/claude-desktop/resources/chrome-native-host"
          "usr/lib/claude-desktop/resources/disclaimer"
          "usr/lib/claude-desktop/resources/virtiofsd")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install-wrapper 'install-launcher
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin"))
                     (app (string-append out "/share/claude-desktop"))
                     (bash (which "bash")))
                (mkdir-p bin)
                (call-with-output-file (string-append bin "/claude-desktop")
                  (lambda (port)
                    (format port "#!~a~%exec \"~a/claude-desktop\" \"$@\"~%"
                            bash app)))
                (chmod (string-append bin "/claude-desktop") #o555)
                ;; A setuid helper cannot live in the store; Chromium then
                ;; uses the unprivileged user-namespace sandbox.
                (let ((sandbox (string-append app "/chrome-sandbox")))
                  (when (file-exists? sandbox)
                    (chmod sandbox #o755)))
                #t)))
          (add-after 'install-wrapper 'extend-ld-library-path
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (app (string-append out "/share/claude-desktop")))
                (wrap-program (string-append out "/bin/claude-desktop")
                  `("LD_LIBRARY_PATH" ":" prefix (,app)))
                #t))))))
    ;; virtiofsd, which Cowork uses to share the project directory with its
    ;; VM, is dynamically linked against libseccomp and libcap-ng.  The
    ;; Chromium library set does not include them, so name them explicitly.
    (inputs
     (list bash-minimal libcap-ng libseccomp))
    (supported-systems '("x86_64-linux"))
    (synopsis "Claude desktop application")
    (description
     "Claude Desktop is Anthropic's desktop client for Chat, Cowork and Claude
Code, with parallel sessions, visual diff review and an integrated terminal.
This package installs upstream's @file{x86_64} Debian package for the Linux
beta, including the Electron runtime bundled with it.  The launcher and the
helper programs it spawns are patched to use the store's ELF loader.")
    (home-page "https://claude.com/download")
    ;; Upstream ships this as a proprietary binary; no free licence is granted.
    (license (nonfree "https://www.anthropic.com/legal/consumer-terms"))))
