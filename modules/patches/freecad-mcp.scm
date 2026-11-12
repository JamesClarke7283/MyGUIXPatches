;;; -*- mode: scheme; -*-
;;;
;;; FreeCAD Robust MCP Server and its FreeCAD workbench.
;;;
;;; https://github.com/spkane/freecad-addon-robust-mcp-server
;;;
;;; The two components have independent release versions.  The server below is
;;; the stable 0.7.0 Python release; the workbench is the compatible stable
;;; 0.7.2 release.  Together they provide the authenticated bridge introduced
;;; in 0.7.x.  The MCP client starts freecad-mcp over stdio, and it connects to
;;; the workbench over local XML-RPC (port 9875 by default).
;;;
;;; FreeCAD has no module-path environment variable.  The workbench package
;;; therefore includes FreeCAD-robust-mcp and FreeCADCmd-robust-mcp launchers,
;;; which supply --module-path.  The same option can be given to an existing
;;; FreeCAD command if its normal launcher must be used instead.

(define-module (patches freecad-mcp)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages check)
  #:use-module (gnu packages engineering)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages version-control)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix utils))

;;; MCP 2.3 requires HTTPX2 >= 2.10; Guix has 2.4.  The 2.16 releases used by
;;; Robust MCP's own lock file are built here from the HTTPX2 monorepo tag.
(define python-httpcore2-2.16
  (package
    (inherit python-httpcore2)
    (version "2.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pydantic/httpx2")
             (commit (string-append "v" version))))
       (file-name (git-file-name "python-httpcore2" version))
       (sha256
        (base32 "0wgshn0g3lra3wxxim64xs0s1wf7b50kvh64apfdlrgmhrhycvm0"))))))

(define python-httpx2-2.16
  (package
    (inherit python-httpx2-minimal)
    (name "python-httpx2")
    (version "2.16.0")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/pydantic/httpx2")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wgshn0g3lra3wxxim64xs0s1wf7b50kvh64apfdlrgmhrhycvm0"))))
    (propagated-inputs
     (modify-inputs (package-propagated-inputs python-httpx2-minimal)
       (replace "python-httpcore2" python-httpcore2-2.16)))))

(define python-mcp-types-2.3
  (package
    (name "python-mcp-types")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mcp_types" version))
       (sha256
        (base32 "0qn33xw88p9zm3fr5smpk9c7xpdds7kcw3wljjdf2pmkxm4nbr6i"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      ;; Upstream's test suite is part of the much larger python-sdk tree.
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'use-static-version
            (lambda _
              ;; The sdist has no Git metadata and Guix has no
              ;; uv-dynamic-versioning package.  The release version is known.
              (substitute* "pyproject.toml"
                (("dynamic = \\[\"version\"\\]")
                 (string-append "version = \"" #$version "\""))
                ((", \"uv-dynamic-versioning\"") "")))))))
    (native-inputs (list python-hatchling))
    (propagated-inputs (list python-pydantic python-typing-extensions))
    (home-page "https://modelcontextprotocol.io")
    (synopsis "Model Context Protocol wire types")
    (description "This package provides the MCP 2.3 protocol wire types.")
    (license license:expat)))

