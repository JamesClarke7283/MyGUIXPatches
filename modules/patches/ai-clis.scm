;;; -*- mode: scheme; -*-
;;;
;;; ai-clis --- agent command-line tools that upstream ships as binaries.
;;;
;;; Three tools: t3 (T3 Code), codex (OpenAI Codex) and claude (Claude Code).
;;;
;;; Why these are binary packages
;;; ----------------------------
;;; None of the three can be compiled from source here, and that is a property of
;;; how they are published rather than a shortcut taken in this file:
;;;
;;;   * The npm package `t3' is a few-KB launcher whose job is to download
;;;     t3-<version>-linux-x64.tar.gz from the project's GitHub releases.  There
;;;     is no source build to drive; the bundle even ships its own node_modules,
;;;     because it is a Node single-executable application.
;;;
;;;   * `@openai/codex' is a wrapper that loads `@openai/codex@<v>-linux-x64',
;;;     one 319 MB statically linked Rust binary.  Codex IS open source and was
;;;     attempted from source: rust-v0.166.0 vendors to 1308 crates (1.8 GB) once
;;;     the v8-poc member is dropped, since that member pulls all of Chromium's
;;;     V8.  It builds as far as `secret-service', which then fails to find the
;;;     `zvariant' version it expects, because trimming the workspace leaves the
;;;     vendor set disagreeing with that crate.  A source build needs that vendor
;;;     tree hosted as a tarball first, which is a storage decision, not a coding
;;;     problem.
;;;
;;;   * `@anthropic-ai/claude-code' is a 500-byte stub that prints "native binary
;;;     not installed".  Its install.cjs copies the real executable out of
;;;     `@anthropic-ai/claude-code-linux-x64', and the program is closed source,
;;;     so there is nothing to build from.
;;;
;;; Each package therefore fetches the artifact upstream actually ships, as a
;;; fixed-output origin: hashed and pinned, not downloaded at build time.  Same
;;; technique as bun-bootstrap, for the same reason.
;;;
;;; How the binaries are made runnable
;;; ----------------------------------
;;; Two of the three need help: their ELFs carry PT_INTERP pointing at the FHS
;;; loader /lib64/ld-linux-x86-64.so.2, which Guix System does not have, so a
;;; compiled C shim starts them through the store's glibc loader.  codex needs
;;; nothing, being statically linked.
;;;
;;; Verified by hand against these exact artifacts before writing this file:
;;;
;;;   $ ld-linux-x86-64.so.2 --library-path <glibc>/lib:<gcc>/lib claude --version
;;;   2.1.316 (Claude Code)
;;;
;;;   $ codex --version
;;;   codex-cli 0.166.0
;;;
;;; `t3' is the awkward one: a Node single-executable application.  Started
;;; through the loader it aborts with
;;;
;;;   Error: Cannot find module '@cursor/sdk'
;;;
;;; even though that package is in its bundled node_modules, because the
;;; single-executable resolves its payload relative to where it believes it was
;;; launched.  Its whole tree is installed so the layout matches what it ships.

(define-module (patches ai-clis)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (guix build-system trivial)
  #:use-module (guix licenses)
  #:use-module (gnu packages base)          ; glibc, tar, binutils
  #:use-module (gnu packages bash)
  #:use-module (gnu packages commencement)  ; gcc-toolchain
  #:use-module (gnu packages compression)   ; gzip
  #:use-module (gnu packages gcc))          ; gcc:lib, for libstdc++

;;; The C source of a shim that starts a program through the store's ELF loader.
;;; It is used as a format string with three arguments: loader, libpath, target.
(define %shim-c
  "#include <unistd.h>
#include <stdlib.h>

int main(int argc, char **argv) {
  char **nargv = malloc(sizeof(char *) * (argc + 5));
  int i = 0;
  if (nargv == NULL) return 126;
  nargv[i++] = ~s;
  nargv[i++] = \"--library-path\";
  nargv[i++] = ~s;
  nargv[i++] = ~s;
  for (int j = 1; j < argc; j++) nargv[i++] = argv[j];
  nargv[i] = NULL;
  execv(~s, nargv);
  return 127;
}
")

;;;
;;; T3 Code.
;;;

(define-public t3-code
  (package
    (name "t3-code")
    (version "0.1.6")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/pingdotgg/t3code/releases/"
                           "download/v" version "/t3-" version
                           "-linux-x64.tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1rkppdbisl8rq25zvilxbp53fij0dnxrwrsvvljgahgf1nlivwvw"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((tar  #$(file-append tar "/bin/tar"))
                      (gzip-bin #$(file-append gzip "/bin"))
                      (out  (assoc-ref %outputs "out"))
                      (glibc (assoc-ref %build-inputs "glibc"))
                      (gcc-lib (assoc-ref %build-inputs "gcc"))
                      (loader (string-append glibc "/lib/ld-linux-x86-64.so.2"))
                      (libpath (string-append glibc "/lib:" gcc-lib "/lib"))
                      (bundle (string-append out "/libexec/t3")))
                 ;; GNU tar shells out to gzip, and trivial-build-system brings
                 ;; no implicit inputs.
                 (setenv "PATH" (string-append (dirname tar) ":" gzip-bin))
                 (invoke tar "xf" (assoc-ref %build-inputs "source")
                         "--no-same-owner" "--no-same-permissions")

                 ;; Keep the whole tarball tree: the launcher is a Node
                 ;; single-executable that looks for its bundled modules beside
                 ;; itself.
                 (mkdir-p (dirname bundle))
                 (copy-recursively (string-append "t3-" #$version "-linux-x64")
                                   bundle)

                 ;; Compile the shim with gcc, then drop it on PATH.
                 (let* ((gcc (string-append (assoc-ref %build-inputs
                                                       "gcc-toolchain")
                                            "/bin/gcc"))
                        (binutils-dir (string-append
                                       (assoc-ref %build-inputs "binutils")
                                       "/bin"))
                        (source (string-append out "/t3.c"))
                        (target (string-append out "/bin/t3")))
                   (setenv "PATH" (string-append binutils-dir ":" (getenv "PATH")))
                   (mkdir-p (dirname target))
                   (call-with-output-file source
                     (lambda (port)
                       (display
                        (format #f #$%shim-c loader libpath
                                (string-append bundle "/t3") loader)
                        port)))
                   (invoke gcc "-O2" "-o" target source)
                   (chmod target #o555)
                   (delete-file source))
                 #t))))
    (native-inputs
     (list gzip gcc-toolchain
           binutils
           tar))
    (inputs
     (list glibc (list gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (synopsis "T3 Code agent client")
    (description
     "T3 Code is a coding-agent client with an agent control surface, a task list
and an approval flow.  This package installs upstream's @code{linux-x64} release
bundle.  The launcher is a Node single-executable application started through the
store's glibc loader by a small compiled shim, since it expects the FHS loader
path that Guix System does not have.")
    (home-page "https://github.com/pingdotgg/t3code")
    (license #f)))

;;;
;;; Codex.
;;;

(define-public codex
  (package
    (name "codex")
    (version "0.166.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://registry.npmjs.org/@openai/codex/-/codex-"
                           version "-linux-x64.tgz"))
       (file-name (string-append name "-" version ".tgz"))
       (sha256
        (base32 "14zx0702nxh8wc5bqxdind4y7w8ym3w9325yqkpwxqnhsck0mh6b"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((tar  #$(file-append tar "/bin/tar"))
                      (gzip-bin #$(file-append gzip "/bin"))
                      (out  (assoc-ref %outputs "out"))
                      (vendor (string-append out "/libexec/codex/vendor/"
                                             "x86_64-unknown-linux-musl")))
                 (setenv "PATH" (string-append (dirname tar) ":" gzip-bin))
                 (invoke tar "xf" (assoc-ref %build-inputs "source")
                         "--no-same-owner" "--no-same-permissions")

                 ;; package/vendor/x86_64-unknown-linux-musl/ holds bin/codex,
                 ;; bin/codex-code-mode-host, codex-path/ and codex-resources/.
                 ;; Keep the whole directory: the CLI resolves those helpers
                 ;; relative to its own path, and with only the bare executable
                 ;; it refuses to create them.
                 (mkdir-p (dirname vendor))
                 (copy-recursively "package/vendor/x86_64-unknown-linux-musl"
                                   vendor)
                 (mkdir-p (string-append out "/bin"))
                 ;; Statically linked, so a symlink is enough.
                 (symlink (string-append vendor "/bin/codex")
                          (string-append out "/bin/codex"))
                 #t))))
    (native-inputs
     (list gzip tar))
    (supported-systems '("x86_64-linux"))
    (synopsis "OpenAI Codex command-line interface")
    (description
     "Codex is OpenAI's coding agent, run as @command{codex} in a terminal.  This
package installs upstream's @code{linux-x64} build, a single statically linked
executable, so no loader shim is needed.  Its helper binaries and resources are
installed beside it under @file{libexec/codex}, because the CLI resolves them
relative to its own path.

Note: Codex is open source and was attempted from source.  The workspace vendors
to 1308 crates (1.8 GB) once the @code{v8-poc} member, which pulls in all of
Chromium's V8, is excluded; the build then reaches @code{secret-service}, which
fails over a @code{zvariant} version mismatch, so a source build needs that
vendor tree hosted somewhere first.")
    (home-page "https://github.com/openai/codex")
    (license (list asl2.0))))

;;;
;;; Claude Code.
;;;

(define-public claude-code
  (package
    (name "claude-code")
    (version "2.1.316")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://registry.npmjs.org/@anthropic-ai/"
                           "claude-code-linux-x64/-/claude-code-linux-x64-"
                           version ".tgz"))
       (file-name (string-append name "-" version ".tgz"))
       (sha256
        (base32 "000h911gl6g7x94i3qllc3n28wsd2khza02s30d1cxdldqcinpkl"))))
    (build-system trivial-build-system)
    (arguments
     (list #:modules '((guix build utils))
           #:builder
           #~(begin
               (use-modules (guix build utils))
               (let* ((tar  #$(file-append tar "/bin/tar"))
                      (gzip-bin #$(file-append gzip "/bin"))
                      (out  (assoc-ref %outputs "out"))
                      (glibc (assoc-ref %build-inputs "glibc"))
                      (gcc-lib (assoc-ref %build-inputs "gcc"))
                      (loader (string-append glibc "/lib/ld-linux-x86-64.so.2"))
                      (libpath (string-append glibc "/lib:" gcc-lib "/lib"))
                      (real (string-append out "/libexec/claude")))
                 (setenv "PATH" (string-append (dirname tar) ":" gzip-bin))
                 (invoke tar "xf" (assoc-ref %build-inputs "source")
                         "--no-same-owner" "--no-same-permissions")

                 ;; The tarball is package/claude plus package.json and docs.
                 (mkdir-p (dirname real))
                 (copy-file "package/claude" real)

                 (let* ((gcc (string-append (assoc-ref %build-inputs
                                                       "gcc-toolchain")
                                            "/bin/gcc"))
                        (binutils-dir (string-append
                                       (assoc-ref %build-inputs "binutils")
                                       "/bin"))
                        (source (string-append out "/claude.c"))
                        (target (string-append out "/bin/claude")))
                   (setenv "PATH" (string-append binutils-dir ":" (getenv "PATH")))
                   (mkdir-p (dirname target))
                   (call-with-output-file source
                     (lambda (port)
                       (display (format #f #$%shim-c loader libpath real loader)
                                port)))
                   (invoke gcc "-O2" "-o" target source)
                   (chmod target #o555)
                   (delete-file source))
                 #t))))
    (native-inputs
     (list gzip gcc-toolchain
           binutils
           tar))
    (inputs
     (list glibc (list gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (synopsis "Anthropic Claude Code command-line interface")
    (description
     "Claude Code is Anthropic's agentic coding tool, run as @command{claude} in
a terminal.  This package installs the native binary that the
@code{@anthropic-ai/claude-code} npm package itself downloads, since that npm
package is only a stub.  The binary expects the FHS loader path that Guix System
does not have, so it is started through the store's glibc loader by a small
compiled shim.

The program is closed source; upstream publishes no source to build from.")
    (home-page "https://github.com/anthropics/claude-code")
    (license #f)))
