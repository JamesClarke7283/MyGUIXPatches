;;; -*- mode: scheme; -*-
;;;
;;; mullvad-vpn --- the Mullvad VPN daemon and command-line client, built
;;; from source.
;;;
;;; Upstream: https://github.com/mullvad/mullvadvpn-app, tag 2026.5, GPL-3.0.
;;;
;;; Scope
;;; -----
;;; This package builds the Rust half of the client:
;;;
;;;   mullvad-daemon    the privileged daemon that owns the tunnel
;;;   mullvad           the command-line client ("mullvad status", ...)
;;;   mullvad-exclude   the helper used for split tunnelling
;;;
;;; The Electron desktop GUI is not included.  Upstream ships it as an npm
;;; workspace under desktop/, and this Guix has no npm importer
;;; (guix import npm is not a valid importer here), so its package-lock.json
;;; cannot be turned into package inputs.  See README.md.
;;;
;;; Dependencies
;;; ------------
;;; (patches crates mullvad) carries one crate-source origin per entry in
;;; upstream's Cargo.lock, generated with
;;;
;;;   guix import crate mullvad-daemon -f Cargo.lock
;;;
;;; They are passed through #:cargo-inputs because that is the only slot that
;;; accepts origins: a package cannot list raw origins in its own inputs (Guix
;;; rejects them), and expand-crate-sources requires each entry to be a proper
;;; two-element (label origin) list.  unpack-rust-crates then expands every
;;; tarball into the vendor directory and patch-cargo-checksums stubs the
;;; .cargo-checksum.json files, so the build stays offline.
;;;
;;; Two adjustments are needed to get past the resolver, and both are in the
;;; 'vendor-dependency phase below with their reasoning:
;;;
;;;   * udp-over-tcp comes from a git fork, not crates.io.  Directory-source
;;;     vendoring only replaces crates.io, so the declaration is rewritten to
;;;     point at the vendored copy.
;;;   * that crate also declares optional dependencies (cadence behind its
;;;     "statsd" feature) that upstream's lock does not contain, and a
;;;     from-scratch resolution wants them anyway.
;;;
;;; KNOWN GAP -- read README.md before trying to build this
;;; --------------------------------------------------------
;;; As written, this package gets through vendoring, the git rewrite and the
;;; pregenerated-file check, but the resolver still asks for a few crates that
;;; upstream's lock prunes and that guix import therefore never emitted:
;;;
;;;   test-log (dev-dependency of talpid-core)
;;;     -> env_logger -> jiff -> jiff-static, portable-atomic-util
;;;
;;; cadence is stripped below; the rest of that subtree is not, because a
;;; line-oriented prune is too blunt for it: where a crate declares a
;;; dependency as its own table ([dependencies.test-log]) the header would go
;;; while the keys stayed, and cargo then fails with "duplicate key".  Doing it
;;; properly needs a TOML parser, which build phases cannot have (no
;;; (ice-9 rdelim), no srfi-1, no TOML reader in scope).
;;;
;;; The clean fix is to stop deriving the vendor set from the lock at all:
;;; run `cargo vendor' once, ship its output as a tarball, and point
;;; [source.vendored-sources] at it with the .cargo-checksum.json files intact.
;;; That is the outstanding work recorded in README.md.
;;;
;;; Runtime
;;; -------
;;; mullvad-daemon does not speak WireGuard itself: it spawns a wireguard-go
;;; binary from its resource directory (MULLVAD_RESOURCE_DIR) and drives it
;;; over a unix socket.  wireguard-go is packaged in (patches wireguard), and
;;; mullvad-vpn-service-type in (patches services vpn) wires the two together
;;; for Guix System -- which uses the Shepherd, not systemd, so upstream's
;;; dist-assets/linux/mullvad-daemon.service does not apply.

(define-module (patches vpn)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  ;; (guix packages) exports a `replace' of its own -- the modify-inputs
  ;; helper -- which shadows the modify-phases helper of the same name.  Hide
  ;; it so the `replace' used in the phases below is unambiguous.  Both imports
  ;; are needed: gexps are compiled in the namespace of the module they appear
  ;; in, so modify-phases must be bound here too.
  #:use-module ((guix packages) #:hide (replace))
  #:use-module (guix build utils)
  #:use-module (guix build-system cargo)
  #:use-module (guix licenses)
  #:use-module (gnu packages pkg-config)
  #:use-module (patches crates mullvad))

(define-public mullvad-vpn
  (package
    (name "mullvad-vpn")
    (version "2026.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mullvad/mullvadvpn-app/"
                           "archive/refs/tags/" version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08sd6yh9l0m52d7sgpi5gwm6agw2rq6zz2gd8z93gw31imfk8cx1"))))
    (build-system cargo-build-system)
    (arguments
     (list
      ;; One (label origin) pair per crate in upstream's Cargo.lock, generated
      ;; by tools/update-mullvad-crates.sh.  This goes through the deprecated
      ;; #:cargo-inputs keyword because that is the only slot that accepts
      ;; origins.  cargo-build-system prints a deprecation warning for it;
      ;; expected and harmless.
      #:cargo-inputs mullvad-crate-inputs

      ;; Build only the three workspace members we ship.
      ;;
      ;; No --locked: cargo-build-system deletes Cargo.lock in its 'configure
      ;; phase, so there is nothing to lock against.
      ;;
      ;; NB: the value must be a *sexp to evaluate*, not a literal list.
      ;; cargo-build-system passes it through sexp->gexp and the build phase
      ;; splices the evaluated result into `("cargo" "build" ...)'.  A literal
      ;; '("--release" ...) therefore gets evaluated as code and dies with
      ;; `Wrong type to apply: "--release"'.  Upstream uses the same ''(...)
      ;; idiom, e.g. gnu/packages/rust-apps.scm.
      #:cargo-build-flags
      ''("--release"
         "--package" "mullvad-daemon"
         "--package" "mullvad-cli"
         "--package" "mullvad-exclude")

      ;; Upstream's test suite wants a live account and a real tunnel.
      #:tests? #f

      ;; Do not install the crate sources into the output.
      #:install-source? #f

      #:phases
      #~(modify-phases %standard-phases
          ;; Point the git-sourced dependency at the vendored copy.
          ;;
          ;; Dead ends, recorded so they are not retried:
          ;;
          ;;   * a [patch."https://github.com/mullvad/udp-over-tcp"] table in
          ;;     the workspace manifest has no effect -- cargo loads every
          ;;     source named in Cargo.lock before it resolves, so it still
          ;;     attempts a git checkout;
          ;;   * a [source."git+..."] replacement stanza only works together
          ;;     with a lock file ("the source git+... requires a lock file to
          ;;     be present first before it can be used against vendored source
          ;;     code"), and a restored lock cannot be checksum-verified
          ;;     because patch-cargo-checksums stubs every .cargo-checksum.json
          ;;     ("unable to verify that `zerocopy-derive v0.8.31' is the same
          ;;     as when the lockfile was generated").
          ;;
          ;; Rewriting the declaration itself sidesteps both: with a path
          ;; dependency cargo never sees a git source at all.
          (add-after 'configure 'vendor-dependency
            (lambda _
              ;; Helpers are defined here on purpose: build phases run with
              ;; only (guix build utils) and the %gnu-build-system modules in
              ;; scope, so (srfi srfi-1)'s `find' and (ice-9 ftw)'s `scandir'
              ;; are unbound.  Each of those cost a build to discover.
              (define (first-directory files)
                (cond ((null? files) #f)
                      ((directory-exists? (car files)) (car files))
                      (else (first-directory (cdr files)))))
              (define (contains? haystack needle)
                (let ((n (string-length needle))
                      (m (string-length haystack)))
                  (let loop ((i 0))
                    (cond ((> (+ i n) m) #f)
                          ((string=? (substring haystack i (+ i n)) needle)
                           #t)
                          (else (loop (+ i 1)))))))
              ;; Drop every line of MANIFEST that mentions one of SUBSTRINGS.
              ;; read-line lives in (ice-9 rdelim), which build phases do not
              ;; import -- it is unbound here -- so split lines by hand from
              ;; read-char, a core binding.
              (define (read-all-lines port)
                (let loop ((chars '()) (lines '()))
                  (let ((c (read-char port)))
                    (cond ((eof-object? c)
                           (if (null? chars)
                               (reverse lines)
                               (reverse (cons (list->string (reverse chars))
                                              lines))))
                          ((char=? c #\newline)
                           (loop '()
                                 (cons (list->string (reverse chars)) lines)))
                          (else
                           (loop (cons c chars) lines))))))
              (define (drop-lines-mentioning manifest substrings)
                (let* ((lines (call-with-input-file manifest read-all-lines))
                       (kept (let loop ((rest lines))
                               (cond
                                ((null? rest) '())
                                ((let any? ((ss substrings))
                                   (and (pair? ss)
                                        (or (contains? (car rest) (car ss))
                                            (any? (cdr ss)))))
                                 (loop (cdr rest)))
                                (else
                                 (cons (car rest) (loop (cdr rest))))))))
                 (format (current-error-port)
                         "pruning ~a of ~a~%" manifest substrings)
                 ;; unpack-rust-crates copies the crates out of the store, so
                 ;; their files are read-only (mode 444) and open-file for
                 ;; writing fails with "Permission denied".
                 (make-file-writable manifest)
                 (call-with-output-file manifest
                   (lambda (port)
                     (for-each (lambda (line)
                                 (display line port)
                                 (newline port))
                               kept)))))

              ;; unpack-rust-crates names each vendor directory after the
              ;; origin's store basename.  For a crates.io origin that is
              ;; predictable, but udp-over-tcp comes from a git fork and its
              ;; directory carries a git-file-name suffix, so match on the
              ;; crate name fragment rather than guessing a prefix.
              ;;
              ;; NB: (guix build utils)' find-files skips directories unless
              ;; asked (#:directories? defaults to #f), and the vendored crate
              ;; *is* a directory -- matching without that flag silently finds
              ;; nothing.
              (let* ((vendor-dir "guix-vendor")
                     (crate-dir (first-directory
                                 (find-files vendor-dir "udp-over-tcp"
                                             #:directories? #t))))
                (unless crate-dir
                  (error "could not find the vendored udp-over-tcp crate in"
                         vendor-dir))
                (format (current-error-port)
                        "vendoring udp-over-tcp from ~a~%" crate-dir)

                ;; The declaration lives in tunnel-obfuscation/Cargo.toml, not
                ;; in the workspace manifest, and the path is relative to that
                ;; manifest -- hence the leading "../".
                (substitute* "tunnel-obfuscation/Cargo.toml"
                  (("git = \"https://github.com/mullvad/udp-over-tcp\", rev = \"[0-9a-f]+\"")
                   (string-append "path = \"../" crate-dir "\"")))

                ;; cadence backs udp-over-tcp's optional "statsd" feature and is
                ;; used only by its src/bin/ helpers, which we do not build.  It
                ;; is in neither the lock nor the vendor directory, and a
                ;; from-scratch resolution wants it anyway, so remove the
                ;; dependency and the feature that names it.
                (drop-lines-mentioning (string-append crate-dir "/Cargo.toml")
                                       '("cadence")))))

          ;; check-for-pregenerated-files rejects .a/.dll/.dylib/.exe/.lib
          ;; anywhere under the build tree, and the vendored crate sources carry
          ;; a few of them: DLL test fixtures in libloading, and prebuilt
          ;; pqclean objects in pqcrypto.  None are used by the crates we build,
          ;; and cargo will not verify them because patch-cargo-checksums
          ;; stubbed every .cargo-checksum.json.
          ;;
          ;; The crates are copied out of the store, so the directories are
          ;; read-only; make them writable first or delete-file fails with
          ;; "Permission denied".
          (add-before 'check-for-pregenerated-files 'strip-vendored-prebuilts
            (lambda _
              (invoke "chmod" "-R" "u+w" "guix-vendor")
              (for-each (lambda (file)
                          (delete-file file))
                        (find-files "guix-vendor"
                                    "\\.(a|dll|dylib|exe|lib)$"))))

          ;; cargo-build-system's own 'install phase runs
          ;; `cargo install --path ... --features ""', which is needlessly
          ;; fragile for a multi-package workspace (it would also rebuild
          ;; everything).  Copy the binaries cargo already produced instead.
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (bin (string-append out "/bin")))
                (mkdir-p bin)
                (for-each (lambda (binary)
                            (install-file (string-append "target/release/"
                                                         binary)
                                          bin))
                          '("mullvad-daemon"
                            "mullvad"
                            "mullvad-exclude"))))))))
    ;; Not needed by the crates we build, but several -sys crates in the
    ;; workspace look for pkg-config at configure time.
    (native-inputs
     (list pkg-config))
    (synopsis "Mullvad VPN daemon and command-line client")
    (description
     "This package provides the Rust components of the Mullvad VPN client:

@itemize
@item @command{mullvad-daemon}, the privileged daemon that manages the
WireGuard tunnel, DNS settings and firewall rules;
@item @command{mullvad}, the command-line client used to log in, select
relays and query the daemon's status;
@item @command{mullvad-exclude}, the helper used for split tunnelling.
@end itemize

The Electron desktop application is not included; see the README for the
status of the GUI.  Bringing a tunnel up additionally requires a
@command{wireguard-go} binary in the daemon's resource directory
(@code{MULLVAD_RESOURCE_DIR}); the service in @code{(patches services vpn)}
takes care of that.")
    (home-page "https://mullvad.net")
    (license gpl3)))
