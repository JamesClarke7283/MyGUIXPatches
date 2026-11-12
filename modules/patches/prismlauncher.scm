;;; -*- mode: scheme; -*-
;;;
;;; Prism Launcher, built from the official source release.
;;;

(define-module (patches prismlauncher)
  #:use-module (gnu packages aidc)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages gl)
  #:use-module (gnu packages java)
  #:use-module (gnu packages kde-frameworks)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages man)
  #:use-module (gnu packages markup)
  #:use-module (gnu packages pciutils)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages vulkan)
  #:use-module (gnu packages xorg)
  #:use-module (guix build-system qt)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public prismlauncher
  (package
    (name "prismlauncher")
    (version "11.1.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/PrismLauncher/PrismLauncher/releases/download/"
             version "/PrismLauncher-" version ".tar.gz"))
       (file-name (string-append name "-" version ".tar.gz"))
       (sha256
        (base32 "1d9y6rzwqr631r0x2d4r8dpz18sr19lm70gkq2fsbljcf69kz9cy"))))
    (build-system qt-build-system)
    (arguments
     (list
      #:qtbase qtbase
      #:generator "Ninja"
      #:configure-flags
      #~(list "-DLauncher_BUILD_PLATFORM=Guix"
              ;; Empty means that upstream's self-updater is not built.
              "-DLauncher_BUILD_ARTIFACT=")
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'check 'prepare-tests
            (lambda _
              (let ((runtime-dir (string-append (getcwd) "/runtime")))
                (mkdir-p runtime-dir)
                (chmod runtime-dir #o700)
                (setenv "XDG_RUNTIME_DIR" runtime-dir)
                (setenv "HOME" (getcwd))
                (setenv "QT_QPA_PLATFORM" "offscreen"))))
          (add-after 'qt-wrap 'wrap-runtime
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let ((out (assoc-ref outputs "out"))
                    (library-inputs
                     '("gamemode" "glfw" "openal" "libusb" "eudev"
                       "vulkan-loader" "flite"))
                    (program-inputs '("mesa-utils" "pciutils" "xrandr")))
                ;; These libraries are loaded dynamically by Prism or by
                ;; Minecraft's native libraries.  The utilities provide
                ;; hardware information and compatibility with older LWJGL.
                (wrap-program (string-append out "/bin/prismlauncher")
                  `("LD_LIBRARY_PATH" ":" prefix
                    ,(map (lambda (input)
                            (string-append (assoc-ref inputs input) "/lib"))
                          library-inputs))
                  `("PATH" ":" prefix
                    ,(map (lambda (input)
                            (string-append (assoc-ref inputs input) "/bin"))
                          program-inputs)))))))))
    (native-inputs
     `(("extra-cmake-modules" ,extra-cmake-modules)
       ("openjdk:jdk" ,openjdk17 "jdk")
       ("pkg-config" ,pkg-config)
       ("scdoc" ,scdoc)))
    (inputs
     (list bash-minimal
           cmark
           eudev
           flite
           gamemode
           glfw
           libarchive
           libusb
           mesa-utils
           openal
           pciutils
           qrencode
           qtbase
           qtimageformats
           qtnetworkauth
           qtsvg
           qtwayland
           tomlplusplus
           vulkan-loader
           xrandr
           zlib))
    (home-page "https://prismlauncher.org/")
    (synopsis "Free, open-source launcher for Minecraft")
    (description
     "Prism Launcher manages multiple independent Minecraft installations,
including their mods, texture packs, saved worlds, Java settings and game
versions.  It supports vanilla Minecraft, mod loaders, and Modrinth, CurseForge,
ATLauncher and Technic modpacks.  This package builds the official Qt 6 source
release and includes its Java launcher components, tests, desktop integration
and manpage.  Minecraft itself and its proprietary assets are not included.")
    (license license:gpl3)))
