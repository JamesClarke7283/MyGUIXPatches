;;; -*- mode: scheme; -*-
;;;
;;; godot-loader --- run Godot games exported with the official Linux
;;; templates.
;;;
;;; The export is started unmodified through the store's glibc loader, with a
;;; preloaded library that lets the engine find its own file.  The "Godot
;;; export loader" section of README.md and the comments in
;;; aux-files/godot-loader/*.c explain why it is not patched instead.

(define-module (patches godot-loader)
  #:use-module (gnu packages bootstrap)
  #:use-module (gnu packages fontutils)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xdisorg)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system gnu)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define %godot-loader-source
  ;; The C sources live in this channel.  Look them up in %load-path, as
  ;; Guix does for its own aux-files: a literal local-file is resolved
  ;; against the current directory when the channel is used with a relative
  ;; "-L modules", so `guix build -L modules godot-loader' would fail.
  (let ((file (search-path %load-path
                           "patches/aux-files/godot-loader/godot-loader.c")))
    (unless file
      (error "godot-loader: sources not found in %load-path"))
    (local-file (dirname (canonicalize-path file)) "godot-loader-source"
                #:recursive? #t)))

(define-public godot-loader
  (package
    (name "godot-loader")
    (version "1.0")
    (source %godot-loader-source)
    (build-system gnu-build-system)
    (arguments
     (list
      #:tests? #f                       ;no test suite
      #:modules '((guix build gnu-build-system)
                  (guix build utils)
                  (srfi srfi-1))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'configure)
          (replace 'build
            (lambda* (#:key inputs #:allow-other-keys)
              (define (directory-of soname)
                (dirname (search-input-file inputs
                                            (string-append "lib/" soname))))

              (define library-path
                ;; glibc, then every library the engine dlopen()s by
                ;; soname, then libstdc++ for GDExtension libraries.
                (string-join
                 (delete-duplicates
                  (map directory-of
                       '("libc.so.6"
                         "libX11.so.6" "libXcursor.so.1" "libXext.so.6"
                         "libXi.so.6" "libXinerama.so.1" "libXrandr.so.2"
                         "libXrender.so.1" "libxkbcommon.so.0"
                         "libwayland-client.so.0" "libdecor-0.so.0"
                         "libGL.so.1" "libvulkan.so.1"
                         "libasound.so.2" "libpulse.so.0"
                         "libdbus-1.so.3" "libfontconfig.so.1"
                         "libudev.so.1" "libspeechd.so.2"
                         "libstdc++.so.6")))
                 ":"))

              (with-output-to-file "config.h"
                (lambda ()
                  (format #t "#define GODOT_LOADER_VERSION ~s~%"
                          #$(package-version this-package))
                  (format #t "#define GODOT_LOADER ~s~%"
                          (string-append #$output "/bin/godot-loader"))
                  (format #t "#define GODOT_LOADER_PRELOAD ~s~%"
                          (string-append #$output
                                         "/lib/godot-loader/preload.so"))
                  (format #t "#define GODOT_LOADER_ICONS ~s~%"
                          (string-append #$output "/lib/godot-loader/icons"))
                  (format #t "#define GODOT_LOADER_INTERPRETER ~s~%"
                          (search-input-file inputs
                                             #$(glibc-dynamic-linker)))
                  (format #t "#define GODOT_LOADER_LIBRARY_PATH ~s~%"
                          library-path)))

              (invoke "gcc" "-O2" "-Wall" "-Wextra"
                      "-o" "godot-loader" "godot-loader.c")
              (invoke "gcc" "-O2" "-Wall" "-Wextra" "-shared" "-fPIC"
                      "-o" "preload.so" "preload.c")))
          (replace 'install
            (lambda* (#:key inputs #:allow-other-keys)
              (let ((lib (string-append #$output "/lib/godot-loader")))
                (install-file "godot-loader" (string-append #$output "/bin"))
                (install-file "preload.so" lib)
                ;; The "default" cursor theme offered to games: see
                ;; provide_default_cursor_theme in godot-loader.c.
                (mkdir-p (string-append lib "/icons"))
                (symlink (search-input-directory inputs
                                                 "share/icons/Adwaita")
                         (string-append lib "/icons/default"))))))))
    (inputs
     (list adwaita-icon-theme
           alsa-lib
           dbus
           eudev
           fontconfig
           (list gcc "lib")
           libdecor
           libx11
           libxcursor
           libxext
           libxi
           libxinerama
           libxkbcommon
           libxrandr
           libxrender
           mesa
           pulseaudio
           speech-dispatcher
           vulkan-loader
           wayland))
    ;; The official templates are also built for other architectures, but
    ;; only x86-64 has been tested.
    (supported-systems '("x86_64-linux"))
    (home-page "https://godotengine.org/")
    (synopsis "Run Godot games exported with the official Linux templates")
    (description
     "@command{godot-loader} runs a game exported from the Godot engine with
the official Linux export templates, such as @file{Game.x86_64}, on Guix
System: @samp{godot-loader Game.x86_64 [@var{argument}@dots{}]}.  Those
executables expect the FHS loader @file{/lib64/ld-linux-x86-64.so.2} and open
their display, graphics, audio and input libraries by name at run time.
@command{godot-loader} starts the unmodified executable through the store's
glibc loader with those libraries, and preloads a small library so that the
engine still finds its own file, which it needs to load the game's data.")
    (license license:gpl3+)))
