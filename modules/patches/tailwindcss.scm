;;; -*- mode: scheme; -*-
;;;
;;; tailwindcss --- the standalone Tailwind CSS command-line tool.
;;;
;;; Tailwind CSS 4 is a Rust + TypeScript monorepo.  Upstream publishes a
;;; self-contained CLI executable for each platform as a release asset; that
;;; executable bundles the Oxide engine, the default theme and the CLI, and
;;; needs no Node.js at run time.  Building the monorepo from source would
;;; require pnpm plus its full dependency graph just to produce the same
;;; artifact, so this package installs the released executable.
;;;
;;; The released binary is dynamically linked against glibc and carries
;;; PT_INTERP=/lib64/ld-linux-x86-64.so.2, which Guix System does not provide.
;;; Patching the interpreter to the store's loader leaves the rest of the
;;; binary untouched; in particular, do not strip it, because its Bun payload
;;; is what makes `tailwindcss --version' report Tailwind rather than Bun.

(define-module (patches tailwindcss)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (gnu packages base)       ; glibc
  #:use-module (gnu packages bash)       ; bash-minimal, for the wrapper
  #:use-module (gnu packages elf)        ; patchelf
  #:use-module (gnu packages gcc))       ; gcc:lib, for libgcc_s

(define-public tailwindcss
  (package
    (name "tailwindcss")
    (version "4.3.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/tailwindlabs/tailwindcss/releases/download/"
             "v" version "/tailwindcss-linux-x64"))
       (file-name (string-append name "-" version "-linux-x64"))
       (sha256
        (base32 "05yq76p3w6vjkwhwlpgdqi3hxbfgrffxmrhdq6lqfmc5bg78x6hl"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bash (assoc-ref %build-inputs "bash-minimal"))
                 (bin (string-append out "/bin"))
                 (libexec (string-append out "/libexec/tailwindcss"))
                 (real (string-append libexec "/tailwindcss"))
                 (program (string-append bin "/tailwindcss"))
                 (patchelf (string-append
                            (assoc-ref %build-inputs "patchelf") "/bin/patchelf"))
                 (gcc-lib (assoc-ref %build-inputs "gcc"))
                 (loader (string-append
                          (assoc-ref %build-inputs "glibc")
                          "/lib/ld-linux-x86-64.so.2")))
            (mkdir-p bin)
            (mkdir-p libexec)
            (copy-file (assoc-ref %build-inputs "source") real)
            (chmod real #o755)
            ;; The released executable carries the FHS loader path.  The
            ;; embedded lightningcss native module also dlopen()s libgcc_s,
            ;; which Guix does not put on the default search path.  Set the
            ;; interpreter here and provide libgcc_s through a wrapper rather
            ;; than patching the executable's RPATH: adding a dynamic section
            ;; entry makes the Bun payload crash with SIGSEGV.
            (invoke patchelf "--set-interpreter" loader real)
            (symlink real program)
            (wrap-program program
              #:sh (string-append bash "/bin/bash")
              `("LD_LIBRARY_PATH" prefix (,(string-append gcc-lib "/lib"))))
            ;; A smoke test proves the wrapper, the patched interpreter and
            ;; the embedded native module all work.
            (invoke program "--version")))))
    (native-inputs
     (list patchelf bash-minimal))
    (inputs
     (list glibc (list gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (synopsis "Command-line tool for the Tailwind CSS framework")
    (description
     "Tailwind CSS is a utility-first CSS framework.  This package provides the
standalone @command{tailwindcss} command, which scans HTML, JavaScript and
other source files and generates the matching stylesheet.  The binary bundles
the v4 Oxide engine and the framework's default theme, so it does not need
Node.js or a JavaScript toolchain at run time.")
    (home-page "https://tailwindcss.com/")
    (license expat)))
