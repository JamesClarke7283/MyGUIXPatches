;;; -*- mode: scheme; -*-
;;;
;;; Tailscale client and daemon, built from source with native Go dependencies.
;;;
;;; The package definitions are based on the upstream Guix patch series at
;;; https://codeberg.org/guix/guix/pulls/11849, updated for Tailscale 1.104.7.
;;; Guix's Go build system uses GOPATH mode, so each dependency is provided as
;;; a separate package instead of downloading modules during the build.
;;;

(define-module (patches tailscale)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix base32)
  #:use-module (guix build-system go)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix packages)
  #:use-module (guix utils)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages certs)
  #:use-module (gnu packages golang)
  #:use-module (gnu packages golang-build)
  #:use-module (gnu packages golang-check)
  #:use-module (gnu packages golang-compression)
  #:use-module (gnu packages golang-crypto)
  #:use-module (gnu packages golang-web)
  #:use-module (gnu packages golang-xyz)
  #:use-module (gnu packages web))

(define go-1.27.4
  (package
    (inherit go-1.27)
    (version "1.27.4")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/golang/go")
         (commit (string-append "go" version))))
       (file-name (git-file-name "go" version))
       (sha256
        (base32 "0s2r7j6fa4nwkrsqarbp5jwb0p87zh6cihidr46476my1989wy78"))))))

