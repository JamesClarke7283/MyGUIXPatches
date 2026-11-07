;;; -*- mode: scheme; -*-
;;;
;;; blender --- Blender extensions, and the programs that work with them.
;;;
;;; Blender MCP
;;; -----------
;;; Blender Lab's MCP (Model Context Protocol) server lets an LLM client
;;; inspect and drive a running Blender:
;;;
;;;   https://www.blender.org/lab/mcp-server/
;;;   https://projects.blender.org/lab/blender_mcp
;;;
;;; It has two halves, which talk over a TCP socket (localhost:9876 by
;;; default):
;;;
;;;   MCP client  <- MCP over stdio ->  blender-mcp  <- TCP ->  Blender add-on
;;;
;;; Both are built here from the same tagged source tree:
;;;
;;;   blender-mcp            mcp/, a setuptools project that installs
;;;                          bin/blender-mcp.  The MCP client starts it.
;;;   blender-mcp-extension  addon/blender_mcp_addon/, the "MCP" extension,
;;;                          which runs inside Blender and executes requests.
;;;
;;; Upstream also ships the add-on as mcp-<version>.zip through its extension
;;; repository at https://lab.blender.org/.  That zip holds exactly the files
;;; of addon/blender_mcp_addon/ (checked against 1.0.3), so installing the
;;; directory is the same as installing the zip.
;;;
;;; How Blender finds the extension
;;; -------------------------------
;;; Blender 4.2 and later read extensions from repositories.  One of the
;;; default repositories is "System", a read-only directory meant for
;;; extensions installed alongside Blender.  Blender uses
;;; $BLENDER_SYSTEM_EXTENSIONS/system when that variable names a directory,
;;; and otherwise falls back to share/blender/<version>/extensions/system
;;; inside its own installation.
;;;
;;; blender-mcp-extension installs the add-on to
;;; share/blender/extensions/system/mcp (the directory name has to match the
;;; manifest's `id') and declares BLENDER_SYSTEM_EXTENSIONS as a search path,
;;; so a profile holding it sets
;;;
;;;   BLENDER_SYSTEM_EXTENSIONS=$GUIX_PROFILE/share/blender/extensions
;;;
;;; and every extension installed into that profile appears under "System" in
;;; Preferences > Add-ons.  Blender then imports this one as
;;; bl_ext.system.mcp.  It still has to be enabled once there, like any
;;; extension.
;;;
;;; Blender version
;;; ---------------
;;; The add-on's manifest requires Blender 5.1.0 or newer, and that is a real
;;; requirement: its guard against harmful operators wraps
;;; bpy.ops._op_create_function, which older releases do not have.  This
;;; module supplies Blender 5.2 LTS alongside the extension; the upstream
;;; Guix package is still 4.5.x.  The MCP server also provides documentation
;;; tools that do not need Blender.

(define-module (patches blender)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages build-tools)
  #:use-module (gnu packages check)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages freedesktop)
  #:use-module ((gnu packages graphics) #:prefix guix-)
  #:use-module (gnu packages image)
  #:use-module (gnu packages image-processing)
  #:use-module (gnu packages maths)
  #:use-module (gnu packages pretty-print)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-build)
  #:use-module (gnu packages python-compression)
  #:use-module (gnu packages python-crypto)
  #:use-module (gnu packages python-web)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system pyproject)
  #:use-module (guix build-system python)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix profiles)
  #:use-module (guix utils))

;; Blender 5.2 embeds Python 3.13.  Keep its NumPy and the Python build/test
;; dependencies on that interpreter without changing the channel's MCP server
;; or Guix's default Python.  Both Python build systems need the unversioned
;; `python' executable supplied by this wrapper.
(define python313-wrapper
  (package
    (inherit python-wrapper)
    (name "python313-wrapper")
    (version (package-version python-3.13))
    (propagated-inputs `(("python" ,python-3.13)))
    (native-search-paths (package-native-search-paths python-3.13))))

(define (python-package? package)
  (memq (package-build-system package)
        (list python-build-system pyproject-build-system)))

(define python313-setuptools-bootstrap
  (package/inherit python-setuptools-bootstrap
    (name "python313-setuptools-bootstrap")
    (inputs (list python313-wrapper))))

(define python313-meson
  (package/inherit meson
    (name "python313-meson")
    (native-inputs (list python313-setuptools-bootstrap))
    (inputs (list python313-wrapper ninja))))

