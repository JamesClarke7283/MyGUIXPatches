;;; -*- mode: scheme; -*-
;;;
;;; Godot's current stable editor, built from source with Guix libraries.

(define-module (patches godot)
  #:use-module ((gnu packages game-development) #:prefix guix-)
  #:use-module (gnu packages gtk)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix packages)
  #:use-module (guix utils))

;; Match the text engine used by Godot upstream.  Guix's 11.x release does
;; not provide the harfbuzz-raster and harfbuzz-vector libraries used by 4.7.
(define godot-harfbuzz
  (package
    (inherit harfbuzz)
    (version "14.2.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://github.com/harfbuzz/harfbuzz/releases/"
                           "download/" version "/harfbuzz-" version ".tar.xz"))
       (sha256
        (base32 "1zzaq8dp5cv50njahxc17v9cljrkrzj785g9dav5n0kdz4h700cl"))))
    (arguments
     (substitute-keyword-arguments (package-arguments harfbuzz)
       ((#:configure-flags flags)
        #~(append #$flags (list "-Draster=enabled" "-Dvector=enabled")))))))

(define-public godot
  (package
    (inherit guix-godot)
    (version "4.7.2")
    (source
     (origin
       (inherit (package-source guix-godot))
       (method url-fetch)
       (uri (string-append
             "https://github.com/godotengine/godot/releases/download/"
             version "-stable/godot-" version "-stable.tar.xz"))
       (file-name (string-append "godot-" version "-stable.tar.xz"))
       (sha256
        (base32 "10alncgfwapk1ya1g5wpqavryklkr8r52kvcvnq41k1yxk6f1351"))
       ;; The glslang library fix carried by Guix is included in 4.7.2.
       (patches '())
       (snippet
        '(begin
           ;; Retain the libraries which Godot patches or which are not yet
           ;; replaced with Guix inputs.  4.7 adds gamepad motion handling and
           ;; SPIR-V cross compilation; doctest is needed by the unit tests.
           (with-directory-excursion "thirdparty"
             (let ((preserved-files
                    '("README.md"
                      "accesskit"
                      "amd-fsr"
                      "amd-fsr2"
                      "astcenc"
                      "basis_universal"
                      "certs"
                      "clipper2"
                      "cvtt"
                      "doctest"
                      "dr_libs"
                      "etcpak"
                      "fonts"
                      "gamepadmotionhelpers"
                      "glad"
                      "grisu2"
                      "jolt_physics"
                      "libktx"
                      "linuxbsd_headers"
                      "manifold"
                      "meshoptimizer"
                      "miniupnpc"
                      "minizip"
                      "misc"
                      "msdfgen"
                      "openxr"
                      "re-spirv"
                      "recastnavigation"
                      "rvo2"
                      "smaa"
                      "spirv-cross"
                      "spirv-reflect"
                      "thorvg"
                      "tinyexr"
                      "ufbx"
                      "vhacd"
                      "vulkan"
                      "xatlas")))
               (for-each delete-file-recursively
                         (lset-difference string=? (scandir ".")
                                          (cons* "." ".." preserved-files)))))))))
    (arguments
     (substitute-keyword-arguments (package-arguments guix-godot)
       ((#:scons-flags flags)
        #~(append #$flags (list "tests=yes")))
       ((#:tests? _ #f) #t)
       ((#:phases phases)
        #~(modify-phases #$phases
            (add-after 'unpack 'locate-desktop-icons
              (lambda _
                ;; 4.7 moved the artwork; the inherited install phase still
                ;; expects the old paths at the source root.
                (symlink "misc/logo/icon.png" "icon.png")
                (symlink "misc/logo/icon.svg" "icon.svg")))
            (replace 'check
              (lambda* (#:key tests? #:allow-other-keys)
                (when tests?
                  ;; The runner creates isolated settings and temporary data
                  ;; below HOME.  No display server is required.
                  (setenv "HOME" (getcwd))
                  (invoke (car (find-files "bin" "godot.*linuxbsd\\.editor.*"))
                          "--headless" "--test" "--no-colors"))))
            (add-after 'install 'fix-dialog-helper-path
              (lambda _
                ;; The inherited wrapper puts the executable itself in PATH.
                (substitute* (string-append #$output "/bin/godot")
                  (("/bin/zenity/bin") "/bin"))))))))
    (inputs
     (modify-inputs (package-inputs guix-godot)
       (replace "harfbuzz" godot-harfbuzz)))))
