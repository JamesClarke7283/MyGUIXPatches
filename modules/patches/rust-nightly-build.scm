;;; -*- mode: scheme; -*-
;;;
;;; Build-side helpers for the Rust toolchain packages.  These live in their own
;;; module so they can be imported into the build namespace with #:modules: a
;;; procedure defined in the package module is not visible to a gexp at build
;;; time.
(define-module (patches rust-nightly-build)
  #:use-module (guix build utils)
  #:export (rust-nightly-shim-source build-rust-nightly))

;;; Return C source for a shim that starts TOOL through the store's ELF loader.
;;; LOADER is the loader path, LIBPATH its search path, and REAL the install
;;; prefix of the unwrapped toolchain.  TARGET, when given, is the file to run
;;; instead of REAL/bin/TOOL.
(define* (rust-nightly-shim-source tool loader libpath real #:optional (target #f))
  (string-append
   "#include <unistd.h>\n"
   "#include <stdlib.h>\n"
   "\n"
   "/* Start " tool " through the store's glibc loader.  libgcc_s and zlib\n"
   "   are needed alongside libc. */\n"
   "int main(int argc, char **argv) {\n"
   "  char **nargv = malloc(sizeof(char *) * (argc + 5));\n"
   "  int i = 0;\n"
   "  if (nargv == NULL) return 126;\n"
   "  nargv[i++] = \"" loader "\";\n"
   "  nargv[i++] = \"--library-path\";\n"
   "  nargv[i++] = \"" libpath "\";\n"
   "  nargv[i++] = \"" (or target (string-append real "/bin/" tool)) "\";\n"
   "  for (int j = 1; j < argc; j++) nargv[i++] = argv[j];\n"
   "  nargv[i] = NULL;\n"
   "  execv(\"" loader "\", nargv);\n"
   "  return 127;\n"
   "}\n"))

;;; Install the toolchain and wrap its ELF tools.
;;;
;;; INPUTS and OUTPUTS are %build-inputs and %outputs.  The keyword arguments
;;; name the extra tarball inputs, because the nightly and stable packages name
;;; their carriers differently; #f means that component is absent.
(define* (build-rust-nightly inputs outputs
                             #:key
                             (cargo-input-name "rust-nightly-cargo")
                             (src-input-name "rust-nightly-rustc-nightly-src")
                             (std-input-name #f)
                             (cargo-strip 2)
                             (src-strip 1)
                             (std-strip 2)
                             (triplet "x86_64-unknown-linux-gnu"))
  (define (input name)
    (let ((value (assoc-ref inputs name)))
      (unless value
        (error "build input is missing" name))
      value))
  (define (input-lib name)
    (string-append (input name) "/lib"))
  (let* ((out     (assoc-ref outputs "out"))
         (tar     (string-append (input "tar") "/bin/tar"))
         (xz      (string-append (input "xz") "/bin/xz"))
         (gcc     (string-append (input "gcc-toolchain") "/bin/gcc"))
         (loader  (string-append (input-lib "glibc") "/ld-linux-x86-64.so.2"))
         ;; libgcc_s.so.1 comes from gcc:lib, libz.so.1 from zlib, libc from
         ;; glibc.  The loader named each missing one in turn before rustc ran.
         (libpath (string-append (input-lib "glibc") ":"
                                 (input-lib "gcc") ":"
                                 (input-lib "zlib")))
         (bin     (string-append out "/bin"))
         (real    (string-append out "/libexec/rust")))

    ;; GNU tar shells out to xz and gcc to `as', and trivial-build-system
    ;; provides no implicit inputs, so everything goes on PATH explicitly.
    (setenv "PATH"
            (string-append (input "tar") "/bin:"
                           (input "xz") "/bin:"
                           (input "binutils") "/bin:"
                           (input "gcc-toolchain") "/bin"))
    (setenv "LIBRARY_PATH" libpath)

    (mkdir-p real)
    (mkdir-p bin)

    ;; The compiler.  Upstream's component tarballs have a single top-level
    ;; directory above the component, hence --strip-components=2.
    (invoke tar "xf" (input "source") "-C" real
            (string-append "--strip-components=" (number->string cargo-strip)))

    ;; The cargo component, merged into the same prefix so cargo finds the rustc
    ;; beside it.  The components collide only on LICENSE-* and COPYRIGHT, which
    ;; are identical.
    (invoke tar "xf" (string-append (input cargo-input-name) "/component.tar.xz")
            "-C" real
            (string-append "--strip-components=" (number->string cargo-strip)))

    ;; The compiled standard library.  The rustc component does not include it;
    ;; without this every crate fails with "can't find crate for `std'".
    (when (and std-input-name (assoc-ref inputs std-input-name))
      (invoke tar "xf"
              (string-append (input std-input-name) "/component.tar.xz")
              "-C" real
              (string-append "--strip-components=" (number->string std-strip))))

    ;; rust-src, where cargo -Zbuild-std looks for the standard library sources.
    (when (and src-input-name (assoc-ref inputs src-input-name))
      (invoke tar "xf"
              (string-append (input src-input-name) "/component.tar.xz")
              "-C" real
              (string-append "--strip-components=" (number->string src-strip))))

    ;; One compiled shim per real ELF tool.  rust-gdb and rust-lldb are shell
    ;; scripts upstream, so they stay in libexec untouched.
    (for-each
     (lambda (tool)
       (let ((source (string-append tool ".c"))
             (target (string-append bin "/" tool)))
         (call-with-output-file source
           (lambda (port)
             (display (rust-nightly-shim-source tool loader libpath real) port)))
         (invoke gcc "-O2" "-o" target source)
         (chmod target #o555)
         (delete-file source)))
     '("rustc" "cargo" "rustdoc"))

    ;; rustc passes -B<sysroot>/lib/rustlib/<triplet>/bin/gcc-ld to the linker and
    ;; then asks for lld (--fuse-ld=lld), so gcc spawns ld.lld from there.  Those
    ;; entries are hard links to rust-lld, whose driver inspects /proc/self/exe
    ;; and refuses a name it does not recognise -- which it never will be here,
    ;; The compiler ships small ELF driver binaries (rust-lld's entry points)
    ;; in gcc-ld/, and rustc passes that directory to gcc as -B, which makes
    ;; gcc look there *instead of* PATH.  Two problems follow:
    ;;
    ;;   1. those drivers inspect /proc/self/exe and refuse a name they do not
    ;;      recognise, which it never will be here -- the binary has to be
    ;;      started through the store loader, so /proc/self/exe is ld.so:
    ;;        lld-wrapper: executable has unexpected name: Some("ld-linux-...")
    ;;   2. -B means the assembler is looked for there too, and there is none,
    ;;      so collect2 dies before any of this is reported:
    ;;        collect2: fatal error: posix_spawnp: No such file or directory
    ;;
    (let ((gcc-ld (string-append real "/lib/rustlib/" triplet "/bin/gcc-ld")))
      (when (directory-exists? gcc-ld)
        (for-each
         (lambda (pair)
           (let* ((tool (car pair))
                  (target (string-append (input "binutils") "/bin/" (cdr pair)))
                  (path (string-append gcc-ld "/" tool)))
             (when (file-exists? path)
               (delete-file path))
             ;; The interpreter has to be absolute: /bin/sh does not exist inside
             ;; the build sandbox, and a script whose interpreter cannot be found
             ;; fails with exactly the unhelpful error collect2 gave.
             (call-with-output-file path
               (lambda (port)
                 (format port "#!~a/bin/bash\nexec ~a \"$@\"\n"
                         (input "bash")
                         target)))
             (chmod path #o555)))
         '(("as" . "as")
           ("ld" . "ld")
           ("ld.lld" . "ld")
           ("ld64.lld" . "ld")
           ("lld-link" . "ld")
           ("wasm-ld" . "ld")))))
    ;; cargo-build-system expects its #:rust argument to expose a separate
    ;; "cargo" output.  It is the same tree, so symlink it.
    (let ((cargo-out (assoc-ref outputs "cargo")))
      (when cargo-out
        (mkdir-p cargo-out)
        (symlink out (string-append cargo-out "/libexec"))))
    #t))