(define-public python-mcp-2.3
  (package
    (name "python-mcp")
    (version "2.3.0")
    (source
     (origin
       (method url-fetch)
       (uri (pypi-uri "mcp" version))
       (sha256
        (base32 "1n1l5gyyyc03p7kwviir1ymg11rnxnpf1166i3f5kw0w8i87l54b"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      ;; The full SDK test suite needs network services, example packages and
      ;; browser fixtures.  Robust MCP's unit suite exercises the SDK below.
      #:tests? #f
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'use-static-version-and-dependencies
            (lambda _
              (substitute* "pyproject.toml"
                ;; Replace the uv metadata hook with the exact runtime
                ;; dependencies it generates for this release.
                (("dynamic = \\[\"version\", \"dependencies\"\\]")
                 (string-append
                  "version = \"" #$version "\"\n"
                  "dependencies = [\n"
                  "  \"anyio>=4.9\",\n"
                  "  \"httpx2>=2.10.0\",\n"
                  "  \"mcp-types==2.3.0\",\n"
                  "  \"pydantic>=2.12.0\",\n"
                  "  \"starlette>=0.27\",\n"
                  "  \"python-multipart>=0.0.9\",\n"
                  "  \"sse-starlette>=3.0.0\",\n"
                  "  \"uvicorn>=0.31.1\",\n"
                  "  \"jsonschema>=4.20.0\",\n"
                  "  \"pyjwt[crypto]>=2.10.1\",\n"
                  "  \"typing-extensions>=4.13.0\",\n"
                  "  \"typing-inspection>=0.4.1\",\n"
                  "  \"opentelemetry-api>=1.28.0\",\n"
                  "]\n"))
                ((", \"uv-dynamic-versioning\"") "")
                ;; Do not leave the now-unavailable metadata hook behind;
                ;; dependencies above are already static.
                (("\\[tool.hatch.metadata.hooks.uv-dynamic-versioning\\]")
                 "[tool.hatch.metadata]")))))))
    (native-inputs (list python-hatchling))
    (propagated-inputs
     (list python-anyio
           python-cryptography              ;for pyjwt[crypto]
           python-httpx2-2.16
           python-jsonschema
           python-mcp-types-2.3
           python-opentelemetry-api
           python-pydantic
           python-pyjwt
           python-multipart
           python-sse-starlette
           python-starlette
           python-typing-extensions
           python-typing-inspection
           python-uvicorn))
    (home-page "https://modelcontextprotocol.io")
    (synopsis "Model Context Protocol SDK")
    (description "This package provides the MCP 2.3 Python SDK.")
    (license license:expat)))

(define-public freecad-robust-mcp
  (package
    (name "freecad-robust-mcp")
    (version "0.7.0")
    (source
     (origin
       ;; The sdist contains the generated 0.7.0 version file, so building it
       ;; does not require the Git metadata that hatch-vcs would otherwise need.
       (method url-fetch)
       (uri (pypi-uri "freecad_robust_mcp" version))
       (sha256
        (base32 "0m7bsb0rj8bdn5wr26kp91s9lnx14afrvr6klxsg4lf05dwxlggf"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:test-flags #~(list "tests/unit")
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'unpack 'use-available-pydantic
            (lambda _
              ;; MCP 2.3 itself needs only pydantic >= 2.12.  Robust MCP uses
              ;; Field, SecretStr and the settings APIs already provided by
              ;; Guix's pydantic 2.12.5 and pydantic-settings 2.12.0; the
              ;; unit suite checks those uses.  Avoid a second Rust build of
              ;; pydantic-core solely for the higher upstream floor.
              (substitute* "pyproject.toml"
                (("pydantic>=2\\.14\\.1") "pydantic>=2.12.0")
                (("pydantic-settings>=2\\.16\\.1")
                 "pydantic-settings>=2.12.0"))))
          (add-after 'use-available-pydantic 'prepare-test-environment
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((bash (search-input-file inputs "bin/bash")))
                (substitute* '("tests/unit/test_ci_setup_freecad.py"
                               "tests/unit/test_cam_inventory_action.py")
                  (("/bin/bash") bash)
                  (("#!/bin/sh") (string-append "#!" bash)))
              (substitute* "tests/ci-test/setup-freecad.sh"
                (("#!/bin/bash") (string-append "#!" bash))))
              ;; Python 3.12 raises OverflowError, rather than OSError, when
              ;; TextIOBase.seek gets an offset too large for C off_t.  Either
              ;; exception proves the capture cannot be enlarged by seeking.
              (substitute* "tests/unit/addon/test_addon_timeouts.py"
                (("with pytest\\.raises\\(OSError\\):")
                 "with pytest.raises((OSError, OverflowError)):")))))))
    (native-inputs
     (list bash-minimal
           git
           python-hatchling
           python-hatch-vcs
           python-psutil
           python-pytest
           python-pytest-asyncio
           python-pytest-timeout))
    (inputs
     (list python-mcp-2.3 python-pydantic python-pydantic-settings))
    (home-page "https://github.com/spkane/freecad-addon-robust-mcp-server")
    (synopsis "Robust Model Context Protocol server for FreeCAD")
    (description
     "@command{freecad-mcp} is Sean Kane's Robust MCP Server for FreeCAD.
It exposes more than 150 tools for documents, primitives, Part Design,
spreadsheets, Draft objects, CAM, macros, inspection, screenshots and STEP,
STL, OBJ and 3MF export.  It supports GUI, headless and embedded operation,
XML-RPC and JSON-RPC connections, and authenticated bridge pairing.

The matching @code{freecad-robust-mcp-workbench} package provides the bridge
that runs inside FreeCAD.  Run @command{freecad-mcp --pair-bridge} once, start
that workbench's bridge, and configure an MCP client to launch
@command{freecad-mcp} over standard input and output.  Tools that execute
Python do so with the FreeCAD user's permissions.")
    (license (list license:asl2.0 license:expat))))

