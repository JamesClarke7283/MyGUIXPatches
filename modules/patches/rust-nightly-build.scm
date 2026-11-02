;;; -*- mode: scheme; -*-
;;;
;;; Build-side helpers for rust-nightly.  These live in a separate module so
;;; they can be imported into the build namespace with #:modules; a procedure
;;; defined in the package module is not visible to a gexp at build time.
(define-module (patches rust-nightly-build)
  #:use-module (guix build utils)
  #:export (rust-nightly-shim-source build-rust-nightly))

;;; Return C source for a shim that starts TOOL through the store's ELF loader.
;;; LOADER, LIBPATH and REAL are the loader path, its search path, and the
;;; install prefix of the unwrapped toolchain.
(define (rust-nightly-shim-source tool loader libpath real)
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
   "  nargv[i++] = \"" real "/bin/" tool "\";\n"
   "  for (int j = 1; j < argc; j++) nargv[i++] = argv[j];\n"
   "  nargv[i] = NULL;\n"
   "  execv(\"" loader "\", nargv);\n"
   "  return 127;\n"
   "}\n"))

;;; Install the toolchain and wrap its ELF tools.  INPUTS and OUTPUTS are
;;; %build-inputs and %outputs from the trivial-build-system builder.
(define (build-rust-nightly inputs outputs)
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
    ;; rustc first, then cargo merged into the same prefix so cargo finds the
    ;; rustc beside it.  The two components collide only on LICENSE-* and
    ;; COPYRIGHT, which are identical.  Both tarballs have a single top-level
    ;; directory.
    (invoke tar "xf" (input "source") "-C" real "--strip-components=2")
    (invoke tar "xf" (string-append (input "rust-nightly-cargo") "/component.tar.xz")
            "-C" real "--strip-components=2")
    ;; rust-src goes where rustup would put it: cargo's -Zbuild-std looks for
    ;; the standard library sources at lib/rustlib/src/rust.
    (let ((src (string-append real "/lib/rustlib/src/rust")))
      (mkdir-p src)
      (invoke tar "xf"
              (string-append (input "rust-nightly-rustc-nightly-src")
                             "/component.tar.xz")
              "-C" src "--strip-components=1"))
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
    #t))
