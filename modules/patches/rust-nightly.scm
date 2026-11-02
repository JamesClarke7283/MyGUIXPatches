;;; -*- mode: scheme; -*-
;;;
;;; rust-nightly --- the exact Rust toolchain that Bun pins.
;;;
;;; Why this package exists
;;; -----------------------
;;; Bun's rust-toolchain.toml pins:
;;;
;;;   channel = "nightly-2026-09-15"
;;;   components = ["rust-src", "rustfmt", "clippy", "miri", "llvm-tools"]
;;;
;;; and scripts/build/rust.ts passes nightly-only flags to rustc:
;;;
;;;   -Zbuild-std=core,alloc,std,proc_macro,panic_abort
;;;   -Ztune-cpu=<cpu>
;;;
;;; A stable rustc rejects every -Z flag outright, so Bun's Rust half cannot be
;;; built with the stable `rust' in (gnu packages rust), whatever else is fixed.
;;;
;;; The LLVM pin also has to line up.  Bun enforces clang 23.1.1 ("mismatching
;;; versions will cause memory allocation failures at runtime") and refuses to
;;; start the build when rustc's LLVM differs:
;;;
;;;   error: clang is LLVM 23.1.1 and rustc's LLVM is 21.1.8;
;;;          they have to be the same major version
;;;
;;; Verified against this exact toolchain:
;;;
;;;   $ rustc -vV
;;;   rustc 1.100.0-nightly (574ff7d98 2026-09-14)
;;;   LLVM version: 23.1.1
;;;
;;; which matches Guix's clang and lld 23.1.1 exactly.
;;;
;;; Provenance, and why these are prebuilt
;;; -------------------------------------
;;; These are upstream's published binaries for the pinned nightly, not a source
;;; build.  Building rustc from source at a specific nightly commit means
;;; building a whole compiler (hours, ~20 GB) and still needing a stage-0
;;; compiler to do it.  Since the point of this package is to provide the exact
;;; nightly Bun pins, and upstream publishes it, that is what is packaged.  The
;;; matching rustc-nightly-src.tar.xz is what a from-source version would use.
;;;
;;; Only x86_64-linux is packaged.  Another host means adding the matching
;;; rustc/cargo/rust-src tarballs with their own hashes; the URLs follow the same
;;; pattern with the triplet substituted.
;;;
;;; Why the wrappers are C and not shell scripts
;;; -------------------------------------------
;;; The toolchain binaries are ordinary dynamically linked ELFs that expect the
;;; FHS loader, so they must be started through the store's glibc loader.
;;; Unlike Bun's binary they could be patched with patchelf (nothing is appended
;;; after their section headers), but compiled C shims are used for the same
;;; reason as in bun-bootstrap: build systems treat a compiler's path as an
;;; opaque command prefix, and a real ELF is far less surprising there than a
;;; #!/bin/sh script.
;;;
;;; Three shared libraries are needed, hence --library-path rather than just an
;;; interpreter.  Discovered by iterating on the loader error, which named them
;;; one at a time:
;;;
;;;   $ ld-linux-x86-64.so.2 --library-path <glibc> ./rustc --version
;;;   error while loading shared libraries: libgcc_s.so.1: cannot open ...
;;;
;;;   libgcc_s.so.1  (gcc:lib)
;;;   libz.so.1      (zlib)
;;;   libc.so.6      (glibc)
;;;
;;; rust-src is installed where rustup would put it --- lib/rustlib/src/rust ---
;;; library sources.
(define-module (patches rust-nightly)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module ((guix licenses) #:hide (zlib))
  #:use-module (gnu packages base)
  #:use-module (gnu packages commencement)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages gcc))


;;; The pinned channel.  Keep in step with rust-toolchain.toml in the Bun source
;;; tree; Bun's own source lint enforces that the two agree.
(define %rust-nightly-date "2026-09-15")

(define %rust-nightly-base
  "https://static.rust-lang.org/dist")

;;; Hashes for each component of the pinned nightly, x86_64-linux.
(define %rust-nightly-hashes
  '(("rustc"     . "178lqlffpf9xgvj4n4y3wwhshq9qzar1iqid7z44hvgdipl0dizc")
    ("cargo"     . "19s775j8f8akpc1s0zpa4ihrv5jp2m9z5flag4pm6li2mkl4lw6m")
    ("rustc-nightly-src" . "1srpxy7dknzf07fpqdgq07pzma7a8b1bkqjl87cq035306l5x6r1")))

(define* (rust-nightly-component component triplet #:key (as-package? #f))
  "Return COMPONENT of the pinned nightly built for TRIPLET, as an origin, or as
a trivial package carrying the tarball when AS-PACKAGE? is true.

TRIPLET is #f for components that are not target specific, such as rust-src.

Origins cannot be passed in a package's inputs (Guix rejects them), so the
tarball components are wrapped in one-file packages, which also keeps each
hash next to the version it belongs to."
  (let* ((stem (if triplet
                   (string-append component "-nightly-" triplet)
                   component))
         (file (string-append stem ".tar.xz"))
         (hash (assoc-ref %rust-nightly-hashes component)))
    (unless hash
      (error "no known hash for Rust component" component))
    (if as-package?
        (package
          (name (string-append "rust-nightly-"
                               (string-map (lambda (c)
                                             (if (char=? c #\_) #\- c))
                                           component)))
          (version %rust-nightly-date)
          (source
           (origin
             (method url-fetch)
             (uri (string-append %rust-nightly-base "/" %rust-nightly-date
                                 "/" file))
             (file-name (string-append stem "-" %rust-nightly-date ".tar.xz"))
             (sha256 (base32 hash))))
          (build-system trivial-build-system)
          (arguments
           (list #:modules '((guix build utils))
                 #:builder
                 #~(begin
                     (use-modules (guix build utils))
                     (let ((out (assoc-ref %outputs "out")))
                       (mkdir-p out)
                       (copy-file (assoc-ref %build-inputs "source")
                                  (string-append out "/component.tar.xz"))))))
          (synopsis "Upstream tarball for a component of the pinned Rust nightly")
          (description
           "This package carries one tarball from the Rust nightly channel that
Bun pins.  It exists so the tarball can be passed as an ordinary build input;
the @code{rust-nightly} package does the actual installation.")
          (home-page "https://rust-lang.org")
          (license (list expat asl2.0)))
        (origin
          (method url-fetch)
          (uri (string-append %rust-nightly-base "/" %rust-nightly-date
                              "/" file))
          (file-name (string-append stem "-" %rust-nightly-date ".tar.xz"))
          (sha256 (base32 hash))))))

(define-public rust-nightly
  (package
    (name "rust-nightly")
    ;; Named after the pinned channel: nightly-2026-09-15.
    (version (string-append "nightly-" %rust-nightly-date))
    (source (rust-nightly-component "rustc" "x86_64-unknown-linux-gnu"))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((patches rust-nightly-build)
                   (guix build utils))
           ;; The builder is a module-level procedure; passing it through means
           ;; the wrapper-generation code lives outside the gexp, where its
           ;; parenthesis structure is far easier to keep right.
           #:builder
           #~(begin
               (use-modules (patches rust-nightly-build))
               (build-rust-nightly %build-inputs %outputs))))
    (native-inputs
     ;; Build-time only: none of these belong in the toolchain's closure.
     (list tar
           xz
           binutils
           gcc-toolchain
           ;; Labelled so the builder can find them by name; they are only
           ;; source tarballs, consumed during the build.
           (rust-nightly-component "cargo" "x86_64-unknown-linux-gnu" #:as-package? #t)
           (rust-nightly-component "rustc-nightly-src" #f #:as-package? #t)))
    (inputs
     (list glibc
           (list gcc "lib")
           zlib))
    (supported-systems '("x86_64-linux"))
    (synopsis "Rust toolchain at the nightly Bun pins, with rust-src")
    (description
     "This package provides @command{rustc}, @command{cargo} and
@command{rustdoc} from the Rust nightly channel that Bun's
@file{rust-toolchain.toml} pins (nightly-2026-09-15), together with the
@code{rust-src} component.

It exists because Bun's Rust half cannot be built with a stable compiler: its
build passes nightly-only flags (@code{-Zbuild-std} and @code{-Ztune-cpu}) that
stable rustc rejects outright.  Bun also refuses to build unless rustc's LLVM
matches the clang it compiles with, so this toolchain is pinned to LLVM 23.1.1,
the same version Guix ships as @code{clang} and @code{lld}.

These are upstream's published binaries for that nightly, wrapped in small
compiled shims that start them through the store's glibc loader, since they
expect the FHS loader path that Guix System does not have.  Building rustc from
source at a specific nightly commit takes hours and still needs a stage-0
compiler; since the point is to match one exact channel, upstream's artifact is
used instead.  The matching @file{rustc-nightly-src.tar.xz} is what a
from-source version of this package would build from.

The @code{rust-src} component is installed in @file{lib/rustlib/src/rust}, which
is where cargo looks when @code{-Zbuild-std} asks for the standard library
sources.")
    (home-page "https://rust-lang.org")
    ;; Upstream dual-licenses under MIT or Apache-2.0.
    (license (list expat asl2.0))))

;;;
;;; Stable Rust, for packages that need something newer than Guix's 1.93.0.
;;;

(define %rust-stable-version "1.99.1")

;;; Return a package carrying COMPONENT of the stable release, so it can be
;;; passed as an ordinary input (Guix rejects raw origins in a package's inputs).
;;; rust-src has no target triplet in its file name; rustc and rust-std do.
(define (rust-stable-carrier name component)
  (let* ((has-triplet (not (string=? component "rust-src")))
         (file (if has-triplet
                   (string-append component "-" %rust-stable-version
                                  "-x86_64-unknown-linux-gnu.tar.xz")
                   (string-append component "-" %rust-stable-version ".tar.xz")))
         (hash (cond ((string=? component "rustc")
                      "07q9y8vkw7472gb6y63n8lxld1wb1as6ah3fgwg8d44aq3wmzw1g")
                     ((string=? component "cargo")
                      "12mxf2zawkji7lyz6rjmqz8lx3b5ql95r986zdg5jka094cm5wsk")
                     ((string=? component "rust-std")
                      "0n6rwmgci12r9cmlpygsvcd1dvglzmmqg408hairwnxz4m10g6qh")
                     ((string=? component "rust-src")
                      "0bgjbgmhxc65bzi95i2jnm7vlm24rfzvxxqxaxrnnm6v8n6ai1g4")
                     (else
                      (error "no known hash for Rust component" component)))))
    (package
      (name name)
      (version %rust-stable-version)
      (source
       (origin
         (method url-fetch)
         (uri (string-append "https://static.rust-lang.org/dist/" file))
         (file-name file)
         (sha256 (base32 hash))))
      (build-system trivial-build-system)
      (arguments
       (list #:modules '((guix build utils))
             #:builder
             #~(begin
                 (use-modules (guix build utils))
                 (let ((out (assoc-ref %outputs "out")))
                   (mkdir-p out)
                   (copy-file (assoc-ref %build-inputs "source")
                              (string-append out "/component.tar.xz"))))))
      (synopsis "Upstream tarball for a component of the stable Rust release")
      (description
       "This package carries one tarball from the stable Rust release so it can be
passed as an ordinary build input.  @code{rust-1.99} does the installation.")
      (home-page "https://rust-lang.org")
      (license (list expat asl2.0)))))

;;; Guix ships rust 1.93.0 and carries nothing newer, but mullvad-vpn 2026.5
;;; declares rust-version = "1.95.0" and cargo refuses to build with an older
;;; compiler.  This package provides the current stable release instead, which
;;; satisfies that and anything else with a similar floor.
;;;
;;; It is installed exactly like rust-nightly: the binaries stay pristine and
;;; compiled C shims start them through the store's glibc loader.  It also
;;; carries rust-std, which the rustc component alone does not include -- without
;;; it every crate fails with "can't find crate for `std'".
(define-public rust-1.99
  (package
    (name "rust")
    (version %rust-stable-version)
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://static.rust-lang.org/dist/"
                           "rustc-" version "-x86_64-unknown-linux-gnu.tar.xz"))
       (file-name (string-append "rustc-" version
                                 "-x86_64-unknown-linux-gnu.tar.xz"))
       (sha256
        (base32 "07q9y8vkw7472gb6y63n8lxld1wb1as6ah3fgwg8d44aq3wmzw1g"))))
    ;; cargo-build-system asks its #:rust argument for a "cargo" output.
    (outputs (cons "cargo" (list "out")))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((patches rust-nightly-build)
                       (guix build utils))
           #:builder
           #~(begin
               (use-modules (patches rust-nightly-build))
               (build-rust-nightly %build-inputs %outputs
                                    #:cargo-input-name "rust-1.99-cargo"
                                    #:std-input-name "rust-1.99-rust-std"
                                    #:src-input-name "rust-1.99-rust-src"
                                    ;; rust-src and rust-std tarballs carry the
                                    ;; whole lib/rustlib path below two top-level
                                    ;; components.
                                    #:src-strip 2))))
    (native-inputs
     (list tar
           xz
           binutils
           gcc-toolchain
           (rust-stable-carrier "rust-1.99-cargo" "cargo")
           (rust-stable-carrier "rust-1.99-rust-std" "rust-std")
           (rust-stable-carrier "rust-1.99-rust-src" "rust-src")))
    (inputs
     (list glibc
           (list gcc "lib")
           zlib))
    (supported-systems '("x86_64-linux"))
    (synopsis "Stable Rust, newer than the one in Guix")
    (description
     "This package provides @command{rustc}, @command{cargo} and
@command{rustdoc} plus the standard library and sources for the current stable
Rust release.

It exists because Guix ships rust 1.93.0 and nothing newer, while
@code{mullvad-vpn} 2026.5 declares @code{rust-version = \"1.95.0\"} and refuses
to build with an older compiler.

The binaries expect the FHS loader, so they are started through the store's
glibc loader by small compiled shims, exactly as in @code{rust-nightly}.")
    (home-page "https://rust-lang.org")
    (license (list expat asl2.0))))
