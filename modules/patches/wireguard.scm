;;; -*- mode: scheme; -*-
;;;
;;; wireguard-go: the userspace WireGuard implementation, built from source.
;;;
;;; This package exists for mullvad-vpn.  mullvad-daemon does not speak
;;; WireGuard itself: it spawns a `wireguard-go' binary found in its
;;; resource directory (MULLVAD_RESOURCE_DIR) and configures it over a
;;; unix socket.  Guix has no package for that binary, so tunnels cannot
;;; be brought up without it.
;;;
;;; Why this builds at all with the Go modules Guix already has:
;;;
;;; Guix's go-build-system builds in GOPATH mode -- it exports
;;; GO111MODULE=off and unpacks every input at $GOPATH/src/<import-path>
;;; (see guix/build/go-build-system.scm).  Imports are therefore resolved
;;; by *path*, not by version: no go.mod resolution, no go.sum
;;; verification, no network.  That matters here because upstream pins
;;;
;;;   golang.org/x/crypto v0.37.0   (Guix ships 0.56.0)
;;;   golang.org/x/net    v0.39.0   (Guix ships 0.58.0)
;;;   golang.org/x/sys    v0.32.0   (Guix ships 0.47.0)
;;;   golang.org/x/time   v0.7.0    (Guix ships 0.14.0)
;;;   github.com/google/btree v1.1.2 (Guix ships 1.1.3)
;;;   gvisor.dev/gvisor   v0.0.0-2025...  (Guix ships 20260831.0)
;;;
;;; Under `-mod=mod' those mismatches would be fatal; in GOPATH mode they
;;; are irrelevant, and only the packages wireguard-go actually imports
;;; get compiled.
;;;
;;; The executable is installed as `wireguard-go' rather than the name Go
;;; would derive from the import path ("wireguard"), because that is the
;;; name mullvad-daemon looks for.

(define-module (patches wireguard)
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  ;; (guix packages) exports a `replace' of its own -- the modify-inputs
  ;; helper -- which shadows the modify-phases helper of the same name.
  ;; Hide it so the `replace' used below is unambiguous.
  #:use-module ((guix packages) #:hide (replace))
  #:use-module (guix build utils)
  #:use-module (guix build-system go)
  #:use-module (guix licenses)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-xyz))

(define-public wireguard-go
  (package
    (name "wireguard-go")
    (version "0.0.20250522")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/WireGuard/wireguard-go/archive/refs/tags/"
             version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1xrmzxyli41m9x79fvwx6yqdghv4g1l5qq8gj9w1jscs526l9l3h"))))
    (build-system go-build-system)
    (arguments
     (list
      ;; go.mod declares "module golang.zx2c4.com/wireguard"; in GOPATH mode
      ;; this doubles as the directory under $GOPATH/src where unpack places
      ;; the source.
      #:import-path "golang.zx2c4.com/wireguard"
      ;; The output carries only the executable, not a copy of the sources.
      #:install-source? #f
      ;; The test suite needs to create real TUN devices and to run as root,
      ;; neither of which is available (or desirable) in the build sandbox.
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          ;; The default 'build phase runs `go install ./...', which would
          ;; name the binary after the import path ("wireguard") and scatter
          ;; it in $GOBIN.  Build the one command we ship, under its
          ;; upstream name.
          (replace 'build
            (lambda _
              (invoke "go" "build"
                      "-trimpath"
                      "-v"
                      "-o" "wireguard-go"
                      "golang.zx2c4.com/wireguard")))
          (replace 'install
            (lambda* (#:key outputs #:allow-other-keys)
              (install-file "wireguard-go"
                            (string-append (assoc-ref outputs "out")
                                           "/bin")))))))
    ;; Every module wireguard-go imports, at whatever version Guix packages.
    ;; GO111MODULE=off means the versions do not have to match go.mod.
    (native-inputs
     (list go-golang-org-x-crypto
           go-golang-org-x-net
           go-golang-org-x-sys
           go-golang-org-x-time
           go-github-com-google-btree
           go-gvisor-dev-gvisor))
    (synopsis "Userspace implementation of WireGuard in Go")
    (description
     "wireguard-go is a userspace implementation of the WireGuard secure
network tunnel.  It provides the @command{wireguard-go} executable, which
creates a TUN device and speaks the WireGuard protocol from user space, as
opposed to the in-kernel implementation.

It is used by @code{mullvad-vpn}: @command{mullvad-daemon} starts it from its
resource directory and configures it over a unix socket, so the binary must
be reachable there (see @code{mullvad-vpn-configuration-resource-directory}
in @code{(patches services vpn)}).")
    (home-page "https://www.wireguard.com/")
    (license expat)))
