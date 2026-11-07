;;; -*- mode: scheme; -*-
;;;
;;; mullvad-vpn-gui --- the Mullvad VPN desktop application, built from source.
;;;
;;; (patches vpn) builds the Rust daemon and command-line client.  This module
;;; builds the Electron desktop client from the same upstream tarball and
;;; packages it with an Electron runtime, so both halves come from one version.
;;;
;;; npm dependencies
;;; ----------------
;;; The GUI lives in desktop/, an npm workspace whose lockfile pins 781
;;; packages.  This Guix has no `guix import npm', so the lockfile cannot be
;;; turned into node-build-system inputs.  Instead, (patches npm mullvad-desktop)
;;; pins one origin per tarball named in package-lock.json, and the build phase
;;; below unpacks them into the node_modules layout the lock describes.  The
;;; application itself -- TypeScript, React and the workspace packages -- is
;;; then compiled by the project's own `tsc' and `vite build'.
;;;
;;; The two platform shims (nseventforwarder, windows-utils) are compiled as
;;; well, because Vite's optimizeDeps lists them, but they are imported at run
;;; time only on macOS and Windows respectively.
;;;
;;; Electron
;;; --------
;;; The runtime is nonguix's Electron.  Upstream pins 42.5.1 and nonguix has
;;; 41.0.4; the application uses stable BrowserWindow/IPC APIs, so the newer
;;; minor is not needed.  The build copies Electron's distribution into the
;;; output and places the application in resources/app, electron-builder's
;;; layout.  That makes process.resourcesPath point at our resources
;;; directory, where the application's resolveBin() helper finds a symlink to
;;; the source-built mullvad-daemon.
;;;
;;; The daemon
;;; ----------
;;; The GUI talks to the system daemon over its socket; it does not spawn it on
;;; Linux.  The daemon starts from the relay list in MULLVAD_RESOURCE_DIR
;;; (relays.json), which is installed under libexec/mullvad-vpn/resources, the
;;; directory to point the Shepherd service in (patches services vpn) at.
;;; 2026.5 no longer runs wireguard-go: it uses kernel WireGuard, or its
;;; in-process gotatun implementation, so there is no wireguard-go here.
;;;
;;; The resources directory also holds what the GUI itself runs from
;;; process.resourcesPath: mullvad-problem-report, for "Report a problem".
;;;
;;; Keep this version in step with (patches vpn): GUI and daemon must agree on
;;; their RPC protocol.

