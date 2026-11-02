;;; -*- mode: scheme; -*-
;;;
;;; bun --- the Bun JavaScript runtime, built from source.
;;;
;;; Upstream: https://github.com/oven-sh/bun, tag bun-v1.4.4.
;;;
;;; ---------------------------------------------------------------------------
;;; What the build needs, and which pieces are packaged where
;;; ---------------------------------------------------------------------------
;;;
;;; Bun 1.4.x is Rust plus C++.  Its own CONTRIBUTING.md states the constraints
;;; that shape this package:
;;;
;;;   * "Bun is written in Rust and requires a specific nightly toolchain
;;;      (pinned in rust-toolchain.toml)."
;;;
;;;     That is nightly-2026-09-15, and scripts/build/rust.ts passes -Zbuild-std
;;;     and -Ztune-cpu to rustc, which stable rustc rejects outright.  So Guix's
;;;     stable rust cannot build this; (patches rust-nightly) provides the pinned
;;;     channel, its rust-src component, and LLVM 23.1.1.
;;;
;;;   * "Bun requires LLVM 23.1.1 (clang is part of LLVM).  This version is
;;;      enforced by the build system -- mismatching versions will cause memory
;;;      allocation failures at runtime."
;;;
;;;     Guix's clang and lld are 23.1.1, and rust-nightly's rustc reports
;;;     "LLVM version: 23.1.1", so the pins agree.  Bun checks this itself and
;;;     aborts with
;;;
;;;       error: clang is LLVM 23.1.1 and rustc's LLVM is 21.1.8;
;;;              they have to be the same major version
;;;
;;;     if a stable rustc is picked up instead.
;;;
;;;   * "Before starting, you will need to already have a release build of Bun
;;;      installed, as we use our bundler to transpile and minify our code, as
;;;      well as for code generation scripts."
;;;
;;;     scripts/build.ts is itself executed by Bun, so one Bun binary has to
;;;     exist before Bun can be compiled.  (patches bun-bootstrap) supplies it.
;;;
;;;   * "After cloning the repository, run `bun run build' ... it will clone
;;;      submodules and build dependencies."
;;;
;;;     The build fetches ~23 C/C++ dependencies (lolhtml, boringssl, libuv,
;;;     mimalloc, zstd, ...), applies the patches under patches/ to each, builds
;;;     them, and finally links the Rust half against the resulting objects.
;;;     That fetching cannot happen inside Guix's offline sandbox, which is the
;;;     remaining obstacle described at the end of this file.
;;;
;;; ---------------------------------------------------------------------------
;;; Toolchain, as proven by hand against this tag
;;; ---------------------------------------------------------------------------
;;;
;;; Configure succeeds once the following are on PATH, which is how the list
;;; below was derived -- each missing tool named itself in turn:
;;;
;;;   clang, lld, llvm   the enforced LLVM 23.1.1
;;;   binutils           `strip' (and `as', which gcc shells out to)
;;;   nasm               the C++ side assembles some objects with it
;;;   cmake, ninja       the build generates build.ninja and runs it
;;;   go, ruby, perl     dependency build scripts
;;;   python, which
;;;   icu4c, libiconv    linked into the runtime
;;;   libtool, automake, pkg-config
;;;   bun-bootstrap      runs scripts/build.ts
;;;   rust-nightly       rustc/cargo with the -Z flags, and rust-src
;;;
;;; The configure step then reports:
;;;
;;;   [configured] bun-profile -> bun (stripped)
;;;     target       linux-x64-gnu
;;;     build type   Release
;;;     features     lto, baseline
;;;   23 deps, 228 codegen, 1218 objects
;;;
;;; ---------------------------------------------------------------------------
;;; The one thing that does not work yet, and exactly why
;;; ---------------------------------------------------------------------------
;;;
;;; Bun's bootstrap binary cannot be made into a plain executable on Guix.
;;; Its release build is ET_EXEC with PT_INTERP pointing at the FHS loader
;;; /lib64/ld-linux-x86-64.so.2, which Guix System does not have, so it has to
;;; be started through the store's loader.
;;;
;;; patchelf does not fix that binary.  It exits 0 and prints the new
;;; interpreter, so it looks like it works, but the result segfaults on exec
;;; (exit 139), because Bun stores its JS payload after the section headers and
;;; patchelf moves it: the file grows by a page (107308936 -> 107317128 bytes)
;;; and the trailing megabyte hashes differently.  Bun addresses that payload by
;;; absolute offset, so any shift breaks it.
;;;
;;; So bun-bootstrap ships the binary pristine behind a compiled C shim.  That
;;; is fully functional for everything Bun does on its own -- bun install, bun
;;; build and bun script.ts all work -- but it leaves /proc/self/exe pointing at
;;; ld.so, so Bun reports:
;;;
;;;   $ bun -e 'console.log(process.execPath)'
;;;   /gnu/store/...-glibc-2.41/lib/ld-linux-x86-64.so.2
;;;
;;; Bun's build system records that value verbatim into the generated build
;;; files (scripts/build/configure.ts: `jsRuntime: q(process.execPath)`) and then
;;; uses it to invoke its own .ts build scripts, so ninja ends up trying to
;;; "run" a .ts file with the dynamic linker:
;;;
;;;   /gnu/store/.../ld-linux-x86-64.so.2 .../scripts/build/stream.ts
;;;   error while loading shared libraries: .../stream.ts: invalid ELF header
;;;
;;; There is no environment override for that value, and the binary cannot be
;;; patched, so Bun's own build cannot run under Guix's loader indirection as
;;; things stand.  Patching the generated build.ninja by hand does get past it
;;; (the dependency fetch and the Rust plan both succeed that way), but the file
;;; is regenerated on every reconfigure, so it is not a package-level fix.
;;;
;;; What would fix it, in order of tractability:
;;;
;;;   1. A Bun bootstrap binary built from source elsewhere with a real
;;;      interpreter -- i.e. one that does not need the loader shim.
;;;   2. An upstream knob for jsRuntime, so configure can be told to record the
;;;      shim path rather than process.execPath.
;;;   3. A loader at /lib64/ld-linux-x86-64.so.2, which Guix System cannot offer
;;;      without shadowing glibc.
;;;
;;; Until then this package documents the real procedure rather than pretending
;;; to be finished, and oh-my-pi keeps using bun-bootstrap as its runtime.

