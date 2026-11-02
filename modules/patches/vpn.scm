;;; -*- mode: scheme; -*-
;;;
;;; mullvad-vpn --- the Mullvad VPN daemon and command-line client, built
;;; from source.
;;;
;;; Upstream: https://github.com/mullvad/mullvadvpn-app, tag 2026.1, GPL-3.0.
;;;
;;; Why 2026.1 and not the newest release: upstream's Cargo.toml raises
;;; rust-version as it goes, and the daemon will not build with a compiler
;;; older than that.  Guix ships rust 1.93.0 and has no rust@1.95, so:
;;;
;;;   2026.5 / 2026.4 / 2026.3   rust-version = 1.95.0   unbuildable
;;;   2026.2                     rust-version = 1.94.0   unbuildable
;;;   2026.1                     rust-version = 1.91.0   buildable  <-- this
;;;
;;; Bumping this package therefore means either picking a tag whose
;;; rust-version is <= Guix's rust, or packaging a newer rust first.
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
;;; 2026.1 does not have that problem: its lock contains test-log but no
;;; optional dependency that a from-scratch resolution then demands, so
;;; vendoring from the lock is self-consistent here.  (2026.5 was not, which
;;; is why this package is pinned back.)
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

  #:use-module (gnu packages glib)           ; dbus
  #:use-module (gnu packages linux)          ; libmnl, libnftnl
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages protobuf)       ; protobuf (protoc)
  #:use-module (patches crates mullvad))

(define-public mullvad-vpn
  (package
    (name "mullvad-vpn")
    (version "2026.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mullvad/mullvadvpn-app/"
                           "archive/refs/tags/" version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "17x81vdp80vd44g1nx5h946nlzc6silmbyv1dgab3y3cx2ykl3h1"))))
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

              ;; Remove a whole dependency table, e.g. [dependencies.env_logger]
              ;; plus the keys that belong to it, up to the next table header.
              ;; Needed because some crates declare a dependency in that
              ;; multi-line form rather than as an inline table: dropping only
              ;; the matching line leaves the header gone but the keys behind,
              ;; which cargo rejects as duplicate keys in the previous table.
              (define (drop-table manifest section)
                (let* ((lines (call-with-input-file manifest read-all-lines))
                       (kept
                        (let loop ((rest lines) (skipping? #f) (kept '()))
                          (cond
                           ((null? rest) (reverse kept))
                           ;; Any new table header ends a skip, and a header
                           ;; equal to SECTION starts one.
                           ((and (>= (string-length (car rest)) 1)
                                 (char=? (string-ref (car rest) 0) #\[))
                            (if (string=? (string-trim-right (car rest)) section)
                                (loop (cdr rest) #t kept)
                                (loop (cdr rest) #f
                                      (cons (car rest) kept))))
                           (skipping? (loop (cdr rest) #t kept))
                           (else (loop (cdr rest) #f
                                       (cons (car rest) kept)))))))
                (format (current-error-port)
                        "removing ~a from ~a~%" section manifest)
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
                                       '("cadence"))

                ;; 2026.1's udp-over-tcp is 0.3.0, which declares
                ;;
                ;;   [dependencies.env_logger]
                ;;   version = "0.10.0"
                ;;
                ;; for its src/bin/ helpers.  Upstream's lock has no 0.10 line
                ;; at all (mullvad itself uses 0.11.7), so the resolver fails
                ;; with
                ;;
                ;;   failed to select a version for the requirement
                ;;   `env_logger = "^0.10.0"`
                ;;   candidate versions found which didn't match: 0.11.7
                ;;
                ;; This one is a table rather than an inline declaration, so it
                ;; needs drop-table; the feature that named it ("cli") goes with
                ;; the same section-scan below.
                (drop-table (string-append crate-dir "/Cargo.toml")
                            "[dependencies.env_logger]")

                ;; The git checkout ships its own Cargo.lock, which pins
                ;; env_logger 0.10.0.  As a path dependency inside our
                ;; workspace that file is noise, but cargo still reads it, so
                ;; removing the dependency table above is not enough on its
                ;; own.  Drop nested lock files from the whole vendor tree:
                ;; no vendored crate is ever built as its own workspace root
                ;; here, and a stale entry in one of them can resurrect a
                ;; requirement this build cannot satisfy.
                ;;
                ;; NB: (guix build utils)' find-files matches its regexp against
                ;; each entry's path *relative to the start directory*, so an
                ;; anchored "^Cargo\.lock$" never matches a nested file
                ;; ("rust-foo-1.0/Cargo.lock") and silently deletes nothing.
                ;; Leave both ends unanchored.  Getting this wrong is invisible:
                ;; the phase still succeeds, and the only symptom is the
                ;; resolver insisting on env_logger 0.10.0 a second time.
                ;;
                ;; The crates are copied out of the store, so their
                ;; directories are read-only and delete-file would fail with
                ;; "Permission denied"; 'strip-vendored-prebuilts chmods the
                ;; tree, but that phase runs later, so do it here as well.
                (invoke "chmod" "-R" "u+w" vendor-dir)
                (let ((locks (find-files vendor-dir "Cargo\\.lock")))
                  (format (current-error-port)
                          "deleting ~a nested lock file(s) under ~a~%"
                          (length locks) vendor-dir)
                  (for-each (lambda (lock)
                              (format (current-error-port)
                                      "  dropping ~a~%" lock)
                              (delete-file lock))
                            locks))
                ;; Show what the manifest looks like *after* the rewrites above.
                ;; The resolver kept demanding env_logger ^0.10.0 even though
                ;; the table had been removed, so print the surviving lines that
                ;; mention it: either the edit is not reaching the file cargo
                ;; reads, or a second declaration survives somewhere.
                (let ((manifest (string-append crate-dir "/Cargo.toml")))
                  (format (current-error-port)
                          "manifest ~a after rewriting:~%" manifest)
                  (for-each (lambda (line)
                              (format (current-error-port) "  | ~a~%" line))
                            (call-with-input-file manifest read-all-lines)))
                (invoke "grep" "-rn" "env_logger" vendor-dir)
                ;; Also drop the git checkout's lock explicitly: it is the one
                ;; that pins env_logger 0.10.0, and if the sweep above missed it
                ;; for any reason the resolver fails again with the same
                ;; message, so verify rather than assume.
                (let ((git-lock (string-append crate-dir "/Cargo.lock")))
                  (when (file-exists? git-lock)
                    (format (current-error-port)
                            "dropping git checkout lock ~a~%" git-lock)
                    (delete-file git-lock))))))

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
    ;; protoc: mullvad-management-interface/build.rs shells out to it and
    ;; panics with "Could not find `protoc'" without it.
    ;;
    ;; gcc-toolchain: several -sys crates build C, and cargo looks for plain
    ;; "cc" on PATH.
    ;;
    ;; pkg-config: libdbus-sys looks for dbus-1.pc.
    (native-inputs
     (list protobuf
           pkg-config))
    ;; dbus: libdbus-sys.  libnftnl and libmnl: mullvad-daemon links -lnftnl
    ;; and -lmnl for its firewall/kill-switch rules.
    (inputs
     (list dbus
           libmnl
           libnftnl))
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