(define-public go-github-com-tailscale-web-client-prebuilt
  (package
    (name "go-github-com-tailscale-web-client-prebuilt")
    (version "0.0.0-20260917222731-e0ed2d0d0fea")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/tailscale/web-client-prebuilt")
         (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1azkn7lmrsakvd3yvlhizfkv60b96x0gjnw2v95jc9rjccwb0nmq"))))
    (build-system go-build-system)
    (arguments
     (list #:import-path "github.com/tailscale/web-client-prebuilt"))
    (home-page "https://github.com/tailscale/web-client-prebuilt")
    (synopsis "Pre-built web artifacts for Tailscale")
    (description
     "This package provides the pre-built artifacts for the Tailscale web client.")
    (license license:bsd-3)))

(define-public go-github-com-tailscale-wireguard-go
  (package
    (name "go-github-com-tailscale-wireguard-go")
    (version "0.0.0-20261106233718-9e0ab45c16ca")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/tailscale/wireguard-go")
         (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xbswh23bz1c0c5c8k1fwkw2sf4rr29ygbj2l8534cr5dkniawa2"))))
    (build-system go-build-system)
    (arguments
     (list
      #:tests? #f                       ;tests require network namespace setup
      #:import-path "github.com/tailscale/wireguard-go"))
    (propagated-inputs
     (list go-golang-org-x-crypto
           go-golang-org-x-net
           go-golang-org-x-sys
           go-golang-org-x-tools
           go-gvisor-dev-gvisor-source))
    (home-page "https://github.com/tailscale/wireguard-go")
    (synopsis "Go implementation of WireGuard")
    (description
     "This package provides Tailscale's fork of the userspace WireGuard
implementation in Go.")
    (license license:expat)))

(define-public go-github-com-bradfitz-monogok
  (package
    (name "go-github-com-bradfitz-monogok")
    (version "0.0.0-20260630033929-b1eef977b41f")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/bradfitz/monogok")
         (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1f0ldkc1fjv75r7q9kljhzdvwiyii8v5zk8qnhrkbdackhbqd9gp"))))
    (build-system go-build-system)
    (arguments
     (list
      ;; The command's fallback root bundle contains an irregular embedded file.
      #:skip-build? #t
      #:tests? #f
      #:import-path "github.com/bradfitz/monogok"))
    (propagated-inputs
     (list go-github-com-mattn-go-isatty
           go-github-com-spf13-cobra
           go-golang-org-x-crypto-x509roots-fallback
           go-golang-org-x-sync
           go-golang-org-x-sys))
    (home-page "https://github.com/bradfitz/monogok")
    (synopsis "Go tool to build gokrazy appliances")
    (description
     "@code{monogok} is an opinionated alternative to gokrazy's @code{gok}
tool, designed for building gokrazy appliance images from within a Go monorepo.")
    (license license:bsd-3)))

(define-public go-github-com-tailscale-gliderssh
  (package
    (name "go-github-com-tailscale-gliderssh")
    (version "0.3.4-0.20261026144310-31f7cf365d3a")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/tailscale/gliderssh")
         (commit (go-version->git-ref version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jpzl8cyqp5f4700my2p4frxvmjgrdgq4ll2nm76bx7j86fnmn8f"))))
    (build-system go-build-system)
    (arguments
     (list
      #:import-path "github.com/tailscale/gliderssh"
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'fix-tests
            (lambda* (#:key import-path #:allow-other-keys)
              (substitute* (string-append "src/" import-path "/example_test.go")
                (("github.com/gliderlabs/ssh")
                 "github.com/tailscale/gliderssh")))))
      #:test-flags
      #~(list "-skip"
              (string-join
               (list "TestLocalUnixForwardingRejectsSymlinkEscape"
                     "TestLocalUnixForwardingRespectsCallback"
                     "TestLocalUnixForwardingWorks"
                     "TestNewReverseUnixForwardingCallbackBindUnlink"
                     "TestLocalUnixForwardingAllowsSymlinkWithinAllowedDir"
                     "TestReverseUnixForwardingWorks")
               "|"))))
    (propagated-inputs
     (list go-github-com-anmitsu-go-shlex
           go-golang-org-x-crypto))
    (home-page "https://github.com/tailscale/gliderssh")
    (synopsis "Higher-level API for the crypto/ssh Go library")
    (description
     "This package provides a wrapper of the crypto/ssh package with a
higher-level API for building SSH servers.  Its API is similar to net/http.")
    (license license:bsd-3)))

(define-public tailscale
  (package
    (name "tailscale")
    (version "1.104.7")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/tailscale/tailscale")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0zzfypfpmaibvfjgjgh8fbrim83acyp6pzswwl2qdq2qcsjrkc79"))))
    (build-system go-build-system)
    (arguments
     (list
      #:go go-1.27.4
      #:build-flags
      #~(list (string-append "-ldflags="
                             " -X tailscale.com/version.shortStamp="
                             #$version " -X tailscale.com/version.longStamp="
                             #$version))
      #:import-path "tailscale.com/cmd/tailscale"
      #:unpack-path "tailscale.com"
      ;; The web client embeds compressed assets rather than their directory.
      #:embed-files
      #~(list ".*\\.html" ".*\\.js\\.gz" ".*\\.css\\.gz" ".*\\.woff2")))
    (native-inputs
     (list bash-minimal
           go-github-com-frankban-quicktest))
    (inputs
     (list esbuild
           mkcert
           go-fyne-io-systray
           go-github-com-kodeworks-golang-image-ico
           go-github-com-atotto-clipboard
           go-github-com-aws-aws-sdk-go-v2-config
           go-github-com-aws-aws-sdk-go-v2-feature-ec2-imds
           go-github-com-aws-aws-sdk-go-v2-service-ssm
           go-github-com-aws-aws-sdk-go-v2-service-sts
           go-github-com-aws-smithy-go
           go-github-com-bradfitz-monogok
           go-github-com-coder-websocket
           go-github-com-diskfs-go-diskfs
           go-github-com-fogleman-gg
           go-github-com-fxamacker-cbor-v2
           go-github-com-gaissmai-bart
           go-github-com-go-json-experiment-json
           go-github-com-godbus-dbus-v5
           go-github-com-golang-groupcache
           go-github-com-hdevalence-ed25519consensus
           go-github-com-jsimonetti-rtnetlink
           go-github-com-kballard-go-shellquote
           go-github-com-klauspost-compress
           go-github-com-mattn-go-colorable
           go-github-com-mattn-go-isatty
           go-github-com-mdlayher-netlink
           go-github-com-mitchellh-go-ps
           go-github-com-peterbourgon-ff-v3
           go-github-com-skip2-go-qrcode
           go-github-com-tailscale-goupnp
           go-github-com-tailscale-hujson
           go-github-com-tailscale-web-client-prebuilt
           go-github-com-toqueteos-webbrowser
           go-go4-org-mem
           go-go4-org-netipx
           go-golang-org-x-crypto
           go-golang-org-x-exp
           go-golang-org-x-net
           go-golang-org-x-oauth2
           go-golang-org-x-sys
           go-golang-org-x-time
           go-k8s-io-client-go
           go-sigs-k8s-io-yaml
           go-software-sslmate-com-src-go-pkcs12))
    (home-page "https://tailscale.com/")
    (synopsis "Private WireGuard mesh VPN client")
    (description
     "Tailscale is a private WireGuard software-defined mesh VPN usable with
minimal configuration.  This package provides the command-line client; the
@code{tailscaled} package provides its daemon.")
    (license license:bsd-3)))

(define-public tailscaled
  (package
    (inherit tailscale)
    (name "tailscaled")
    (arguments
     (substitute-keyword-arguments (package-arguments tailscale)
       ((#:import-path _) "tailscale.com/cmd/tailscaled")
       ((#:phases _ #~%standard-phases)
        #~(modify-phases %standard-phases
            (add-before 'build 'fix-gvisor-api
              (lambda* (#:key unpack-path #:allow-other-keys)
                (with-directory-excursion (string-append "src/" unpack-path)
                  (substitute* "wgengine/netstack/netstack.go"
                    (("opts.ClockResolution.*") "")
                    (("ns.acceptUDPNoICMP") "ns.acceptUDP")))))))))
    ;; Use Guix's generated gVisor source snapshot.  The newer full source
    ;; package retains Bazel templates that are not buildable in GOPATH mode.
    (inputs
     (modify-inputs (package-inputs tailscale)
       (append go-github-com-creachadair-msync)
       (append go-github-com-tailscale-xnet)
       (append go-github-com-jellydator-ttlcache-v3)
       (append go-github-com-tailscale-peercred)
       (append go-github-com-tailscale-wireguard-go)
       (append go-gvisor-dev-gvisor-source)
       (append go-github-com-pires-go-proxyproto)
       (append go-github-com-safchain-ethtool)
       (append go-github-com-tailscale-netlink)
       (append go-github-com-mdlayher-genetlink)
       (append go-github-com-illarion-gonotify-v3)
       (append go-github-com-digitalocean-go-smbios)
       (append go-github-com-mdlayher-sdnotify)
       (append go-github-com-insomniacslk-dhcp)
       (append go-github-com-google-go-tpm)
       (append go-github-com-kortschak-wol)
       (append go-github-com-coreos-go-iptables)
       (append go-github-com-google-nftables)
       (append go-github-com-pkg-sftp)
       (append go-github-com-tailscale-gliderssh)
       (append go-github-com-u-root-u-root)))
    (synopsis "Tailscale mesh VPN daemon")
    (description
     "This package provides @code{tailscaled}, the daemon that establishes and
maintains Tailscale WireGuard mesh VPN connections.")))

(define-public tailscale-systray
  (package
    (inherit tailscale)
    (name "tailscale-systray")
    (arguments
     (substitute-keyword-arguments (package-arguments tailscale)
       ((#:import-path _) "tailscale.com/cmd/systray")
       ((#:phases _ #~%standard-phases)
        #~(modify-phases %standard-phases
            (add-after 'install 'install-desktop-application
              (lambda* (#:key outputs unpack-path #:allow-other-keys)
                (let* ((out (assoc-ref outputs "out"))
                       (executable (string-append out "/bin/tailscale-systray"))
                       (desktop
                        (string-append
                         out "/share/applications/tailscale-systray.desktop")))
                  (rename-file (string-append out "/bin/systray") executable)
                  (with-directory-excursion (string-append "src/" unpack-path)
                    (install-file "client/systray/tailscale-systray.desktop"
                                  (string-append out "/share/applications"))
                    (install-file "client/systray/tailscale.svg"
                                  (string-append out
                                                 "/share/icons/hicolor/scalable/apps"))
                    (install-file "client/systray/tailscale.png"
                                  (string-append out
                                                 "/share/icons/hicolor/512x512/apps")))
                  (substitute* desktop
                    (("/usr/bin/tailscale systray") executable)
                    (("/usr/bin/tailscale") executable)
                    ;; Upstream hides this entry because it is normally used as
                    ;; an autostart file.  This package does not autostart it.
                    (("NoDisplay=true") "NoDisplay=false")
                    (("Categories=Network;System;") "Categories=Network;")))))))))
    (propagated-inputs
     (list tailscale tailscaled))
    (home-page "https://tailscale.com/kb/1597/linux-systray")
    (synopsis "Tailscale system tray application")
    (description
     "This package provides Tailscale's official Linux system tray application
for connecting and disconnecting, switching profiles, selecting exit nodes, and
receiving notifications.  It includes a desktop launcher and the official icons.
The @code{tailscale} and @code{tailscaled} packages are installed as runtime
dependencies.")))
