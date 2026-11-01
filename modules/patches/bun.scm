;;; -*- mode: scheme; -*-
;;;
;;; bun --- the Bun JavaScript runtime, built from source.
;;;
;;; Upstream: https://github.com/oven-sh/bun, tag bun-v1.4.4.
;;;
;;; ---------------------------------------------------------------------------
;;; What this build actually is
;;; ---------------------------------------------------------------------------
;;;
;;; Bun is no longer a Zig project.  As of 1.4.x it is Rust plus C++ built
;;; against a pinned LLVM.  Upstream's CONTRIBUTING.md states the constraints
;;; that shape this package:
;;;
;;;   * "Bun is written in Rust and requires a specific nightly toolchain
;;;      (pinned in rust-toolchain.toml).  Install Rust via rustup rather than
;;;      your distro's rust/cargo packages -- the build scripts use rustup to
;;;      automatically install and update the pinned nightly."
;;;
;;;     rust-toolchain.toml pins nightly-2026-09-15 and asks for the rust-src
;;;     component (needed for -Zbuild-std on Tier 3 targets) and miri.
;;;
;;;   * "Bun requires LLVM 23.1.1 (clang is part of LLVM).  This version is
;;;      enforced by the build system -- mismatching versions will cause
;;;      memory allocation failures at runtime."
;;;
;;;   * "Before starting, you will need to already have a release build of Bun
;;;      installed, as we use our bundler to transpile and minify our code, as
;;;      well as for code generation scripts."
;;;
;;;   * "After cloning the repository, run `bun run build' ... it will clone
;;;      submodules and build dependencies."
;;;
;;; The third and fourth points are why (patches bun-bootstrap) exists: Bun's
;;; build is self-hosting, so one prebuilt Bun has to seed the source build.
;;; It is a native input here, and it is the only prebuilt artifact in this
;;; channel -- wireguard-go and mullvad-vpn are compiled from source.
;;;
;;; ---------------------------------------------------------------------------
;;; Status: written to upstream's documented procedure, not yet green
;;; ---------------------------------------------------------------------------
;;;
;;; Guix satisfies the LLVM pin -- it carries clang/lld 23.1.1 exactly -- and
;;; the auxiliary toolchain (cmake, ninja, go, ruby, perl, python, pkg-config,
;;; icu4c, libiconv, libtool, automake, which, sed, coreutils).  Two gaps
;;; remain, and they are why `guix build bun' still fails:
;;;
;;;   1. The pinned Rust *nightly* is not packaged.  Guix ships stable rust,
;;;      and rust-toolchain.toml cannot be honoured because there is no rustup
;;;      (and no network) inside the build sandbox.  A `rust-nightly' package
;;;      carrying the 2026-09-15 channel plus the rust-src component has to be
;;;      added, after which the rust input below should point at it.
;;;
;;;   2. `bun run build' fetches and builds its C/C++ dependencies, and
;;;      submodule content is absent from the GitHub archive tarball.  Guix
;;;      builds are offline, so those dependencies must arrive as origins or
;;;      packages and be placed where the build script looks for them.
;;;
;;; The phases below are the accurate shape of the build with those two gaps
;;; called out where they bite, rather than a definition that pretends to be
;;; finished.  Everything else in this channel builds from source today.

(define-module (patches bun)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  ;; (guix packages) exports a `replace' of its own -- the modify-inputs
  ;; helper -- which shadows the modify-phases helper of the same name.  Hide
  ;; it so the `replace' used in the phases below is unambiguous.  This module
  ;; needs both imports: gexps are compiled in the namespace of the module
  ;; they appear in, so `modify-phases' must be bound here.
  #:use-module ((guix packages) #:hide (replace))
  #:use-module (guix build utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages base)
  #:use-module (gnu packages build-tools)    ; ninja
  #:use-module (gnu packages cmake)          ; cmake
  #:use-module (gnu packages golang)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages llvm)           ; clang and lld, 23.1.1
  #:use-module (gnu packages perl)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages python)
  #:use-module (gnu packages ruby)
  #:use-module (gnu packages rust)
  #:use-module (patches bun-bootstrap))

