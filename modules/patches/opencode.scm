;;; -*- mode: scheme; -*-
;;;
;;; opencode --- the open source coding agent, built from source.
;;;
;;; Upstream: https://github.com/anomalyco/opencode (formerly sst/opencode).
;;; The repository is a Bun monorepo.  The `opencode' executable comes from
;;; packages/cli/script/build.ts, which
;;;
;;;   1. builds the web UI in packages/app with Vite and embeds it as a
;;;      brotli-compressed archive (it is what `opencode serve' serves), and
;;;   2. bundles packages/cli/src with Bun.build({compile: ...}), producing a
;;;      single executable: Bun's runtime with the bundle, its assets and the
;;;      native libraries it loads appended in an ELF section.
;;;
;;; This package runs that script.  Everything opencode itself consists of is
;;; compiled from the release tarball; what comes prebuilt is Bun and the npm
;;; dependencies, some of which ship native code (see below).
;;;
;;; Dependencies: a loopback registry
;;; ---------------------------------
;;; bun.lock pins ~2,500 packages for the whole monorepo.  `bun install
;;; --frozen-lockfile' needs no package metadata, only tarballs: it computes
;;; each URL from the lockfile and checks the download against the sha512 the
;;; lockfile records.  (patches npm opencode) pins exactly the tarballs that
;;; install requests for packages/cli and packages/app, one origin each, with
;;; those same sha512 hashes.  The 'install-node-modules phase serves the
;;; origins from a small Bun HTTP server on 127.0.0.1 and points Bun's
;;; registry, and GITHUB_API_URL for the one github: dependency, at it.  Bun
;;; therefore does the real install itself: its isolated node_modules layout,
;;; the workspace links, and the patches under patches/ that bun.lock applies
;;; to a dozen packages.  Lifecycle scripts are skipped (--ignore-scripts), as
;;; in upstream's own Nix packaging.
;;;
;;; Regenerate the origin list with tools/update-opencode-npm.sh after a
;;; version bump.
;;;
;;; Bun, and why it is patchelf'd here
;;; ----------------------------------
;;; package.json pins bun@1.4.4, which is (patches bun-bootstrap), the prebuilt
;;; release binary.  That package starts it through ld.so, which leaves
;;; process.execPath pointing at the loader.  For opencode that is fatal:
;;; Bun.build({compile}) makes the executable by copying the running Bun, so it
;;; would copy ld.so.  Instead the build uses a private copy of Bun whose
;;; PT_INTERP patchelf has set to the store's loader.  With patchelf 0.18 that
;;; is safe for Bun 1.4.4: compiled programs keep their payload in a `.bun'
;;; ELF section, and both the patched Bun and the executables it compiles
;;; were checked to run, with process.execPath correct.  The executable thus
;;; inherits the store loader and needs no wrapper of that kind.
;;;
;;; Native code inside the executable
;;; ---------------------------------
;;; The bundle embeds prebuilt native files from npm and loads them from a
;;; temporary directory at run time.  Built for an FHS system, they need:
;;;
;;;   * libopentui.so (@opentui/core-linux-x64, the TUI renderer, Zig): a
;;;     RUNPATH for what it dlopen()s by soname -- Wayland for clipboard
;;;     images, PulseAudio and ALSA for opencode's attention sounds.
;;;   * watcher.node (@parcel/watcher): libstdc++/libgcc_s, which the Bun
;;;     runtime does not load, so a RUNPATH to GCC's libraries.
;;;   * opencode-pty (@opencode/pty, Rust): an executable with an FHS
;;;     PT_INTERP, so the store loader.
;;;
;;; They are patched in node_modules before the bundle is built, so what is
;;; embedded is already fixed.  The store paths in them are references of the
;;; output, which keeps those libraries alive.

