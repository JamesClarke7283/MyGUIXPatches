;;; -*- mode: scheme; -*-
;;;
;;; bun-bootstrap --- the prebuilt Bun seed, exposed as a real ELF executable.
;;;
;;; Why this package exists
;;; -----------------------
;;; Upstream Bun cannot bootstrap itself.  Its own CONTRIBUTING.md says:
;;;
;;;   "Before starting, you will need to already have a release build of Bun
;;;    installed, as we use our bundler to transpile and minify our code, as
;;;    well as for code generation scripts."
;;;
;;; and scripts/build.ts is itself run by Bun.  So one Bun binary has to exist
;;; before Bun can be compiled.  No Guix package and no substitute provides one,
;;; so this package supplies exactly that seed.  It is a native input of
;;; (patches bun) and is not meant to be installed on its own.
;;;
;;; This is the only prebuilt artifact in this channel.
;;;
;;; Why the binary is wrapped, and why the wrapper is C
;;; ---------------------------------------------------
;;; The release executable is ET_EXEC with PT_INTERP pointing at the FHS loader
;;; /lib64/ld-linux-x86-64.so.2, which does not exist on Guix System.
;;;
;;; Do NOT "fix" this with patchelf.  It exits 0 and prints the new interpreter,
;;; so it looks like it worked, but the resulting file segfaults on exec
;;; (exit 139).  Bun's binary carries its JS payload after the section headers
;;; and patchelf moves it: observe the size growing (107308936 -> 107317128
;;; bytes, i.e. +8192) and the last megabyte hashing differently.  Bun addresses
;;; that payload by absolute offset, so any shift breaks it.
;;;
;;; So the binary is kept byte-for-byte pristine in libexec/ and started through
;;; the store's glibc ELF loader.
;;;
;;; The wrapper is a small *compiled C* shim rather than a shell script.  That
;;; matters: Bun's build records process.execPath into its generated build
;;; files, and a /bin/sh script is not something ninja can use as an interpreter
;;; prefix.  A real ELF binary at least behaves like an executable in those
;;; positions.  It still cannot make process.execPath report *bun*, because
;;; exec'ing through the loader leaves /proc/self/exe pointing at ld.so --- see
;;; the note at the end of this file.
;;;
;;; Toolchain facts, for the record (Bun 1.4.x is Rust + C++, not Zig)
;;; ------------------------------------------------------------------
;;;   * language:  Rust, pinned to nightly-2026-09-15 by rust-toolchain.toml
;;;                (components rust-src, rustfmt, clippy, miri, llvm-tools)
;;;   * C/C++:     LLVM/clang 23.1.1, enforced by the build system ---
;;;                "mismatching versions will cause memory allocation failures
;;;                at runtime".  The pinned nightly's own `rustc -vV` reports
;;;                "LLVM version: 23.1.1", so the two agree; Guix's clang and
;;;                lld are also 23.1.1.
;;;   * also needs:      cmake, ninja, nasm, go, ruby, perl, python,
;;;                      pkg-config, icu4c, libiconv, libtool, automake,
;;;                      binutils, which
;;;
;;; The sha256 below is for bun-linux-x64.zip (the glibc variant).  The musl
;;; variant, bun-linux-x64-musl.zip, is published with
;;;   0b9bxg9zyzpifc78f6zdjm8ixd5kpnkjbwblx4zqijsdwz2wra55
;;; but it is not statically linked either (it wants /lib/ld-musl-x86_64.so.1),
;;; so it buys nothing here.

