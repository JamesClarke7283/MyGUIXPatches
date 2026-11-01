;;; -*- mode: scheme; -*-
;;;
;;; bun-bootstrap --- the prebuilt Bun seed used to build Bun from source.
;;;
;;; Why this package exists
;;; -----------------------
;;; (patches bun) builds Bun from source, but upstream Bun cannot bootstrap
;;; itself: its own CONTRIBUTING.md says
;;;
;;;   "Before starting, you will need to already have a release build of Bun
;;;    installed, as we use our bundler to transpile and minify our code, as
;;;    well as for code generation scripts."
;;;
;;; and the build then runs `bun run build', i.e. the repository's own build
;;; script executed *by Bun*.  There is therefore no way to compile Bun from
;;; source with nothing but C/C++/Rust toolchains: one Bun binary has to exist
;;; first and the source build continues from there.  No Guix package and no
;;; substitute provides one, so this package supplies exactly that seed and
;;; nothing else.  It is a native input of (patches bun) and is not meant to be
;;; installed on its own.
;;;
;;; This is the *only* prebuilt artifact in this channel.  Everything else
;;; (wireguard-go, mullvad-vpn, and Bun itself) is compiled from source.
;;;
;;; Toolchain facts, for the record (Bun 1.4.x is Rust + C++, not Zig)
;;; ------------------------------------------------------------------
;;;   * language:      Rust, pinned to nightly-2026-09-15 by
;;;                    rust-toolchain.toml, with rust-src for -Zbuild-std
;;;   * C/C++:         LLVM/clang 23.1.1, enforced by the build system:
;;;                    "mismatching versions will cause memory allocation
;;;                    failures at runtime"
;;;   * also needs:    cmake, ninja, go, ruby, perl, python, pkg-config,
;;;                    icu4c, libiconv, libtool, automake, coreutils, sed,
;;;                    which, and optionally ccache
;;;
;;; Guix carries clang/lld 23.1.1, so the LLVM pin is satisfied.  The pinned
;;; Rust *nightly* is not in Guix (Guix has stable rust); see (patches bun).
;;;
;;; Why the binary is wrapped instead of patched
;;; --------------------------------------------
;;; The release executable is ET_EXEC with PT_INTERP pointing at the FHS
;;; loader /lib64/ld-linux-x86-64.so.2, which does not exist on Guix System.
;;;
;;; Do not "fix" this with patchelf.  `patchelf --set-interpreter' appears to
;;; succeed --- it rewrites the file and then prints the new interpreter ---
;;; but the result segfaults on exec (exit 139, no output).  Bun's binary
;;; carries a large payload after its section headers, and patchelf's rewrite
;;; of those headers corrupts it.
;;;
;;; Instead the binary is kept byte-for-byte pristine in libexec/ and a small
;;; wrapper runs it through the store's glibc ELF loader:
;;;
;;;   ld-linux-x86-64.so.2 --library-path <glibc>/lib <out>/libexec/bun/bun
;;;
;;; That mechanism was verified by hand against this same artifact:
;;;
;;;   $ ld-linux-x86-64.so.2 --library-path <glibc>/lib ./bun --version
;;;   1.4.4
;;;
;;; `patchelf --print-needed' reports only libc.so.6, libpthread.so.0,
;;; libdl.so.2, libm.so.6 and ld-linux-x86-64.so.2, so glibc alone is enough;
;;; no libstdc++/libgcc is required.
;;;
;;; The sha256 below is for bun-linux-x64.zip (the glibc variant).  The musl
;;; variant, bun-linux-x64-musl.zip, is published with
;;;   0b9bxg9zyzpifc78f6zdjm8ixd5kpnkjbwblx4zqijsdwz2wra55
;;; but it is not statically linked either (it wants /lib/ld-musl-x86_64.so.1),
;;; so it buys nothing over the glibc build here.

(define-module (patches bun-bootstrap)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (guix licenses)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression))

(define-public bun-bootstrap
  (package
    (name "bun-bootstrap")
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

           ;; The archive holds a single top-level directory, "bun-linux-x64",
           ;; containing the "bun" executable.
           (invoke unzip "-o" source "-d" ".")

           (mkdir-p libexec)
           (mkdir-p bin)

           ;; Keep the binary byte-for-byte pristine; see the note at the top
           ;; of this file for why patchelf is deliberately not used.
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
    (synopsis "Prebuilt Bun binary used to bootstrap the Bun source build")
    (description
     "This package installs upstream's official @code{x86_64-linux} Bun release
binary, kept unmodified in @file{libexec/bun/bun} and started through a small
wrapper that execs it with the store's glibc ELF loader, since the prebuilt
executable expects the FHS loader path @file{/lib64/ld-linux-x86-64.so.2}.

Bun's build is self-hosting: upstream's build scripts are themselves run by
Bun, so a release build of Bun is a hard prerequisite for compiling Bun from
source.  This package provides that seed and is consumed as a native input by
@code{bun} in @code{(patches bun)}.  Do not install it on its own; use
@code{bun} instead.")
    (home-page "https://bun.sh")
    (license expat)))
