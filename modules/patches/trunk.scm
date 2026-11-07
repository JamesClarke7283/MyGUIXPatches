;;; -*- mode: scheme; -*-
;;;
;;; trunk --- build, bundle and serve Rust WASM web applications.
;;;
;;; Trunk is written in Rust and is published as a static musl executable.
;;; Building it from source would mean vendoring several hundred crates and
;;; keeping a Rust toolchain of at least 1.96 around; the musl release is
;;; self-contained and runs unchanged on Guix System, so this package installs
;;; that executable.
;;;
;;; Trunk downloads wasm-bindgen and wasm-opt into ~/.cache/trunk when a
;;; project does not provide them.  Install `wasm-bindgen-cli' and `binaryen'
;;; and set Trunk's tools in Trunk.toml if you need versions matching your
;;; crate.

(define-module (patches trunk)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages base)         ; tar
  #:use-module (gnu packages compression)) ; gzip

(define-public trunk
  (package
    (name "trunk")
    (version "0.22.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/trunk-rs/trunk/releases/download/v"
             version "/trunk-x86_64-unknown-linux-musl.tar.gz"))
       (file-name (string-append name "-" version
                                 "-x86_64-unknown-linux-musl.tar.gz"))
       (sha256
        (base32 "0qsk7zarfs6d2v616q7gdpshczra0abd565mcrpsgxakn3b5rzm1"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (bin (string-append out "/bin"))
                 (tar (string-append (assoc-ref %build-inputs "tar") "/bin/tar"))
                 (gzip (string-append (assoc-ref %build-inputs "gzip")
                                      "/bin/gzip")))
            ;; GNU tar shells out to gzip, and trivial-build-system brings no
            ;; implicit inputs.
            (setenv "PATH" (string-append (dirname tar) ":" (dirname gzip)))
            (invoke tar "xf" (assoc-ref %build-inputs "source"))
            (mkdir-p bin)
            (copy-file "trunk" (string-append bin "/trunk"))
            (chmod (string-append bin "/trunk") #o755)
            (invoke (string-append bin "/trunk") "--version")))))
    (native-inputs
     (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "Build and bundle Rust WebAssembly web applications")
    (description
     "Trunk builds Rust-generated WebAssembly, JavaScript snippets and static
assets into a web application, driven by a source HTML file and an optional
@file{Trunk.toml}.  It also provides a development server with change
detection and proxy support.  This package installs the upstream static musl
executable.")
    (home-page "https://trunk-rs.github.io/trunk/")
    (license (list license:expat license:asl2.0))))