(define-module (patches bun-bootstrap)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (guix licenses)
  #:use-module (gnu packages base)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages commencement))

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
                (unzip   (assoc-ref %build-inputs "unzip"))
                (gcc     (assoc-ref %build-inputs "gcc-toolchain"))
                (binutils (assoc-ref %build-inputs "binutils"))
                (glibc   (assoc-ref %build-inputs "glibc"))
                (loader  (string-append glibc "/lib/ld-linux-x86-64.so.2"))
                (libdir  (string-append glibc "/lib"))
                (bin     (string-append out "/bin"))
                (libexec (string-append out "/libexec/bun"))
                (bun     (string-append libexec "/bun"))
                (wrapper (string-append bin "/bun")))

           ;; The archive holds a single top-level directory, "bun-linux-x64",
           ;; containing the "bun" executable.
           (invoke (string-append unzip "/bin/unzip") "-o" source "-d" ".")

           (mkdir-p libexec)
           (mkdir-p bin)

           ;; Keep the binary byte-for-byte pristine; see the note at the top
           ;; of this file for why patchelf is deliberately not used.
           (copy-file "bun-linux-x64/bun" bun)
           (chmod bun #o555)

           ;; Build the C shim.  It replaces argv[0] with the loader, passes
           ;; --library-path and the pristine bun, then forwards the original
           ;; arguments unchanged.  argv[1..] are preserved exactly, so
           ;; `bun script.ts', `bun run x' and `bun --version' all behave.
           (call-with-output-file "bun-wrapper.c"
             (lambda (port)
               (format port "#include <unistd.h>~%")
               (format port "#include <stdlib.h>~%")
               (format port "~%")
               (format port "/* Re-exec the pristine bun through the store's ELF~%")
               (format port "   loader, forwarding every argument verbatim. */~%")
               (format port "int main(int argc, char **argv) {~%")
               (format port "  char **nargv = malloc(sizeof(char *) * (argc + 5));~%")
               (format port "  int i = 0;~%")
               (format port "  if (nargv == NULL) return 126;~%")
               (format port "  nargv[i++] = ~s;~%" loader)
               (format port "  nargv[i++] = \"--library-path\";~%")
               (format port "  nargv[i++] = ~s;~%" libdir)
               (format port "  nargv[i++] = ~s;~%" bun)
               (format port "  for (int j = 1; j < argc; j++) nargv[i++] = argv[j];~%")
               (format port "  nargv[i] = NULL;~%")
               (format port "  execv(~s, nargv);~%" loader)
               (format port "  return 127;~%")
               (format port "}~%")))

           ;; gcc shells out to the assembler and linker by name, so binutils
           ;; has to be on PATH even though it is already in gcc-toolchain's
           ;; closure.  Without this it fails with "cannot execute 'as'".
           (setenv "PATH"
                   (string-append binutils "/bin:"
                                  gcc "/bin:"
                                  (or (getenv "PATH") "")))
           (setenv "LIBRARY_PATH"
                   (string-append glibc "/lib"
                                  (if (getenv "LIBRARY_PATH")
                                      (string-append ":" (getenv "LIBRARY_PATH"))
                                      "")))

           ;; -O2 is plenty; this is a four-argument execv.
           (invoke (string-append gcc "/bin/gcc")
                   "-O2" "-o" wrapper "bun-wrapper.c")
           (chmod wrapper #o555)))))
    (native-inputs
     (list unzip
           ;; Only used to build the wrapper, so it does not belong in the
           ;; package's runtime closure.
           binutils
           gcc-toolchain))
    (inputs
     (list glibc))
    ;; Only the x86_64-linux release artifact is packaged.
    (supported-systems '("x86_64-linux"))
    (synopsis "Prebuilt Bun binary used to bootstrap the Bun source build")
    (description
     "This package installs upstream's official @code{x86_64-linux} Bun release
binary, kept unmodified in @file{libexec/bun/bun}, together with a small compiled
C wrapper that execs it through the store's glibc ELF loader, since the prebuilt
executable expects the FHS loader path @file{/lib64/ld-linux-x86-64.so.2}.

@code{patchelf} is deliberately not used: it reports success but produces a
segfaulting binary, because Bun stores its JS payload after the section headers
and patchelf shifts it by a page.

Bun's build is self-hosting: upstream's build scripts are themselves run by Bun,
so a release build of Bun is a hard prerequisite for compiling Bun from source.
This package provides that seed and is consumed as a native input by @code{bun}
in @code{(patches bun)}.  Do not install it on its own; use @code{bun} instead.")
    (home-page "https://bun.sh")
    (license expat)))

;;; Note on process.execPath, and why (patches bun) cannot build yet
;;; ------------------------------------------------------------------
;;; Starting Bun through the loader leaves /proc/self/exe pointing at ld.so, so
;;; Bun reports process.execPath as the loader path, e.g.
;;;
;;;   $ bun -e 'console.log(process.execPath)'
;;;   /gnu/store/...-glibc-2.41/lib/ld-linux-x86-64.so.2
;;;
;;; That is harmless for everything Bun does on its own -- bun install, bun
;;; build, bun script.ts all work -- but Bun's build system records
;;; process.execPath verbatim into its generated build.ninja
;;; (scripts/build/configure.ts: `jsRuntime: q(process.execPath)`), and then
;;; uses that string to invoke its own .ts build scripts.  Pointing those rules
;;; at ld.so makes ninja try to "run" a .ts file with the dynamic linker, which
;;; fails with "invalid ELF header".
;;;
;;; There is no environment override for that value, and the binary cannot be
;;; patched (see above), so Bun's own build cannot run under Guix's loader
;;; indirection as things stand.  See the long comment at the top of
;;; (patches bun) and the bun section of README.md.