(define python313-maturin
  (package
    (inherit maturin)
    (name "python313-maturin")
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          ;; The Rust executable is interpreter-independent.  Only its pure
          ;; Python build-backend shim needs to be on the 3.13 module path.
          (copy-recursively
           (string-append #$maturin "/lib/python"
                          #$(version-major+minor (package-version python))
                          "/site-packages")
           (string-append #$output "/lib/python3.13/site-packages"))
          (symlink (string-append #$maturin "/bin")
                   (string-append #$output "/bin")))))
    (native-inputs '())
    (inputs (list maturin))
    ;; Python 3.13 provides tomllib, which this shim uses instead of tomli.
    (propagated-inputs '())))

(define with-python313
  (package-mapping
   (lambda (package)
     (cond
      ;; Cython also lists the interpreter as an explicit input for libpython.
      ;; Keeping a 3.12 input there would override the 3.13 module search path.
      ((memq package (list python python-minimal python-sans-pip))
       python-3.13)
      ((memq package (list python-wrapper python-minimal-wrapper
                           python-sans-pip-wrapper))
       python313-wrapper)
      ;; This bootstrap deliberately uses gnu-build-system, so it needs an
      ;; explicit interpreter replacement as well.
      ((eq? package python-setuptools-bootstrap)
       python313-setuptools-bootstrap)
      ((eq? package meson) python313-meson)
      ((eq? package maturin) python313-maturin)
      ((python-package? package)
       (package/inherit package
         (name (string-append "python313-" (package-name package)))
         (arguments
          (substitute-keyword-arguments (package-arguments package)
            ((#:python _ #f) python313-wrapper)))))
      (else package)))
   (lambda (package) (not (python-package? package)))))

(define python313-numpy (with-python313 python-numpy))

;; Use the Ceres revision pinned by Blender's own dependency manifest.  The
;; version in Guix predates the Manifold API used by Blender 5.2's libmv.
(define blender-ceres
  (let ((commit "0c70ed3a1a2d6ba47c06c7e8b3b040880bc474db"))
    (package
      (inherit ceres)
      (version (git-version "2.3.0" "0" commit))
      (source
       (origin
         (method url-fetch)
         (uri (string-append "https://github.com/ceres-solver/ceres-solver/archive/"
                             commit ".tar.gz"))
         (file-name (string-append "ceres-solver-" version ".tar.gz"))
         (sha256
          (base32 "1kb6wbm1k3xsx7d4yi57crlcr9qda593wsckv2fyb178z9wcq2xz"))))
      (arguments
       (list #:configure-flags
             #~(list "-DBUILD_EXAMPLES=OFF"
                     "-DBUILD_SHARED_LIBS=ON"
                     "-DUSE_CUDA=OFF")
             #:phases
             #~(modify-phases %standard-phases
                 (add-after 'unpack 'locate-test-data
                   (lambda _
                     ;; Ceres looks two levels above build/bin for data/,
                     ;; assuming that the build directory is inside its source.
                     ;; Guix builds alongside the source directory instead.
                     (symlink (string-append (getcwd) "/data") "../data"))))))
      (native-inputs
       (modify-inputs (package-native-inputs ceres)
         (prepend googletest)))
      (propagated-inputs (list eigen abseil-cpp)))))

;; Blender's bundled color configuration uses the 2.5 profile format.
(define blender-opencolorio
  (package
    (inherit opencolorio)
    (version "2.5.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AcademySoftwareFoundation/OpenColorIO/"
             "archive/v" version ".tar.gz"))
       (file-name (string-append "opencolorio-" version ".tar.gz"))
       (sha256
        (base32 "1djmmzhxvfkbdblj7bi3r7inygwdyzxlzdnvdnfrawchibx2nkhj"))))
    (arguments
     (substitute-keyword-arguments (package-arguments opencolorio)
       ((#:configure-flags flags)
        #~(cons "-DOCIO_BUILD_PYTHON=OFF" #$flags))))))

(define blender-openimageio
  (package
    (inherit guix-openimageio)
    (version "3.1.13.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/AcademySoftwareFoundation/OpenImageIO/"
             "archive/refs/tags/v" version ".tar.gz"))
       (file-name (string-append "openimageio-" version ".tar.gz"))
       (sha256
        (base32 "1dw5pdp8f3mc0n7iaf6yzjdx8zh33wrz7f4k6wnx1ph84y79pi8g"))))
    (arguments
     (list
      ;; Like Guix's variant, these tests require external image datasets.
      #:tests? #f
      #:configure-flags
      #~(list "-DUSE_EXTERNAL_PUGIXML=ON"
              "-DOIIO_BUILD_TESTS=OFF"
              "-DUSE_PYTHON=OFF"
              ;; OpenJPEG's config exports major/minor/build separately.
              (string-append "-DOpenJPEG_VERSION="
                             #$(package-version openjpeg)))))
    ;; Blender only uses the C++ library; avoid the Python 3.12 bindings.
    (inputs
     (modify-inputs (package-inputs guix-openimageio)
       (delete "python" "python-wrapper" "pybind11")
       (replace "opencolorio" blender-opencolorio)))
    (license license:asl2.0)))

(define blender-core
  (package
    (inherit guix-blender)
    (version "5.2.3")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.blender.org/source/blender-"
                           version ".tar.xz"))
       (sha256
        (base32 "0xiq53hd0igbgss154dav9bf8fad9kl2gz7cvs2dc9ns42my0rjw"))))
    (arguments
     (substitute-keyword-arguments (package-arguments guix-blender)
       ((#:configure-flags flags)
        #~(append
           ;; The inherited flags embed Guix's Python 3.12 and NumPy paths.
           (filter (lambda (flag)
                     (not (string-prefix? "-DPYTHON_" flag)))
                   #$flags)
           (list "-DWITH_LIBS_PRECOMPILED=OFF"
                 "-DWITH_GHOST_WAYLAND=ON"
                 "-DWITH_GHOST_WAYLAND_DYNLOAD=OFF"
                 "-DWITH_GHOST_CSD=ON"
                 "-DPYTHON_VERSION=3.13"
                 "-DPYTHON_LIBRARY=python3.13"
                 (string-append "-DPYTHON_LIBPATH=" #$python-3.13 "/lib")
                 (string-append "-DPYTHON_INCLUDE_DIR=" #$python-3.13
                                "/include/python3.13")
                 (string-append "-DPYTHON_NUMPY_INCLUDE_DIRS=" #$python313-numpy
                                "/lib/python3.13/site-packages/numpy/_core/include")
                 (string-append "-DPYTHON_NUMPY_PATH=" #$python313-numpy
                                "/lib/python3.13/site-packages/"))))
       ((#:phases _)
        #~(modify-phases %standard-phases
            (add-after 'unpack 'use-eigen-3.4-api
              (lambda _
                ;; Keep the same Eigen ABI as Ceres.  Eigen 3.4 takes SVD
                ;; computation flags as an argument, not a template argument.
                (substitute* '("intern/libmv/libmv/multiview/euclidean_resection.cc"
                               "intern/libmv/libmv/tracking/track_region.cc"
                               "intern/dualcon/intern/octree.cpp")
                  (("\\.jacobiSvd<([^>]+)>\\(\\)" _ options)
                   (string-append ".jacobiSvd(" options ")")))
                (substitute* "intern/dualcon/intern/octree.cpp"
                  (("JacobiSVD<Eigen::Matrix3f, Options>")
                   "JacobiSVD<Eigen::Matrix3f>"))))
            (add-after 'unpack 'fix-color-space-interop-id
              (lambda _
                ;; OCIO 2.5 rejects non-standard IDs without a namespace.
                ;; This is already an alias for the same space in the config;
                ;; only its metadata changes, not the color transforms.
                (substitute* "release/datafiles/colormanagement/config.ocio"
                  (("interop_id: g24_rec709_scene")
                   "interop_id: ocio:g24_rec709_scene"))))
            (add-after 'install 'link-python-binary
              (lambda _
                (let ((directory (string-append #$output "/share/blender/5.2")))
                  (mkdir-p directory)
                  (symlink #$python-3.13 (string-append directory "/python")))))
            (add-after 'install 'wrap-bin
              (lambda _
                (wrap-program (string-append #$output "/bin/blender")
                  `("GUIX_PYTHONPATH" ":" prefix
                    (,(string-append #$python313-numpy
                                     "/lib/python3.13/site-packages"))))))))))
    (native-inputs
     (modify-inputs (package-native-inputs guix-blender)
       (prepend wayland-protocols)))
    (inputs
     (modify-inputs (package-inputs guix-blender)
       ;; 5.2's release tarball includes its finished assets under assets/.
       ;; CMake installs those directly; the old separate asset tree is unused.
       (delete "blender-assets")
       (replace "python" python-3.13)
       (replace "python-numpy" python313-numpy)
       (replace "ffmpeg" ffmpeg)
       (replace "opencolorio" blender-opencolorio)
       (replace "openimageio" blender-openimageio)
       ;; Ceres' exported CMake targets resolve SuiteSparse and BLAS here.
       (prepend blender-ceres openblas suitesparse
                fmt-12 libxfixes libxkbcommon wayland)))))

;; These modules are used by Blender's built-in extension manager and remote
;; asset libraries.  Keep them in a separate runtime profile so changing a
;; Python dependency does not require recompiling Blender's C++ sources.
(define blender-python-runtime
  (profile
    (name "blender-python-runtime")
    (content
     (packages->manifest
      (map with-python313
           (list python-cattrs-minimal python-requests python-zstandard))))
    (hooks '())))

(define-public blender
  (package
    (inherit blender-core)
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build union) (guix build utils) (ice-9 ftw))
      #:builder
      #~(begin
          (use-modules (guix build union) (guix build utils) (ice-9 ftw))
          (mkdir-p #$output)
          (for-each
           (lambda (name)
             (unless (member name '("." ".." "bin"))
               (symlink (string-append #$blender-core "/" name)
                        (string-append #$output "/" name))))
           (scandir #$blender-core))
          (union-build (string-append #$output "/bin")
                       (list (string-append #$blender-core "/bin"))
                       #:create-all-directories? #t)
          ;; Copy the existing launcher before extending it: the other files
          ;; remain read-only links into the source-built package.
          (let ((launcher (string-append #$output "/bin/blender")))
            (delete-file launcher)
            (copy-file (string-append #$blender-core "/bin/blender") launcher)
            (chmod launcher #o755)
            (wrap-program launcher
              `("GUIX_PYTHONPATH" ":" prefix
                (,(string-append #$blender-python-runtime
                                 "/lib/python3.13/site-packages")))))
          ;; Blender reports a core add-on import failure without failing its
          ;; process.  Check registration explicitly to catch missing modules.
          (setenv "HOME" (getcwd))
          (invoke (string-append #$output "/bin/blender")
                  "--background" "--factory-startup"
                  "--python-exit-code" "1" "--python-expr"
                  (string-append
                   "import addon_utils, numpy, requests, cattrs.preconf.json, "
                   "zstandard; assert addon_utils.check('bl_pkg')[1]")))))
    (native-inputs '())
    (inputs (list blender-core))))

(define-public blender-mcp
  (package
    (name "blender-mcp")
    (version "1.0.3")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://projects.blender.org/lab/blender_mcp.git")
             (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0p6fkaibg8miwjc7y6p1gdf5dw6nbmjq82bvrar9g2qfxv4831x5"))))
    (build-system pyproject-build-system)
    (arguments
     (list
      #:phases
      #~(modify-phases %standard-phases
          ;; The Python project is mcp/, not the root of the repository.
          (add-after 'unpack 'enter-project-directory
            (lambda _
              (chdir "mcp")))
          ;; FastMCP sends each tool function's __doc__ as its description.
          ;; Python 3.13 strips the indentation from docstrings when it
          ;; compiles them, and upstream's frozen listing was taken with
          ;; 3.13; Guix's Python is 3.12, which keeps it.  Names, schemas and
          ;; wording are otherwise identical, so compare the descriptions
          ;; after inspect.cleandoc rather than skip the test.
          (add-before 'enter-project-directory 'patch-tool-listing-test
            (lambda _
              (substitute* "tests/test_tool_listing.py"
                (("^class TestToolListing\\(unittest\\.TestCase\\):" all)
                 (string-append
                  "def _dedented(tools):\n"
                  "    import inspect\n"
                  "    return [dict(t, description=inspect.cleandoc("
                  "t[\"description\"] or \"\"))\n"
                  "            for t in tools]\n\n\n"
                  all))
                (("self\\.assertEqual\\(self\\._tools, EXPECTED_TOOLS\\)")
                 (string-append "self.assertEqual(_dedented(self._tools), "
                                "_dedented(EXPECTED_TOOLS))")))))
          ;; The tests are unittest scripts at the root of the repository,
          ;; run one by one as upstream's `make test' does.  The fifth one,
          ;; tests/test_blender_mcp_with_blender.py, starts Blender 5.1+ with
          ;; the add-on and is left out.  The others need no Blender: they
          ;; start the server over stdio, compare its tool listing with a
          ;; frozen copy and parse every bundled reference page.
          (replace 'check
            (lambda* (#:key tests? #:allow-other-keys)
              (when tests?
                (with-directory-excursion ".."
                  (for-each (lambda (test)
                              (invoke "python" test))
                            '("tests/test_tool_listing.py"
                              "tests/test_rst_parse.py"
                              "tests/test_rst_search.py"
                              "tests/test_mcp_server.py"))))))
          ;; The search and documentation tools read the bundled reference
          ;; from <site-packages>/blmcp/data at run time, and nothing above
          ;; exercises the installed copy, so check that it arrived.
          (add-after 'check 'check-installed-data
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((data (string-append (site-packages inputs outputs)
                                         "/blmcp/data")))
                (for-each (lambda (file)
                            (unless (file-exists? (string-append data "/" file))
                              (error "not installed:" file)))
                          '("prompts.yml"
                            "api/bpy.types.Object.rst"
                            "manual/index.rst"))))))))
    (native-inputs
     (list python-setuptools))
    ;; The Python libraries are inputs rather than propagated inputs:
    ;; bin/blender-mcp is wrapped with all of them on GUIX_PYTHONPATH, so
    ;; they do not need to be in the user's profile.
    ;;
    ;; Upstream requires mcp[cli].  Guix's python-mcp propagates only httpx,
    ;; httpx-sse, pydantic and sse-starlette, so the rest of what mcp declares,
    ;; and the `cli' extra (typer, python-dotenv), are listed here.  The
    ;; sanity-check phase resolves the whole requirement tree and fails if one
    ;; is missing.  FastMCP imports pydantic-settings, starlette and jsonschema
    ;; when the server starts.
    (inputs
     (list python-anyio
           python-cryptography              ;for pyjwt[crypto]
           python-docutils                  ;RST parsing at run time
           python-dotenv
           python-jsonschema
           python-mcp
           python-multipart
           python-pydantic-settings
           python-pyjwt
           python-pyyaml
           python-starlette
           python-typer
           python-typing-extensions
           python-typing-inspection
           python-uvicorn))
    (home-page "https://www.blender.org/lab/mcp-server/")
    (synopsis "Model Context Protocol server for Blender")
    (description
     "@command{blender-mcp} is Blender Lab's MCP (Model Context Protocol)
server.  An MCP client, such as an LLM chat program or coding agent, starts
it and talks to it over standard input and output, or over HTTP with
@option{--transport http}.  It gives the language model tools for inspecting
a running Blender: summaries of the scene, objects and linked libraries,
screenshots, viewport renders, and execution of arbitrary Python code.  It
also bundles the Blender Python API reference and user manual, with tools to
search them.

The server reaches Blender through the add-on in
@code{blender-mcp-extension}, which must be enabled in the running Blender
5.1 or later.  Tools that work on a @file{.blend} file without a running
Blender start @command{blender --background}, found through
@env{BLENDER_PATH} or else @env{PATH}.

Code from the language model runs in Blender without restriction, with the
user's permissions.")
    (license license:gpl3+)))

(define-public blender-mcp-extension
  (package
    (name "blender-mcp-extension")
    (version (package-version blender-mcp))
    (source (package-source blender-mcp))
    (build-system copy-build-system)
    (arguments
     (list
      ;; Blender requires the directory to be named after the manifest's id,
      ;; which is "mcp".
      #:install-plan
      #~'(("addon/blender_mcp_addon/"
           "share/blender/extensions/system/mcp"))))
    ;; Blender itself does not declare this search path, so the extension
    ;; does: a profile holding it points Blender's "System" repository at the
    ;; profile's share/blender/extensions/system.
    (native-search-paths
     (list (search-path-specification
            (variable "BLENDER_SYSTEM_EXTENSIONS")
            (separator #f)
            (files '("share/blender/extensions")))))
    (home-page "https://www.blender.org/lab/mcp-server/")
    (synopsis "Blender extension that lets the Blender MCP server drive Blender")
    (description
     "This package provides the MCP add-on for Blender 5.1 or later, the
half of Blender Lab's MCP server that runs inside Blender.  It listens on a
local TCP socket, port 9876 by default, and executes the requests that
@command{blender-mcp} relays from an MCP client.

The add-on appears in the System repository in Blender's preferences and must
be enabled there.  Its server starts automatically once Allow Online Access
is turned on in Preferences > System > Network.  In background mode, start it
with @command{blender --background --online-mode --command blender_mcp}.

Code from the language model runs in Blender without restriction, with the
user's permissions.")
    (license license:gpl3+)))