(define-public bun
  (package
    (name "bun")
    (version "1.4.4")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/oven-sh/bun/archive/refs/tags/"
                           "bun-v" version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1zv8hj8ngzgyhil9p8anif0ypz42b4v4gy5w4p9ag4y3bbx3gkh0"))))
    (build-system gnu-build-system)
    (arguments
     (list
      ;; Upstream's test suite wants network access, a browser and real model
      ;; providers; none of that belongs in a build sandbox.
      #:tests? #f
      ;; The build script drives clang directly, so Guix's linker wrapper is
      ;; not in play and the RUNPATH of the result is upstream's business.
      ;; Revisit once the pinned nightly toolchain is packaged properly.
      #:validate-runpath? #f
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda _
              ;; The build script resolves every tool through PATH.
              (setenv "PATH"
                      (string-append
                       #$(file-append clang "/bin") ":"
                       #$(file-append lld "/bin") ":"
                       #$(file-append rust "/bin") ":"
                       #$(file-append go "/bin") ":"
                       #$(file-append ruby "/bin") ":"
                       #$(file-append cmake "/bin") ":"
                       #$(file-append perl "/bin") ":"
                       #$(file-append python "/bin") ":"
                       (getenv "PATH")))

              ;; Upstream enforces clang/clang++ 23.1.1.  Guix carries exactly
              ;; that version, so name them explicitly instead of relying on
              ;; whatever `cc' happens to mean.
              (setenv "CC" "clang")
              (setenv "CXX" "clang++")

              ;; Keep anything the script would otherwise scatter in $HOME.
              (setenv "BUN_INSTALL_CACHE_DIR"
                      (string-append (getcwd) "/.bun-install-cache"))
              (setenv "DO_NOT_TRACK" "1")

              ;; TODO(nightly): rust-toolchain.toml pins nightly-2026-09-15
              ;; with rust-src.  There is no rustup (and no network) here, so
              ;; that pin is ignored and the stable rustc on PATH is used
              ;; instead.  Package the nightly, then point PATH at it here.
              ;;
              ;; TODO(deps): the build clones submodules and builds its C/C++
              ;; dependencies, none of which can happen offline.  They have to
              ;; be supplied as origins/packages in the locations the build
              ;; script expects before this package can build.
              (invoke #$(file-append bun-bootstrap "/bin/bun") "run" "build")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              ;; Upstream's docs say `bun run build' leaves a debug build at
              ;; build/debug/bun-debug; accept a release build too, since the
              ;; layout has moved around between releases.  Select with an
              ;; explicit cond rather than srfi-1's `find', which is not among
              ;; the modules imported into build phases.
              (let* ((out (string-append (assoc-ref outputs "out") "/bin"))
                     (built (cond
                             ((file-exists? "build/release/bun")
                              "build/release/bun")
                             ((file-exists? "build/debug/bun-debug")
                              "build/debug/bun-debug")
                             ((file-exists? "build/bun")
                              "build/bun")
                             (else
                              (error "the Bun build produced no executable; \
looked for build/release/bun, build/debug/bun-debug and build/bun")))))
                (mkdir-p out)
                (copy-file built (string-append out "/bun"))
                (chmod (string-append out "/bun") #o555)))))))
    (native-inputs
     (list bun-bootstrap
           ;; LLVM/clang 23.1.1, as enforced by the build system.
           clang
           lld
           ;; Pinned by rust-toolchain.toml upstream; see TODO(nightly).
           rust
           cmake
           ninja
           go
           ruby
           perl
           python
           pkg-config
           which
           libtool
           automake
           icu4c
           libiconv))
    ;; Only the x86_64-linux seed artifact exists upstream, and the build
    ;; assumptions here (LLVM 23.1.1, clang naming) are Linux-specific.
    (supported-systems '("x86_64-linux"))
    (synopsis "Fast all-in-one JavaScript, TypeScript and CSS runtime")
    (description
     "Bun is a JavaScript and TypeScript runtime, bundler, test runner and
package manager, written in Rust and C++.
This package builds Bun from the @code{bun-v1.4.4} source tarball using
upstream's own build script.  Because that script is executed by Bun itself,
building Bun requires an existing Bun binary to bootstrap from; that seed is
provided by @code{bun-bootstrap} and is the only prebuilt artifact in this
channel.
The build additionally requires the Rust nightly pinned in upstream's
@file{rust-toolchain.toml} (with the @code{rust-src} component) and offline
copies of the C/C++ dependencies that the build script would otherwise fetch.
Those two inputs are not provided yet, so this definition documents the real
build procedure but does not yet build successfully.")
    (home-page "https://bun.sh")
    (license expat)))