(define-module (patches opencode)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (gnu packages bash)                ; bash-minimal
  #:use-module (gnu packages elf)                 ; patchelf
  #:use-module (gnu packages freedesktop)         ; wayland
  #:use-module (gnu packages gcc)                 ; gcc:lib
  #:use-module (gnu packages linux)               ; alsa-lib
  #:use-module (gnu packages node)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages rust-apps)           ; ripgrep
  #:use-module (patches bun-bootstrap)
  #:use-module (patches npm opencode))

;;; The stand-in registry.  argv: a TSV of "URL-path<TAB>file" lines, and a
;;; file to write the chosen port to.
(define %registry-script
  "const fs = require('fs')
const files = new Map(
  fs.readFileSync(process.argv[2], 'utf8').trim().split('\\n').map((line) => line.split('\\t')),
)
const server = Bun.serve({
  hostname: '127.0.0.1',
  port: 0,
  fetch(request) {
    const path = decodeURIComponent(new URL(request.url).pathname)
    const file = files.get(path)
    if (file) return new Response(Bun.file(file))
    console.error('registry: no origin for ' + path)
    return new Response('not found', { status: 404 })
  },
})
fs.writeFileSync(process.argv[3], String(server.port))
")

(define-public opencode
  (package
    (name "opencode")
    (version "2.2.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/anomalyco/opencode/archive/"
                           "refs/tags/v" version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1fjgvj5r57zlg6vxgyq8fybicb289n8kkvw2d6iwghj7dkgiwqh4"))))
    (build-system gnu-build-system)
    (arguments
     (list
      ;; Stripping would rewrite the executable, whose bundle lives in an ELF
      ;; section; upstream's packaging never strips it either.
      #:strip-binaries? #f
      ;; Bun lists ld-linux-x86-64.so.2 as NEEDED.  The loader satisfies that
      ;; itself, but the RUNPATH check only exempts libc's other libraries.
      #:validate-runpath? #f
      #:modules '((guix build gnu-build-system)
                  (guix build utils)
                  (ice-9 match)
                  (ice-9 popen)
                  (ice-9 textual-ports))
      #:phases
      #~(let ((command-output
               (lambda command
                 ;; What COMMAND prints on standard output; error if it fails.
                 (let* ((port (apply open-pipe* OPEN_READ command))
                        (output (get-string-all port)))
                   (unless (zero? (status:exit-val (close-pipe port)))
                     (error "command failed" command))
                   output))))
         (modify-phases %standard-phases
          (delete 'bootstrap)
          (delete 'configure)
          ;; The build runs its scripts with `bun script.ts', so no source
          ;; shebang is used.  Left alone, src/index.ts's `#!/usr/bin/env
          ;; bun' would be rewritten to bun-bootstrap, and the bundle keeps
          ;; that line, which made bun-bootstrap a run-time reference.
          (delete 'patch-source-shebangs)
          (delete 'patch-generated-file-shebangs)

          ;; A Bun whose PT_INTERP is the store's loader; see the comment at
          ;; the top of this file.  HOME must be writable: Bun keeps state
          ;; there, and $HOME is /homeless-shelter in the build environment.
          (add-before 'build 'prepare-bun
            (lambda* (#:key inputs #:allow-other-keys)
              (let* ((bin (string-append (getcwd) "/.guix/bin"))
                     (bun (string-append bin "/bun")))
                (mkdir-p bin)
                (copy-file (search-input-file inputs "libexec/bun/bun") bun)
                (chmod bun #o755)
                (invoke "patchelf" "--set-interpreter"
                        (search-input-file inputs "lib/ld-linux-x86-64.so.2")
                        bun)
                (setenv "PATH" (string-append bin ":" (getenv "PATH")))
                (setenv "HOME" (string-append (getcwd) "/.guix/home"))
                (mkdir-p (getenv "HOME"))
                (invoke "bun" "--version"))))

          ;; `bun install' against a loopback registry serving the pinned
          ;; origins.  The flags must match tools/update-opencode-npm.sh,
          ;; which records the tarballs this install asks for.
          (add-after 'prepare-bun 'install-node-modules
            (lambda _
              (call-with-output-file ".guix/registry.tsv"
                (lambda (port)
                  (for-each (match-lambda
                              ((path . file)
                               (format port "~a\t~a~%" path file)))
                            (list #$@(map (lambda (entry)
                                            #~(cons #$(car entry)
                                                    #$(cdr entry)))
                                          %opencode-npm-sources)))))
              (call-with-output-file ".guix/registry.js"
                (lambda (port)
                  (display #$%registry-script port)))
              (let ((pid (primitive-fork)))
                (when (zero? pid)
                  (catch #t
                    (lambda ()
                      (execlp "bun" "bun" ".guix/registry.js"
                              ".guix/registry.tsv" ".guix/registry.port"))
                    (lambda _
                      (primitive-_exit 127))))
                (let loop ()
                  (unless (and (file-exists? ".guix/registry.port")
                               (positive? (stat:size
                                           (stat ".guix/registry.port"))))
                    (match (waitpid pid WNOHANG)
                      ((0 . _) (usleep 100000) (loop))
                      ((_ . status)
                       (error "the loopback registry exited" status)))))
                (let ((url (string-append
                            "http://127.0.0.1:"
                            (call-with-input-file ".guix/registry.port"
                              get-string-all))))
                  (setenv "BUN_CONFIG_REGISTRY" (string-append url "/"))
                  (setenv "GITHUB_API_URL" url)
                  (setenv "BUN_INSTALL_CACHE_DIR"
                          (string-append (getcwd) "/.guix/cache"))
                  (dynamic-wind
                    (const #t)
                    (lambda ()
                      (invoke "bun" "install" "--frozen-lockfile"
                              "--ignore-scripts" "--no-progress"
                              "--os=linux" "--cpu=x64"
                              "--filter" "./packages/cli"
                              "--filter" "./packages/app"))
                    (lambda ()
                      (kill pid SIGTERM)
                      (waitpid pid)))))))

          ;; Make the installed tree usable in the build environment and the
          ;; embedded native files usable on Guix.
          (add-after 'install-node-modules 'patch-node-modules
            (lambda* (#:key inputs #:allow-other-keys)
              (define (lib input)
                (string-append input "/lib"))
              (define (installed pattern)
                ;; Installed files whose full name matches PATTERN; at least
                ;; one must.  (A regexp given to find-files would only be
                ;; matched against base names.)
                (let* ((regexp (make-regexp pattern))
                       (files (find-files "node_modules/.bun"
                                          (lambda (file stat)
                                            (regexp-exec regexp file)))))
                  (when (null? files)
                    (error "no installed file matches" pattern))
                  files))
              (define (set-runpath file . directories)
                (invoke "patchelf" "--set-rpath"
                        (string-join directories ":") file))

              ;; Package binaries are started by name from scripts (`vite
              ;; build'), and the build environment has no /usr/bin/env.
              ;; Links to optional packages for other platforms dangle.
              (for-each
               (lambda (bin-dir)
                 (for-each (lambda (entry)
                             (when (and (file-exists? entry)
                                        (not (file-is-directory? entry)))
                               (patch-shebang (canonicalize-path entry))))
                           (find-files bin-dir)))
               (append (find-files "node_modules" "^\\.bin$"
                                   #:directories? #t)
                       (find-files "packages" "^\\.bin$"
                                   #:directories? #t)))

              (for-each (lambda (file)
                          (set-runpath file
                                       (lib #$(this-package-input "wayland"))
                                       (lib #$(this-package-input "pulseaudio"))
                                       (lib #$(this-package-input "alsa-lib"))))
                        (installed "/core-linux-x64/libopentui\\.so$"))
              (for-each (lambda (file)
                          (set-runpath file (lib #$gcc:lib)))
                        (installed "/watcher-linux-x64-glibc/watcher\\.node$"))
              (for-each (lambda (file)
                          (invoke "patchelf" "--set-interpreter"
                                  (search-input-file
                                   inputs "lib/ld-linux-x86-64.so.2")
                                  file))
                        (installed "/pty-linux-x64-gnu/bin/opencode-pty$"))))

          (replace 'build
            (lambda _
              (setenv "OPENCODE_VERSION" #$version)
              (setenv "OPENCODE_CHANNEL" "latest")
              (with-directory-excursion "packages/cli"
                ;; --single: only this platform.  --skip-install: the script
                ;; would otherwise `bun install' every platform's native
                ;; packages, over the network.
                (invoke "bun" "./script/build.ts" "--single" "--skip-install"))))

          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (let* ((executable
                        "packages/cli/dist/cli-linux-x64/bin/opencode")
                       (reported (command-output executable "--version")))
                  (unless (string-contains reported #$version)
                    (error "unexpected --version output" reported))
                  ;; The native files embedded in the executable must be the
                  ;; patched ones, whose RUNPATHs name these directories.
                  (for-each (lambda (input)
                              (invoke "grep" "-qF" (string-append input "/lib")
                                      executable))
                            (list #$gcc:lib
                                  #$(this-package-input "wayland")
                                  #$(this-package-input "pulseaudio")
                                  #$(this-package-input "alsa-lib")))))))

          (replace 'install
            (lambda* (#:key inputs #:allow-other-keys)
              (let* ((bin (string-append #$output "/bin"))
                     (opencode (string-append bin "/opencode"))
                     (share (string-append #$output "/share")))
                (install-file "packages/cli/dist/cli-linux-x64/bin/opencode"
                              bin)
                ;; The executable needs nothing from the environment, but
                ;; opencode looks for `rg' on PATH and downloads a copy
                ;; into ~/.cache/opencode/bin when there is none; and
                ;; it must not try to replace itself in the store.
                (wrap-program opencode
                  #:sh (search-input-file inputs "bin/bash")
                  '("OPENCODE_DISABLE_AUTOUPDATE" = ("true"))
                  `("PATH" suffix
                    (,(dirname (search-input-file inputs "bin/rg")))))
                ;; Upstream's npm package installs the same CLI under this
                ;; second name as well.
                (symlink "opencode" (string-append bin "/opencode2"))

                (for-each
                 (match-lambda
                   ((shell file)
                    (let ((file (string-append share "/" file)))
                      (mkdir-p (dirname file))
                      (call-with-output-file file
                        (lambda (port)
                          (display (command-output opencode "--completions"
                                                   shell)
                                   port))))))
                 '(("bash" "bash-completion/completions/opencode")
                   ("zsh" "zsh/site-functions/_opencode")
                   ("fish" "fish/vendor_completions.d/opencode.fish"))))))))))
    (native-inputs
     (list bun-bootstrap
           node
           patchelf))
    (inputs
     (list alsa-lib
           bash-minimal
           `(,gcc "lib")
           pulseaudio
           ripgrep
           wayland))
    ;; bun-bootstrap and the pinned native npm packages are x86_64 only.
    (supported-systems '("x86_64-linux"))
    (home-page "https://opencode.ai")
    (synopsis "Open source AI coding agent for the terminal")
    (description
     "opencode is an AI coding agent.  It reads and edits code, runs commands,
and works with models from many providers, including Anthropic, OpenAI, Google
and local models.  Its terminal interface is the default; @command{opencode
serve} runs its API server, which other clients can drive and which also serves
a browser interface built into the same executable.

This package compiles opencode and its web interface from the release
sources.  The Bun runtime and the npm dependencies, some of which contain
native code, come prebuilt from their upstream releases.  Automatic updates
are disabled; update through Guix instead.")
    (license license:expat)))