(define-module (patches mullvad-gui)
  #:use-module (srfi srfi-13)              ; string-join
  #:use-module (guix base32)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (guix licenses)
  #:use-module (gnu packages base)         ; tar
  #:use-module (gnu packages compression)  ; gzip
  #:use-module ((gnu packages glib) #:select (glib)) ; gsettings
  #:use-module (gnu packages node)
  #:use-module (nongnu packages electron)
  #:use-module (patches vpn)
  #:use-module (patches npm mullvad-desktop))

;;; Modules that main.js leaves external, plus their transitive dependencies.
;;; Vite bundles everything else into build/, so these are the only ones the
;;; packaged application needs at run time.  @neon-rs/load is reached only from
;;; the macOS and Windows shims, but it is tiny and cheaper to ship than to
;;; special-case.
(define %runtime-modules
  (list
   "node_modules/@grpc/grpc-js"
   "node_modules/@grpc/proto-loader"
   "node_modules/@js-sdsl/ordered-map"
   "node_modules/@protobufjs/aspromise"
   "node_modules/@protobufjs/base64"
   "node_modules/@protobufjs/codegen"
   "node_modules/@protobufjs/eventemitter"
   "node_modules/@protobufjs/fetch"
   "node_modules/@protobufjs/float"
   "node_modules/@protobufjs/path"
   "node_modules/@protobufjs/pool"
   "node_modules/@protobufjs/utf8"
   "node_modules/@types/node"
   "node_modules/@xmldom/xmldom"
   "node_modules/ansi-styles"
   "node_modules/base64-js"
   "node_modules/big-integer"
   "node_modules/bplist-creator"
   "node_modules/bplist-parser"
   "node_modules/color-convert"
   "node_modules/color-name"
   "node_modules/emoji-regex"
   "node_modules/escalade"
   "node_modules/google-protobuf"
   "node_modules/is-fullwidth-code-point"
   "node_modules/lodash.camelcase"
   "node_modules/long"
   "node_modules/nseventforwarder"
   "node_modules/plist"
   "node_modules/protobufjs"
   "node_modules/require-directory"
   "node_modules/simple-plist"
   "node_modules/stream-buffers"
   "node_modules/undici-types"
   "node_modules/windows-utils"
   "node_modules/xmlbuilder"
   "node_modules/yargs"
   "node_modules/yargs/node_modules/ansi-regex"
   "node_modules/yargs/node_modules/cliui"
   "node_modules/yargs/node_modules/get-caller-file"
   "node_modules/yargs/node_modules/string-width"
   "node_modules/yargs/node_modules/strip-ansi"
   "node_modules/yargs/node_modules/wrap-ansi"
   "node_modules/yargs/node_modules/y18n"
   "node_modules/yargs/node_modules/yargs-parser"
   "node_modules/@neon-rs/load"))

(define %runtime-modules-string
  (string-join %runtime-modules "\n"))

(define-public mullvad-vpn-gui
  (package
    (name "mullvad-vpn-gui")
    (version "2026.5")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/mullvad/mullvadvpn-app/"
                           "archive/refs/tags/" version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "08sd6yh9l0m52d7sgpi5gwm6agw2rq6zz2gd8z93gw31imfk8cx1"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (src (assoc-ref %build-inputs "source"))
                 (node (assoc-ref %build-inputs "node"))
                 (tar (assoc-ref %build-inputs "tar"))
                 (gzip (assoc-ref %build-inputs "gzip"))
                 (electron (assoc-ref %build-inputs "electron"))
                 (mullvad (assoc-ref %build-inputs "mullvad-vpn"))
                 (appdir (string-append out "/libexec/mullvad-vpn"))
                 (resources (string-append appdir "/resources"))
                 (app (string-append resources "/app"))
                 (pkg "desktop/packages/mullvad-vpn")
                 (wrapper (string-append out "/bin/mullvad-vpn")))
            (setenv "PATH" (string-append tar "/bin:" gzip "/bin:" node "/bin"))
            (invoke "tar" "xzf" src)
            (chdir "mullvadvpn-app-2026.5")

            ;; 1. Unpack every npm tarball where the lockfile says it belongs.
            ;;    The tarballs have a single ./package/ level, hence
            ;;    --strip-components.
            (for-each
             (lambda (entry)
               (let* ((rel (car entry))
                      (origin (cdr entry))
                      (dir (string-append "desktop/" rel)))
                 (mkdir-p dir)
                 (invoke "tar" "xzf" origin "--strip-components=1"
                         "-C" dir)))
             (list #$@(map (lambda (pair)
                             #~(cons #$(car pair) #$(cdr pair)))
                           %mullvad-desktop-npm-sources)))

            ;; 2. npm's workspace links:
            ;;    node_modules/<name> -> ../packages/<name>.
            (for-each
             (lambda (name)
               (let ((link (string-append "desktop/node_modules/" name)))
                 (mkdir-p (dirname link))
                 (symlink (string-append "../packages/" name) link)))
             '("management-interface" "mullvad-vpn"
               "nseventforwarder" "windows-utils"))

            ;; 3. Compile the two TypeScript workspace shims.  Vite's
            ;;    optimizeDeps names nseventforwarder, so its lib/index.cjs
            ;;    must exist before the application is built.
            (for-each
             (lambda (name)
               (with-directory-excursion (string-append "desktop/packages/" name)
                 (invoke (string-append node "/bin/node")
                         "../../node_modules/typescript/bin/tsc")))
             '("nseventforwarder" "windows-utils"))

            ;; 3b. The GUI asks gsettings for the icon theme, to pick app icons
            ;;     on the split-tunnelling page.  It runs it by bare name with
            ;;     an environment of only XDG_CURRENT_DESKTOP, so there is no
            ;;     PATH and the shell's default (/usr/bin:/bin...) has no
            ;;     gsettings on Guix: "Error while retrieving theme", code 127,
            ;;     on every start.  Name glib's gsettings in full, and pass on
            ;;     what it needs from a GNOME session to read the real setting:
            ;;     XDG_DATA_DIRS for the schemas, GIO_EXTRA_MODULES for dconf.
            (substitute* (string-append
                          pkg "/src/main/linux-desktop-entry.ts")
              (("'gsettings get org\\.gnome\\.desktop\\.interface icon-theme'")
               (string-append "'" #$glib:bin "/bin/gsettings"
                              " get org.gnome.desktop.interface icon-theme'"))
              (("\\{ env: \\{ XDG_CURRENT_DESKTOP: xdgCurrentDesktop \\} \\}")
               (string-append
                "{ env: { XDG_CURRENT_DESKTOP: xdgCurrentDesktop,"
                " XDG_DATA_DIRS: process.env.XDG_DATA_DIRS ?? '',"
                " GIO_EXTRA_MODULES: process.env.GIO_EXTRA_MODULES ?? '' } }")))

            ;; 4. Build main, preload and renderer into
            ;;    desktop/packages/mullvad-vpn/build.
            ;;
            ;;    ELECTRON_OVERRIDE_DIST_PATH keeps the `electron' npm shim
            ;;    (whose postinstall was not run) from throwing when Vite's
            ;;    plugin reads it; the path points at the real nonguix binary.
            (with-directory-excursion pkg
              (setenv "NODE_ENV" "production")
              (setenv "ELECTRON_OVERRIDE_DIST_PATH"
                      (string-append electron "/share/electron"))
              (invoke (string-append node "/bin/node")
                      "node_modules/vite/bin/vite.js" "build"))

            ;; 5. Copy the runtime assets the project's own build script
            ;;    (tasks/build.cjs) would normally place in build/.
            (for-each
             (lambda (pair)
               (let ((from (car pair))
                     (to (string-append pkg "/build/" (cdr pair))))
                 (mkdir-p to)
                 (copy-recursively from to)))
             (list (cons (string-append pkg "/assets/images") "assets/images")
                   (cons (string-append pkg "/assets/icons") "assets/icons")
                   (cons "dist-assets/geo" "assets/geo")
                   (cons (string-append pkg "/locales") "locales")))

            ;; 6. Install Electron's distribution and the application in
            ;;    resources/app, the layout electron-builder produces.
            (mkdir-p appdir)
            (copy-recursively (string-append electron "/share/electron") appdir)
            (mkdir-p app)
            (copy-recursively (string-append pkg "/build")
                              (string-append app "/build"))
            (copy-file (string-append pkg "/package.json")
                       (string-append app "/package.json"))
            (copy-file (string-append pkg "/changes.txt")
                       (string-append app "/changes.txt"))
            ;; The upstream manifest says 0.0.0; the GUI derives its displayed
            ;; version from app.getVersion(), and the daemon checks it against
            ;; its own.
            (make-file-writable (string-append app "/package.json"))
            (substitute* (string-append app "/package.json")
              (("\"version\": \"0.0.0\"")
               "\"version\": \"2026.5\""))

            ;; 7. Runtime node_modules: the externals main.js leaves out of the
            ;;    bundle, and their dependencies.
            (let ((paths (string-split #$%runtime-modules-string #\newline)))
              (for-each
               (lambda (rel)
                 (unless (or (string=? rel "")
                             (member rel '("node_modules/nseventforwarder"
                                           "node_modules/windows-utils")))
                   (let ((from (string-append "desktop/" rel))
                         (to (string-append app "/" rel)))
                     (mkdir-p (dirname to))
                     (copy-recursively from to))))
               paths))
            ;; The two workspace packages are symlinks under node_modules, so
            ;; copy them from their real location (with the lib/ that tsc made).
            (for-each
             (lambda (name)
               (copy-recursively (string-append "desktop/packages/" name)
                                 (string-append app "/node_modules/" name)))
             '("nseventforwarder" "windows-utils"))

            ;; 8. Daemon and tunnel resources.  resolveBin() looks helper
            ;;    binaries up in process.resourcesPath: mullvad-daemon, and
            ;;    mullvad-problem-report for the "Report a problem" page.  The
            ;;    daemon reads relays.json from MULLVAD_RESOURCE_DIR.
            (for-each
             (lambda (binary)
               (symlink (string-append mullvad "/bin/" binary)
                        (string-append resources "/" binary)))
             '("mullvad-daemon" "mullvad-problem-report"))
            (copy-file "dist-assets/ca.crt"
                       (string-append resources "/ca.crt"))
            (copy-file "dist-assets/relays/relays.json"
                       (string-append resources "/relays.json"))
            (copy-file "CHANGELOG.md"
                       (string-append resources "/CHANGELOG.md"))

            ;; 9. Launcher.  Reuse nonguix's Electron wrapper -- it exports
            ;;    LD_LIBRARY_PATH, FONTCONFIG_PATH and
            ;;    ELECTRON_OZONE_PLATFORM_HINT -- but exec our copy of the
            ;;    binary with the app directory, which is what makes
            ;;    process.resourcesPath ours.  The userns check mirrors
            ;;    dist-assets/linux/mullvad-gui-launcher.sh.
            ;;
            ;;    ELECTRON_RUN_AS_NODE is cleared because Electron-based tools
            ;;    (editors, agent shells) export it to their children.
            ;;    Inherited, it makes Electron start the app as plain Node,
            ;;    which dies at once with "The requested module 'electron'
            ;;    does not provide an export named 'screen'".
            (mkdir-p (dirname wrapper))
            (copy-file #$(file-append electron-41 "/bin/electron") wrapper)
            (make-file-writable wrapper)
            (substitute* wrapper
              (("^export LD_LIBRARY_PATH=\"")
               (string-append "export LD_LIBRARY_PATH=\"" appdir ":"))
              (("^exec -a \"\\$0\".*$")
               (string-append
                "unset ELECTRON_RUN_AS_NODE\n"
                "if [ -e /proc/sys/kernel/unprivileged_userns_clone ] && "
                "grep -q 0 /proc/sys/kernel/unprivileged_userns_clone; then "
                "set -- --no-sandbox \"$@\"; fi\n"
                "exec -a \"$0\" \"" appdir "/electron\" \"" app "\" \"$@\"")))
            (chmod wrapper #o555)

            ;; 10. Desktop entry and icon.  The package ships icon.ico/icns
            ;;     only, but installer-downloader has a scalable logo.
            (let ((applications (string-append out "/share/applications"))
                  (icons (string-append
                          out "/share/icons/hicolor/scalable/apps")))
              (mkdir-p applications)
              (mkdir-p icons)
              (copy-file "installer-downloader/assets/logo-icon.svg"
                         (string-append icons "/mullvad-vpn.svg"))
              (call-with-output-file
                  (string-append applications "/mullvad-vpn.desktop")
                (lambda (port)
                  (format port "[Desktop Entry]~%")
                  (format port "Type=Application~%")
                  (format port "Name=Mullvad VPN~%")
                  (format port "Comment=Privacy-focused VPN client~%")
                  (format port "Exec=~a %U~%" wrapper)
                  (format port "Icon=mullvad-vpn~%")
                  (format port "Terminal=false~%")
                  (format port "Categories=Network;Security;~%")
                  (format port "Keywords=vpn;mullvad;wireguard;~%")
                  (format port "StartupWMClass=mullvad-vpn~%")
                  (format port "StartupNotify=true~%")))
              #t)

            #t))))
    (native-inputs
     (list node
           tar
           gzip))
    (inputs
     (list electron-41
           mullvad-vpn))
    (supported-systems '("x86_64-linux"))
    (synopsis "Mullvad VPN desktop client")
    (description
     "This package builds the Mullvad VPN Electron desktop client from the
same upstream source as @code{mullvad-vpn}, the daemon and command-line
client.

The npm dependency tree is unpinned from upstream's @file{package-lock.json}
and fetched as individual Guix origins, then unpacked into the
@file{node_modules} layout the lock describes; the application itself is
compiled by the project's own @command{tsc} and Vite.  The runtime is
nonguix's Electron, laid out the way electron-builder does it so that the
application's @code{process.resourcesPath} refers to the package's own
resources directory.

Bringing a tunnel up still requires the daemon from @code{mullvad-vpn} to be
running; the @code{libexec/mullvad-vpn/resources} directory holds the
@file{relays.json} it starts from, and is meant to be used as the Shepherd
service's resource directory.")
    (home-page "https://mullvad.net")
    (license gpl3)))