(define-module (patches bun)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  ;; (guix packages) exports a `replace' of its own -- the modify-inputs helper
  ;; -- which shadows the modify-phases helper of the same name.  Hide it so the
  ;; `replace' below is unambiguous.  Both imports are needed: gexps are
  ;; compiled in the namespace of the module they appear in, so modify-phases
  ;; has to be bound here too.
  #:use-module ((guix packages) #:hide (replace))
  #:use-module (guix build utils)
  #:use-module (guix build-system gnu)
  #:use-module (guix licenses)
  #:use-module (gnu packages assembly)       ; nasm
  #:use-module (gnu packages autotools)      ; libtool, automake
  #:use-module (gnu packages base)           ; binutils, which
  #:use-module (gnu packages build-tools)    ; ninja
  #:use-module (gnu packages cmake)          ; cmake
  #:use-module (gnu packages golang)         ; go
  #:use-module (gnu packages icu4c)          ; icu4c
  #:use-module (gnu packages llvm)           ; clang, lld, llvm -- 23.1.1
  #:use-module (gnu packages perl)           ; perl
  #:use-module (gnu packages pkg-config)     ; pkg-config
  #:use-module (gnu packages python)         ; python
  #:use-module (gnu packages ruby)           ; ruby
  #:use-module (patches bun-bootstrap)
  #:use-module (patches rust-nightly))

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

      ;; The build links the Rust half with its own flags through clang++ and
      ;; lld, so Guix's linker wrapper is not in play and the RUNPATH of the
      ;; result is upstream's business.
      #:validate-runpath? #f

      #:phases
      #~(modify-phases %standard-phases
          ;; Bun records process.execPath into the generated build files and
          ;; then uses it to run its own .ts helpers.  Under Guix that value is
          ;; the glibc loader -- the bootstrap bun can only start through it --
          ;; so ninja ends up executing a .ts file with the dynamic linker
          ;; ("invalid ELF header").  There is no upstream knob, so this patch
          ;; adds one: BUN_JS_RUNTIME wins over process.execPath when set.
          (add-after 'unpack 'patch-js-runtime-override
            (lambda _
              (substitute* "scripts/build/configure.ts"
                (("\\? q\\(process\\.execPath\\)")
                 "? q(process.env.BUN_JS_RUNTIME ?? process.execPath)"))))
          (delete 'configure)

          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              ;; The build resolves every tool through PATH.  Order matters
              ;; only in that the shims for rustc and bun must come before any
              ;; other compiler on PATH, or Bun's LLVM check fails against the
              ;; wrong rustc.
              (setenv "PATH"
                      (string-append
                       #$(file-append rust-nightly "/bin") ":"
                       #$(file-append bun-bootstrap "/bin") ":"
                       #$(file-append clang-23 "/bin") ":"
                       #$(file-append lld-23 "/bin") ":"
                       #$(file-append llvm-23 "/bin") ":"
                       #$(file-append binutils "/bin") ":"
                       #$(file-append nasm "/bin") ":"
                       #$(file-append cmake "/bin") ":"
                       #$(file-append ninja "/bin") ":"
                       #$(file-append go "/bin") ":"
                       #$(file-append ruby "/bin") ":"
                       #$(file-append perl "/bin") ":"
                       #$(file-append python "/bin") ":"
                       #$(file-append which "/bin") ":"
                       (getenv "PATH")))

              ;; Upstream enforces clang/clang++ 23.1.1.  Guix carries exactly
              ;; that version, so name them explicitly rather than relying on
              ;; whatever `cc' happens to mean.
              (setenv "CC" "clang")
              (setenv "CXX" "clang++")

              ;; Keep anything the script would otherwise scatter in $HOME, and
              ;; stop it reporting the run to anyone.
              ;; The dependency fetches cache under $HOME/.bun/build-cache, and
              ;; $HOME is /homeless-shelter in the sandbox, which is not
              ;; writable -- hence EACCES.  Give it a real home.
              (setenv "HOME" (string-append (getcwd) "/.home"))
              (mkdir-p (getenv "HOME"))
              (setenv "XDG_CACHE_HOME" (string-append (getenv "HOME") "/.cache"))
              (setenv "BUN_INSTALL_CACHE_DIR"
                      (string-append (getcwd) "/.bun-install-cache"))
              (setenv "DO_NOT_TRACK" "1")

              ;; Hand the patched configure its jsRuntime; see the patch above.
              (setenv "BUN_JS_RUNTIME"
                      #$(file-append bun-bootstrap "/bin/bun"))

              ;; Run upstream's own build script with the bootstrap Bun.  It
              ;; generates build.ninja and then drives it.
              ;;
              ;; This is where the build currently stops: configure records
              ;; process.execPath (ld.so, see the header) into build.ninja as the
              ;; runtime for the .ts helper scripts, and ninja then fails on the
              ;; first dependency fetch.  The procedure below is the real one;
              ;; see the long comment at the top of this file for the three
              ;; changes that would unblock it.
              (invoke #$(file-append bun-bootstrap "/bin/bun")
                      "scripts/build.ts" "--profile=release")))

          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              ;; Upstream's docs say `bun run build' leaves a debug build at
              ;; build/debug/bun-debug; a release build lands at
              ;; build/release/bun.  Accept either, since the layout has moved
              ;; between releases.  Select with an explicit cond rather than
              ;; srfi-1's `find', which is not among the modules imported into
              ;; build phases.
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
     (list ;; The seed Bun that runs scripts/build.ts.  Not in the runtime
           ;; closure: the installed binary is self-contained.
           bun-bootstrap

           ;; The pinned nightly with -Z support, rust-src and LLVM 23.1.1.
           rust-nightly

           ;; LLVM/clang 23.1.1, as enforced by the build system.
           clang-23
           lld-23
           llvm-23

           ;; strip and as.
           binutils
           nasm

           ;; Build driver and dependency build scripts.
           cmake
           ninja
           go
           ruby
           perl
           python
           which
           pkg-config
           libtool
           automake))
    (inputs
     ;; Linked into the runtime.
     (list icu4c
           libiconv))
    ;; Only the x86_64-linux seed artifact exists upstream, and the build
    ;; assumptions here (LLVM 23.1.1, clang naming) are Linux specific.
    (supported-systems '("x86_64-linux"))
    (synopsis "Fast all-in-one JavaScript, TypeScript and CSS runtime")
    (description
     "Bun is a JavaScript and TypeScript runtime, bundler, test runner and
package manager, written in Rust and C++.

This package builds Bun from the @code{bun-v1.4.4} source tarball using
upstream's own build script.  Because that script is executed by Bun itself,
building Bun requires an existing Bun binary to bootstrap from; that seed is
provided by @code{bun-bootstrap} and is the only prebuilt component.  The Rust
half is compiled with @code{rust-nightly}, the exact channel upstream pins,
since its build passes nightly-only flags that stable rustc rejects; both
compilers are pinned to LLVM 23.1.1, which the build enforces.

Note: as written this recipe follows upstream's documented procedure but does
not yet complete inside Guix.  The bootstrap binary has to be started through
the store's glibc loader, which leaves Bun reporting the loader path as its own
executable, and Bun's build records that value into the build files it then
uses to run its helper scripts.  See the commentary at the top of the package
definition for the exact failure and the changes that would resolve it.")
    (home-page "https://bun.sh")
    (license expat)))
