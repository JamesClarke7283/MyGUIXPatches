;;; -*- mode: scheme; -*-
;;;
;;; gimp --- GIMP's current stable release, and the MCP server that drives it.
;;;
;;; GIMP MCP
;;; --------
;;; gimp-mcp (https://github.com/gimp-mcp/gimp-mcp, formerly maorcc/gimp-mcp)
;;; lets an LLM client inspect and edit images in a running GIMP 3.2.  Like
;;; Blender's MCP server it has two halves, which talk over a TCP socket on
;;; localhost:9877:
;;;
;;;   MCP client  <- MCP over stdio ->  gimp-mcp-server  <- TCP ->  GIMP plug-in
;;;
;;; Both are built here from the same pinned commit (upstream tags no
;;; releases):
;;;
;;;   gimp-mcp          gimp_mcp_server.py, a FastMCP server that installs
;;;                     bin/gimp-mcp-server.  The MCP client starts it.
;;;   gimp-mcp-plugin   gimp-mcp-plugin.py, a Python plug-in that runs inside
;;;                     GIMP and executes requests.  It is started from
;;;                     Tools > MCP > Start MCP Server.
;;;
;;; How GIMP finds the plug-in
;;; --------------------------
;;; GIMP's plug-in-path defaults to "${gimp_dir}/plug-ins:${gimp_plug_in_dir}/
;;; plug-ins", where gimp_plug_in_dir is $GIMP3_PLUGINDIR when set, and GIMP's
;;; own lib/gimp/3.0 otherwise.  It has no variable for adding directories.
;;; The gimp package below declares GIMP3_PLUGINDIR as a search path for
;;; lib/gimp/3.0.  A profile holding GIMP then points it at the profile's
;;; union of lib/gimp/3.0, which holds GIMP's own plug-ins, interpreters,
;;; environ files and modules plus every plug-in package installed beside it.
;;; Because the search path belongs to GIMP itself, the variable is only set
;;; in a profile that also supplies GIMP's own files.  GIMP follows the
;;; profile's symbolic links when it scans plug-ins.

(define-module (patches gimp)
  #:use-module (gnu packages fonts)
  #:use-module ((gnu packages gimp) #:prefix guix-)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils))

;; GIMP 3.2.8 is a bug-fix release of the 3.2 series.  Its dependency floors
;; (babl 0.1.118, GEGL 0.4.66, GLib 2.70) are met by Guix, so Guix's recipe
;; applies unchanged.
(define-public gimp
  (package
    (inherit guix-gimp)
    (version "3.2.8")
    (source
     (origin
       (inherit (package-source guix-gimp))
       (uri (string-append "https://download.gimp.org/pub/gimp/v"
                           (version-major+minor version)
                           "/gimp-" version ".tar.xz"))
       (sha256
        (base32 "0iy88rkg51fvfiqba7r1p2r4qr9g0rg8kjvwz4p3mq69mmn6k8hn"))))
    ;; See "How GIMP finds the plug-in" above.
    (native-search-paths
     (list (search-path-specification
            (variable "GIMP3_PLUGINDIR")
            (separator #f)
            (files '("lib/gimp/3.0")))))))

;; gimp-mcp requires mcp >= 1.28.1, the first release clear of
;; CVE-2025-66416, CVE-2026-52869 and CVE-2026-59950; Guix has 1.25.0.  1.30.0
;; is the last 1.x release: 2.x drops the mcp.server.fastmcp module that the
;; server imports.  Guix's package keeps most of mcp's requirements as native
;; inputs, so programs using it list them again; here they are propagated.
(define python-mcp-1.30
  (package
    (inherit python-mcp)
    (version "1.30.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mcp" version))
       (sha256
        (base32 "1r53nwh7idaxjdydaa20dymn3rpcmhdv2nshm9gjjp6fbxi18m24"))))
    (propagated-inputs
     (list python-anyio
           python-cryptography              ;for pyjwt[crypto]
           python-httpx
           python-httpx-sse
           python-jsonschema
           python-multipart
           python-pydantic
           python-pydantic-settings
           python-pyjwt
           python-sse-starlette
           python-starlette
           python-typing-extensions
           python-typing-inspection
           python-uvicorn))
    (native-inputs
     (list python-hatchling))))

(define gimp-mcp-commit "7325865385541a01aaf336ebc93b00332297f77f")

(define-public gimp-mcp
  (package
    (name "gimp-mcp")
    (version (git-version "0.1.0" "0" gimp-mcp-commit))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gimp-mcp/gimp-mcp")
             (commit gimp-mcp-commit)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cg0y2vr5mhyy6dcfiyyhxmy403jhs9iip86cf5wm386jv1sdyjm"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; Upstream's tests all talk to a running GIMP; they are run by
          ;; gimp-mcp-plugin.  Check here that the server module imports
          ;; under this mcp and registers every tool.
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (invoke "python" "-c"
                        (string-append
                         "import asyncio, gimp_mcp_server as s\n"
                         "names = [t.name for t in asyncio.run(s.mcp.list_tools())]\n"
                         "print(len(names), 'tools')\n"
                         "assert len(names) == 79, names\n"
                         "assert 'get_state_snapshot' in names\n"))))))))
    (native-inputs
     (list python-setuptools))
    (inputs
     (list python-mcp-1.30))
    (home-page "https://github.com/gimp-mcp/gimp-mcp")
    (synopsis "Model Context Protocol server for GIMP")
    (description
     "@command{gimp-mcp-server} is an MCP (Model Context Protocol) server for
GIMP 3.2.  An MCP client, such as an LLM chat program or coding agent, starts
it and talks to it over standard input and output.  It gives the language
model 79 tools for working on images open in a running GIMP: adjustments,
transforms, selections, layers, drawing, text and filters, along with PNG
snapshots of the image so the model can check each step, and execution of
arbitrary GIMP Python code.

The server reaches GIMP through the plug-in in @code{gimp-mcp-plugin}, which
must be started in GIMP from @samp{Tools > MCP > Start MCP Server}.

Code from the language model runs in GIMP without restriction, with the user's
permissions.")
    (license license:gpl3+)))

(define-public gimp-mcp-plugin
  (package
    (name "gimp-mcp-plugin")
    (version (package-version gimp-mcp))
    (source (package-source gimp-mcp))
    (build-system copy-build-system)
    (arguments
     (list
      ;; GIMP 3 requires a plug-in to sit in a directory of its own name.
      #:install-plan
      #~'(("gimp-mcp-plugin.py" "lib/gimp/3.0/plug-ins/gimp-mcp-plugin/"))
      #:phases
      #~(modify-phases %standard-phases
          ;; gradient_fill reports success but leaves the layer unchanged.
          ;; It sets x0/y0/x1/y1, which gegl:linear-gradient and
          ;; gegl:radial-gradient do not have (they take start-x, start-y,
          ;; end-x and end-y in pixels), inside a try that swallows the
          ;; error.  And the gradient has an infinite extent, so
          ;; gegl:write-buffer renders nothing into the shadow buffer unless
          ;; a crop to the drawable comes first.  Upstream's test only checks
          ;; the status; the check phase below also checks the pixels.
          (add-after 'unpack 'fix-gradient-fill
            (lambda _
              (substitute* "gimp-mcp-plugin.py"
                (("grad_node\\.set_property\\(\"x0\", x1 / w\\)")
                 "grad_node.set_property(\"start-x\", x1)")
                (("grad_node\\.set_property\\(\"y0\", y1 / h\\)")
                 "grad_node.set_property(\"start-y\", y1)")
                (("grad_node\\.set_property\\(\"x1\", x2 / w\\)")
                 "grad_node.set_property(\"end-x\", x2)")
                (("grad_node\\.set_property\\(\"y1\", y2 / h\\)")
                 "grad_node.set_property(\"end-y\", y2)")
                (("( *)grad_node\\.link\\(out_node\\)" _ indent)
                 (string-append
                  indent "crop_node = graph.create_child(\"gegl:crop\")\n"
                  indent "crop_node.set_property(\"width\", "
                  "float(drawable.get_width()))\n"
                  indent "crop_node.set_property(\"height\", "
                  "float(drawable.get_height()))\n"
                  indent "grad_node.link(crop_node)\n"
                  indent "crop_node.link(out_node)")))))
          (add-after 'install 'make-executable
            (lambda _
              (chmod (string-append #$output "/lib/gimp/3.0/plug-ins"
                                    "/gimp-mcp-plugin/gimp-mcp-plugin.py")
                     #o555)))
          ;; Run upstream's run_tests.py, 59 checks over the plug-in's socket
          ;; protocol, against the installed plug-in.  Tools that create
          ;; images open a display, so GIMP runs with its user interface on a
          ;; virtual X server rather than as gimp-console.  It also needs a
          ;; session bus: without one the interface quits during start-up.
          (add-after 'patch-shebangs 'check
            (lambda* (#:key native-inputs inputs #:allow-other-keys)
              (let* ((gimp #$(this-package-native-input "gimp"))
                     (plugindir (string-append (getcwd) "/plugindir"))
                     (home (string-append (getcwd) "/home"))
                     (gimp-log (string-append (getcwd) "/gimp.log")))
                ;; Mimic a profile holding GIMP and this package.
                (mkdir-p (string-append plugindir "/plug-ins"))
                (for-each
                 (lambda (directory)
                   (symlink (string-append gimp "/lib/gimp/3.0/" directory)
                            (string-append plugindir "/" directory)))
                 '("environ" "extensions" "interpreters" "modules"))
                (for-each
                 (lambda (plug-in)
                   (symlink plug-in (string-append plugindir "/plug-ins/"
                                                   (basename plug-in))))
                 (cons (string-append #$output "/lib/gimp/3.0/plug-ins"
                                      "/gimp-mcp-plugin")
                       (map (lambda (name)
                              (string-append gimp "/lib/gimp/3.0/plug-ins/"
                                             name))
                            (scandir (string-append gimp
                                                    "/lib/gimp/3.0/plug-ins")
                                     (lambda (name)
                                       (not (member name '("." ".."))))))))
                (mkdir-p (string-append home "/.local/share"))
                (symlink (string-append #$(this-package-native-input
                                           "font-dejavu")
                                        "/share/fonts")
                         (string-append home "/.local/share/fonts"))
                (setenv "HOME" home)
                (setenv "XDG_RUNTIME_DIR" home)
                (setenv "DISPLAY" ":1")
                (setenv "GIMP3_PLUGINDIR" plugindir)
                (spawn "Xvfb" '("Xvfb" ":1" "-screen" "0" "1280x1024x24"))
                (spawn "dbus-run-session"
                       (list "dbus-run-session" "--"
                             (string-append gimp "/bin/gimp") "--no-splash"
                             "--batch-interpreter=plug-in-script-fu-eval"
                             "-b" "(plug-in-mcp-server #:run-mode RUN-NONINTERACTIVE)")
                       #:output (open-file gimp-log "w"))
                (let loop ((seconds 0))
                  (cond ((zero? (system* "python3" "-c"
                                         (string-append
                                          "import socket; socket.create_connection"
                                          "(('127.0.0.1', 9877), 1)")))
                         #t)
                        ((< seconds 300)
                         (sleep 1)
                         (loop (+ seconds 1)))
                        (else
                         (display (call-with-input-file gimp-log get-string-all))
                         (error "the MCP plug-in did not start"))))
                (invoke "python3" "run_tests.py")
                ;; See fix-gradient-fill: check the pixels, not the status.
                (invoke "python3" "-c" "
import json, socket
def cmd(t, params):
    s = socket.create_connection(('127.0.0.1', 9877), 60)
    s.sendall(json.dumps({'type': t, 'params': params}).encode() + b'\\n')
    r = b''
    while True:
        r += s.recv(65536)
        try:
            return json.loads(r)
        except ValueError:
            pass
assert cmd('new_canvas', {'width': 100, 'height': 100})['status'] == 'success'
images = cmd('list_images', {})['results']['images']
index = [i['index'] for i in images if i['width'] == 100][-1]
for kind in ('linear', 'radial'):
    r = cmd('gradient_fill', {'image_index': index, 'gradient_type': kind,
                              'color1': '#ff0000', 'color2': '#0000ff'})
    assert r['status'] == 'success', r
    corners = [cmd('get_pixel_color', {'image_index': index, 'x': x, 'y': y})
               ['results']['color_hex'] for x, y in ((0, 0), (99, 99))]
    print(kind, 'gradient corners:', corners)
    assert corners[0] != corners[1] and '#ffffff' not in corners, corners
")))))
      #:modules '((guix build copy-build-system)
                  (guix build utils)
                  (ice-9 ftw)
                  (ice-9 textual-ports))))
    (native-inputs
     (list dbus font-dejavu gimp python xorg-server-for-tests))
    (inputs
     ;; GIMP runs the plug-in by its #! line; patch-shebangs points that at
     ;; the same Python 3 that GIMP's own Python plug-ins use.
     (list python))
    (home-page "https://github.com/gimp-mcp/gimp-mcp")
    (synopsis "GIMP plug-in that lets the GIMP MCP server drive GIMP")
    (description
     "This package provides the MCP plug-in for GIMP 3.2, the half of GIMP
MCP that runs inside GIMP.  Started from @samp{Tools > MCP > Start MCP
Server}, it listens on localhost port 9877 and executes the requests that
@command{gimp-mcp-server} relays from an MCP client.

GIMP from this channel finds the plug-in when both are installed in the same
profile.

Code from the language model runs in GIMP without restriction, with the user's
permissions.")
    (license license:gpl3+)))
