;;; -*- mode: scheme; -*-
;;;
;;; oh-my-pi --- the "omp" coding agent.
;;;
;;; Upstream: https://github.com/can1357/oh-my-pi, "coding agent with the IDE
;;; wired in", by Stencil Labs.  This is the `omp' CLI.  Note that there is an
;;; unrelated npm package confusingly also called `oh-my-pi' (by acidsugarx),
;;; which is merely a Pi extension and is *not* what this packages.
;;;
;;; Why there is no compile step
;;; ----------------------------
;;; omp is a Bun application that upstream publishes already bundled.  The npm
;;; tarball of @oh-my-pi/pi-coding-agent ships
;;;
;;;   dist/     dist/cli.js, a single ~18 MB Bun bundle, plus the model and
;;;             rules catalogues and generated docs index
;;;   src/      the TypeScript sources
;;;   skills/   the bundled skills
;;;   prompts/  the bundled slash-command prompts
;;;
;;; There is nothing to compile: Bun executes dist/cli.js directly, and
;;; re-bundling it with `bun build' would reproduce the artefact we already
;;; have.  So this package installs the published tree and wraps the entry
;;; point, the same way the package is meant to be consumed.
;;;
;;; dist/cli.js is very nearly self-contained.  Its only unbundled runtime
;;; import is @oh-my-pi/pi-natives, the native-bindings package; the rest of
;;; what upstream lists under "dependencies" (@opentelemetry/*, puppeteer-core,
;;; axe-core, @babel/parser, the other @oh-my-pi/* packages) is inlined into
;;; the bundle.  Everything else it imports is a Bun/Node builtin: bun:ffi,
;;; bun:sqlite, bun:jsc, node:fs, node:net, node:tty, ...
;;;
;;; Layout and module resolution
;;; ----------------------------
;;; Both pieces are installed flat under lib/node_modules:
;;;
;;;   <out>/lib/node_modules/@oh-my-pi/pi-coding-agent    (this package)
;;;   <out>/lib/node_modules/@oh-my-pi/pi-natives         (the bindings)
;;;
;;; Bun, like Node, resolves a bare specifier by walking up from the importing
;;; file and trying <ancestor>/node_modules/<specifier> at every level.  From
;;;
;;;   <out>/lib/node_modules/@oh-my-pi/pi-coding-agent/dist/cli.js
;;;
;;; the ancestor <out>/lib yields <out>/lib/node_modules/@oh-my-pi/pi-natives,
;;; so the bundle's `import "@oh-my-pi/pi-natives"' resolves without any
;;; NODE_PATH juggling.  The two packages must therefore stay siblings, which
;;; is why pi-natives is a package of its own rather than a bare origin: Guix
;;; rejects raw origins in a package's inputs, but accepts a package.
;;;
;;; Runtime
;;; -------
;;; omp requires Bun >= 1.4.4 (see the `engines' field upstream), and Node
;;; cannot run it at all, because the bundle imports bun:ffi, bun:sqlite and
;;; bun:jsc.
;;;
;;; The wrapper below points at bun-bootstrap, the prebuilt Bun seed, because
;;; (patches bun) does not build yet: it is missing the Rust nightly pinned in
;;; upstream's rust-toolchain.toml and offline copies of the C/C++ dependencies
;;; its build script fetches.  See bun.scm for the details.  bun-bootstrap *is*
;;; Bun 1.4.4, so omp works today; what is not from-source yet is only the
;;; provenance of the runtime.  When `bun' becomes buildable, change the single
;;; bun-bootstrap reference in the 'install-wrap phase and the corresponding
;;; input to `bun'; nothing else has to move.
;;;
;;; Licensing: upstream's LICENSE is MIT, hence expat below.

(define-module (patches coding-agents)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (guix licenses)
  #:use-module (gnu packages base)        ; tar
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression) ; gzip
  #:use-module (patches bun-bootstrap))

;;;
;;; The native bindings, as their own package.
;;;

(define-public oh-my-pi-natives
  (package
    (name "oh-my-pi-natives")
    (version "18.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://registry.npmjs.org/@oh-my-pi/pi-natives/-/"
                           "pi-natives-" version ".tgz"))
       (file-name (string-append name "-" version ".tgz"))
       (sha256
        (base32 "0a2liw7n4hlh04lwf8ia2a086sh0s4rbad5j5bvw83v6nx8gbsj9"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let ((out     (assoc-ref %outputs "out"))
               (source  (assoc-ref %build-inputs "source"))
               (tar     (assoc-ref %build-inputs "tar"))
               (gzip    (assoc-ref %build-inputs "gzip")))
           ;; GNU tar shells out to gzip for -z, and trivial-build-system
           ;; provides no implicit inputs, so put both on PATH.
           (setenv "PATH" (string-append gzip "/bin:" tar "/bin"))
           ;; npm tarballs always unpack into a top-level "package" directory.
           (invoke (string-append tar "/bin/tar") "xzf" source "-C" ".")
           (let ((dest (string-append out "/share/pi-natives")))
             (copy-recursively "package" dest))))))
    (native-inputs
     (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "Native bindings for the oh-my-pi coding agent")
    (description
     "This package carries @code{@oh-my-pi/pi-natives}, the N-API bindings used
by the @code{oh-my-pi} coding agent for PDF conversion, audio, WebRTC, grep,
clipboard, image processing, syntax highlighting, PTY and shell operations.
It provides the JavaScript loaders under @file{native/}; the native addon
itself is linked into the agent's bundle.
It is an implementation detail of @code{oh-my-pi} and is not useful on its
own.")
    (home-page "https://github.com/can1357/oh-my-pi")
    (license expat)))

;;;
;;; The platform N-API addon.
;;;

(define-public oh-my-pi-natives-linux-x64
  (package
    (name "oh-my-pi-natives-linux-x64")
    (version "18.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://registry.npmjs.org/@oh-my-pi/"
                           "pi-natives-linux-x64/-/"
                           "pi-natives-linux-x64-" version ".tgz"))
       (file-name (string-append name "-" version ".tgz"))
       (sha256
        (base32 "07hyi358n459m6gxpas8mx24bwbak714h8pigl9nx7vnn3ipw996"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let ((out    (assoc-ref %outputs "out"))
               (source (assoc-ref %build-inputs "source"))
               (tar    (assoc-ref %build-inputs "tar"))
               (gzip   (assoc-ref %build-inputs "gzip")))
           ;; GNU tar needs gzip for -z; see the note in oh-my-pi-natives.
           (setenv "PATH" (string-append gzip "/bin:" tar "/bin"))
           (invoke (string-append tar "/bin/tar") "xzf" source "-C" ".")
           (let ((dest (string-append out "/share/pi-natives-linux-x64")))
             (mkdir-p dest)
             (for-each (lambda (node)
                         (install-file node dest))
                       (find-files "package" "\\.node$")))))))
    (native-inputs
     (list tar gzip))
    (supported-systems '("x86_64-linux"))
    (synopsis "Prebuilt N-API addon for oh-my-pi on x86_64-linux")
    (description
     "This package carries @code{@oh-my-pi/pi-natives-linux-x64}, the compiled
N-API addon (@file{pi_natives.linux-x64-modern.node} and its @file{-baseline}
variant) that the @code{oh-my-pi} agent loads at run time.

The addon is native code, and upstream publishes it as a prebuilt
per-platform artefact.  It is deliberately *not* part of the JavaScript
package @code{@oh-my-pi/pi-natives}, whose files are loaders only, which is
why installing that package alone leaves @command{omp} failing at start-up
with \"Failed to load pi_natives native addon\".

Rebuilding the addon from source means building @file{packages/natives} in the
oh-my-pi monorepo, which is driven by Bazel and needs its dependencies
fetched; see README.md for what that would take.")
    (home-page "https://github.com/can1357/oh-my-pi")
    (license expat)))

;;;
;;; The agent itself.
;;;

(define-public oh-my-pi
  (package
    (name "oh-my-pi")
    (version "18.15.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://registry.npmjs.org/@oh-my-pi/pi-coding-agent/-/"
                           "pi-coding-agent-" version ".tgz"))
       (file-name (string-append name "-" version ".tgz"))
       (sha256
        (base32 "0rglkdrn1vc5i2x3zd796jaqc3zrkm4z566nvkzsr23s7gfw8df9"))))
    (build-system trivial-build-system)
    (arguments
     `(#:modules ((guix build utils))
       #:builder
       (begin
         (use-modules (guix build utils))
         (let* ((out          (assoc-ref %outputs "out"))
                (source       (assoc-ref %build-inputs "source"))
                (tar          (assoc-ref %build-inputs "tar"))
                (bash         (assoc-ref %build-inputs "bash"))
                (bun          (assoc-ref %build-inputs "bun-bootstrap"))
                (natives      (assoc-ref %build-inputs "oh-my-pi-natives"))
                (gzip         (assoc-ref %build-inputs "gzip"))
                ;; The compiled addon; the JS package above ships loaders only.
                (addon        (assoc-ref %build-inputs "oh-my-pi-natives-linux-x64"))
                (node-modules (string-append out "/lib/node_modules/@oh-my-pi"))
                (app          (string-append node-modules "/pi-coding-agent"))
                (bindings     (string-append node-modules "/pi-natives"))
                (bin          (string-append out "/bin")))

           ;; GNU tar needs gzip for -z; see the same note in
           ;; oh-my-pi-natives above.
           (setenv "PATH" (string-append gzip "/bin:" tar "/bin"))

           ;; Unpack the published distribution ...
           (invoke (string-append tar "/bin/tar") "xzf" source "-C" ".")
           (mkdir-p node-modules)
           (copy-recursively "package" app)

           ;; ... and place the bindings next to it, so that the bundle's
           ;; bare import of @oh-my-pi/pi-natives resolves (see the comment
           ;; at the top of this file).
           (copy-recursively (string-append natives "/share/pi-natives")
                             bindings)

           ;; Drop the compiled addon next to the loaders, which probe for
           ;; native/pi_natives.<platform>-<arch>[-baseline|-modern].node.
           ;; Without it omp aborts at start-up.
           (for-each (lambda (node)
                       (copy-file node
                                  (string-append bindings "/native/"
                                                 (basename node))))
                     (find-files (string-append addon
                                                "/share/pi-natives-linux-x64")
                                 "\\.node$"))

           ;; The wrapper.  Bun is invoked on the bundle directly; there is
           ;; no shebang upstream that we could reuse, and re-implementing
           ;; the CLI in shell would only get in the way of argv handling.
           (mkdir-p bin)
           (let ((wrapper (string-append bin "/omp")))
             (call-with-output-file wrapper
               (lambda (port)
                 ;; NB: ~% is a newline; there is no ~n directive in Guile's
                 ;; format, and writing ~nexec here silently produced a
                 ;; malformed format string that aborted the build.
                 (format port "#!~a/bin/bash~%exec ~a/bin/bun ~a/dist/cli.js \"$@\"~%"
                         bash bun app)))
             (chmod wrapper #o555))))))
    (inputs
     (list bash
           bun-bootstrap
           oh-my-pi-natives
           oh-my-pi-natives-linux-x64))
    (native-inputs
     (list tar gzip))
    ;; bun-bootstrap only exists for x86_64-linux, and the bundled native
    ;; bindings are platform specific as well.
    (supported-systems '("x86_64-linux"))
    (synopsis "Coding agent with the editor wired in")
    (description
     "oh-my-pi, invoked as @command{omp}, is a terminal coding agent: it reads
and writes files, runs commands, drives a language-server and a debugger, and
orchestrates sub-agents.  It is a Bun application distributed as a single
pre-bundled script, so this package installs the published distribution and
provides the @command{omp} entry point rather than recompiling it.

It requires Bun (>= 1.4.4) at run time and will not run under Node, since the
bundle uses @code{bun:ffi}, @code{bun:sqlite} and @code{bun:jsc}.  The wrapper
currently uses @code{bun-bootstrap}, because the source build of Bun in
@code{(patches bun)} is not complete yet; see that file for the two remaining
gaps.  Configuration lives in @file{~/.pi} and in a project's
@file{.oh-my-pi.jsonc}.")
    (home-page "https://github.com/can1357/oh-my-pi")
    (license expat)))