(define-public freecad-robust-mcp-workbench
  (package
    (name "freecad-robust-mcp-workbench")
    (version "0.7.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/spkane/freecad-addon-robust-mcp-server")
             (commit (string-append "robust-mcp-workbench-v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1xamvllrlgnipfadhy9jd5qvsyng7s5dhv79cp90kd38ppljj4dx"))))
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("package.xml" "share/freecad/Mod/RobustMCPBridge/")
          ("freecad" "share/freecad/Mod/RobustMCPBridge/freecad")
          ("LICENSE-CODE" "share/freecad/Mod/RobustMCPBridge/")
          ("LICENSE-MIT" "share/freecad/Mod/RobustMCPBridge/")
          ("LICENSE-ICON" "share/freecad/Mod/RobustMCPBridge/")
          ("NOTICE" "share/freecad/Mod/RobustMCPBridge/"))
      #:phases
      #~(modify-phases %standard-phases
          (add-after 'install 'install-launchers
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((bin (string-append #$output "/bin"))
                    (modules (string-append #$output "/share/freecad/Mod")))
                (mkdir-p bin)
                (for-each
                 (lambda (name program)
                   (let ((launcher (string-append bin "/" name)))
                     (call-with-output-file launcher
                       (lambda (port)
                         (format port "#!~a~%exec ~a --module-path ~a \"$@\"~%"
                                 (search-input-file inputs "bin/bash")
                                 (search-input-file inputs
                                                    (string-append "bin/" program))
                                 modules)))
                     (chmod launcher #o555)))
                 '("FreeCAD-robust-mcp" "FreeCADCmd-robust-mcp")
                 '("FreeCAD" "FreeCADCmd"))))))))
    (inputs (list bash-minimal freecad))
    (home-page "https://github.com/spkane/freecad-addon-robust-mcp-server")
    (synopsis "Robust MCP Bridge workbench for FreeCAD")
    (description
     "This package provides the Robust MCP Bridge workbench that runs inside
FreeCAD 1.0.2 or newer.  It connects the running application to
@command{freecad-mcp} through local XML-RPC or JSON-RPC, with authenticated
pairing, GUI-thread dispatch and screenshot support.

Use @command{FreeCAD-robust-mcp} to start the GUI with the workbench on its
module path, or @command{FreeCADCmd-robust-mcp} for headless mode.  To use the
normal launcher instead, pass
@option{--module-path ~/.guix-profile/share/freecad/Mod}.  In FreeCAD select
@samp{Robust MCP Bridge} and click @samp{Start MCP Bridge}.  Python requests
from the MCP client execute with the FreeCAD user's permissions.")
    (license (list license:asl2.0 license:expat license:cc-by-sa4.0))))
