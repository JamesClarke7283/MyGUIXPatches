;;; GNU Guix --- Functional package management for GNU
;;;
;;; Bun runtime for the oh-my-pi package.
;;;
;;; IMPORTANT — why this package wraps the binary instead of patching it:
;;;
;;; Upstream Bun cannot be built from source in Guix's offline build
;;; sandbox.  Its build is self-hosting (bun's own docs: "Before starting,
;;; you will need to already have a release build of Bun installed, as we
;;; use our bundler to transpile and minify our code, as well as for code
;;; generation scripts"), it pins a Rust *nightly* toolchain that is
;;; installed through rustup (a network fetch), and it requires an exact
;;; Zig version which Guix does not carry.  So, like nix-bun, this package
;;; repackages the official static-ish release artifact.
;;;
;;; The release binary is ET_EXEC with PT_INTERP pointing at the FHS
;;; loader /lib64/ld-linux-x86-64.so.2, which does not exist on Guix.
;;; Running `patchelf --set-interpreter' on it *appears* to work (patchelf
;;; rewrites and then reports the new interpreter) but the resulting file
;;; segfaults on exec, because bun's binary carries a large payload after
;;; the section headers and patchelf's rewriting of those headers corrupts
;;; it.  Instead we keep the binary pristine in libexec/ and ship a tiny
;;; wrapper that runs it through the store's glibc ELF loader:
;;;
;;;   ld-linux-x86-64.so.2 --library-path <glibc>/lib <out>/libexec/bun/bun
;;;
;;; which is verified to work:
;;;
;;;   $ bun --version
;;;   1.4.4

(define-module (patches bun)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix build-system trivial)
  #:use-module (guix licenses)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression))

(define-public bun
  (package
    (name "bun")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/oven-sh/bun/releases/download/"
                           "bun-v" version "/bun-linux-x64.zip"))
       (sha256
        (base32 "0p1rrgy55nry189wdnrlfl3xib8pag2iavcs1yg1b00b5gxwp35z"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let* ((out     (assoc-ref %outputs "out"))
                (source  (assoc-ref %build-inputs "source"))
                (unzip   (string-append (assoc-ref %build-inputs "unzip")
                                        "/bin/unzip"))
                (bash    (string-append (assoc-ref %build-inputs "bash")
                                        "/bin/bash"))
                (glibc   (assoc-ref %build-inputs "glibc"))
                (loader  (string-append glibc "/lib/ld-linux-x86-64.so.2"))
                (libdir  (string-append glibc "/lib"))
                (bin     (string-append out "/bin"))
                (libexec (string-append out "/libexec/bun"))
                (bun     (string-append libexec "/bun")))

           ;; The archive contains a single top-level directory,
           ;; "bun-linux-x64", holding the "bun" executable.
           (invoke unzip "-o" source "-d" ".")

           (mkdir-p libexec)
           (mkdir-p bin)

           ;; Keep the binary byte-for-byte pristine; see the note at the
           ;; top of this file for why patchelf is not used here.
           (copy-file "bun-linux-x64/bun" bun)
           (chmod bun #o555)

           (let ((wrapper (string-append bin "/bun")))
             (call-with-output-file wrapper
               (lambda (port)
                 (format port "#!~a~%exec ~a --library-path ~a ~a \"$@\"~%"
                         bash loader libdir bun)))
             (chmod wrapper #o555))))))
    (native-inputs
     (list unzip))
    (inputs
     (list bash glibc))
    ;; Only the x86_64-linux release artifact is packaged.
    (supported-systems '("x86_64-linux"))
    (synopsis "Fast all-in-one JavaScript, TypeScript and CSS runtime")
    (description
     "Bun is a fast JavaScript and TypeScript runtime, bundler, test runner
and package manager.  This package repackages upstream's official
@code{x86_64-linux} release binary behind a small wrapper that starts it
through the store's glibc ELF loader, since the prebuilt executable expects
the FHS loader path.  It is used as the runtime for @code{oh-my-pi}.")
    (home-page "https://bun.sh")
    (license expat)))
