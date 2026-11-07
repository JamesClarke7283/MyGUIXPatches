;;; -*- mode: scheme; -*-
;;;
;;; AppImageLauncher: desktop integration for AppImages, built from source.
;;;
;;; AppImageLauncher 3.0 is a CMake project whose dependencies are normally
;;; fetched from Git at configure time: AppImageUpdate, zsync2, libappimage,
;;; cpr, args and xdg-utils-cxx.  Guix builds without network access, so the
;;; sources are unpacked here and handed to CMake through FetchContent's
;;; FETCHCONTENT_SOURCE_DIR_<NAME> overrides.  xdg-utils-cxx is a normal
;;; package because libappimage looks it up with find_package().
;;;
;;; libappimage would otherwise build squashfuse and xdg-utils-cxx with
;;; ExternalProject_Add (again downloading at build time).  USE_SYSTEM_* is
;;; set to use the squashfuse and xdg-utils-cxx packages instead.

(define-module (patches appimagelauncher)
  #:use-module (guix build-system cmake)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build qt-utils)
  #:use-module (guix build utils)
  #:use-module (gnu packages backup)
  #:use-module (gnu packages base)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages boost)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages cpp)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages file-systems)
  #:use-module (gnu packages freedesktop)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gnupg)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages tls)
  #:use-module (gnu packages vim)
  #:use-module (gnu packages xorg))

(define %appimagelauncher-version "3.0.0-beta-3")

;; The v3.0.0-beta-3 tag.  Upstream's versioning.cmake still says beta-2,
;; but the tag and the release artifacts are beta-3.
(define %appimagelauncher-commit
  "96cb93781382908536c517585bc1825ce6925be0")

(define %appimagelauncher-source
  (origin
    (method url-fetch)
    (uri (string-append
          "https://github.com/TheAssassin/AppImageLauncher/archive/refs/tags/"
          "v" %appimagelauncher-version ".tar.gz"))
    (file-name (string-append "appimagelauncher-" %appimagelauncher-version
                              ".tar.gz"))
    (sha256
     (base32 "1d1hsslgzx5ifiyihagd6l0dp3bcazqc87g8yyn1f83vlp0kk2i8"))))

(define %appimageupdate-source
  (origin
    (method url-fetch)
    (uri (string-append
          "https://github.com/AppImageCommunity/AppImageUpdate/archive/refs/tags/"
          "2.0.0-alpha-1-20251018.tar.gz"))
    (file-name "appimageupdate-2.0.0-alpha-1-20251018.tar.gz")
    (sha256
     (base32 "1xf9d0j1bq26nbvzxvb8l6q06xcmykj732km1s1i8c1qs901ny6h"))))

(define %zsync2-source
  (origin
    (method url-fetch)
    (uri (string-append
          "https://github.com/AppImageCommunity/zsync2/archive/refs/tags/"
          "2.0.0-alpha-1-20250926.tar.gz"))
    (file-name "zsync2-2.0.0-alpha-1-20250926.tar.gz")
    (sha256
     (base32 "0k15z2rgj12429hdzisiv8rjchbhd1bxwp5piq7f26ifh77aj93s"))))

(define %libappimage-source
  (origin
    (method url-fetch)
    (uri (string-append
          "https://github.com/AppImageCommunity/libappimage/archive/"
          "d326d15c8a9299d3f135be8282f6545b32805996.tar.gz"))
    (file-name "libappimage-d326d15.tar.gz")
    (sha256
     (base32 "04vs74vmz51z2pdy6j7zszhcimp6b5qy9ajz2brl7pnh5ccrds0c"))))

(define %cpr-source
  (origin
    (method url-fetch)
    (uri "https://github.com/libcpr/cpr/archive/refs/tags/1.8.3.tar.gz")
    (file-name "cpr-1.8.3.tar.gz")
    (sha256
     (base32 "1qnqbyzx1886kpcdq8yfg1jwa934jxc7h2w214q0sfmrvg1d9107"))))

(define %args-source
  (origin
    (method url-fetch)
    (uri "https://github.com/Taywee/args/archive/refs/tags/6.4.7.tar.gz")
    (file-name "args-6.4.7.tar.gz")
    (sha256
     (base32 "0m04di3y33znv536zl27svljav2dnns94scv0zzl9kwyc0hd2lxf"))))

(define %xdg-utils-cxx-source
  (origin
    (method url-fetch)
    (uri (string-append
          "https://github.com/AppImageCommunity/xdg-utils-cxx/archive/"
          "d7da7ed523fafa5ddd8ec6e2208714de99c7c233.tar.gz"))
    (file-name "xdg-utils-cxx-d7da7ed.tar.gz")
    (sha256
     (base32 "19fz8h6nmyzzcqba1rpwircvmkaw3sa2krziv7bb3kji0q8qlnz5"))))

;; Guix hands url-fetch origins to the builder as the compressed archive.
;; FetchContent wants an unpacked source directory, so unpack it once here.
(define (unpacked-source name origin)
  (computed-file
   (string-append name "-source")
   #~(begin
       ;; tar needs the compressor on PATH; computed-file does not inherit
       ;; the package's native inputs.
       (setenv "PATH"
               (string-append #$(file-append gzip "/bin") ":"
                              (or (getenv "PATH") "")))
       (mkdir #$output)
       (unless (zero? (system* #$(file-append tar "/bin/tar")
                               "--extract"
                               "--file" #$origin
                               "--directory" #$output
                               "--strip-components=1"))
         (error "failed to unpack source archive")))))

(define %appimageupdate-source-directory
  (unpacked-source "appimageupdate" %appimageupdate-source))
(define %zsync2-source-directory
  (unpacked-source "zsync2" %zsync2-source))
(define %libappimage-source-directory
  (unpacked-source "libappimage" %libappimage-source))
(define %cpr-source-directory
  (unpacked-source "cpr" %cpr-source))
(define %args-source-directory
  (unpacked-source "args" %args-source))

(define-public xdg-utils-cxx
  (package
    (name "xdg-utils-cxx")
    (version "1.0.1")
    (source %xdg-utils-cxx-source)
    (build-system cmake-build-system)
    (arguments
     (list
      #:tests? #f                       ;tests fetch and build GoogleTest
      #:configure-flags
      #~(list "-DXDG_UTILS_SHARED=ON"
              "-DXDG_UTILS_TESTS=OFF"
              "-DCMAKE_POSITION_INDEPENDENT_CODE=ON")))
    (synopsis "Freedesktop standards implementation for C++")
    (description
     "xdg-utils-cxx is a C++ implementation of the freedesktop.org desktop
entry and base directory specifications.  It provides the DesktopEntry and
BaseDir libraries used by libappimage and AppImageLauncher to read and write
@file{.desktop} files and to locate the user's XDG directories.")
    (home-page "https://github.com/AppImageCommunity/xdg-utils-cxx")
    (license expat)))

(define-public appimagelauncher
  (package
    (name "appimagelauncher")
    (version %appimagelauncher-version)
    (source %appimagelauncher-source)
    (build-system cmake-build-system)
    (arguments
     (list
      #:modules '((guix build cmake-build-system)
                  (guix build qt-utils)
                  (guix build utils))
      #:imported-modules `(,@%cmake-build-system-modules
                           (guix build qt-utils))
      #:build-type "Release"
      ;; Upstream has no test suite of its own; the bundled projects' tests
      ;; either need network access or are not part of the installed product.
      #:tests? #f
      #:configure-flags
      #~(list
         "-DBUILD_TESTING=OFF"
         "-DENABLE_UPDATE_HELPER=ON"
         ;; AppImageLauncher needs the update helper libraries, not the
         ;; AppImageUpdate GUI or command-line tool.
         "-DBUILD_LIBAPPIMAGEUPDATE_ONLY=ON"
         ;; Use the packaged squashfuse and xdg-utils-cxx instead of
         ;; libappimage's ExternalProject downloads.
         "-DUSE_SYSTEM_SQUASHFUSE=ON"
         "-DUSE_SYSTEM_XDGUTILS=ON"
         ;; cpr 1.8.3 would otherwise build its own copy of libcurl.
         "-DCPR_FORCE_USE_SYSTEM_CURL=ON"
         ;; cpr compiles with -Werror, and its curl 7-era code triggers
         ;; deprecation warnings with the libcurl Guix provides.
         "-DCMAKE_CXX_FLAGS=-Wno-deprecated-declarations"
         ;; zsync2's C code predates GCC 14's implicit-function-declaration
         ;; and incompatible-pointer-types defaults, which are hard errors.
         (string-append
          "-DCMAKE_C_FLAGS="
          "-Wno-error=incompatible-pointer-types "
          "-Wno-error=implicit-function-declaration")
         (string-append "-DFETCHCONTENT_SOURCE_DIR_APPIMAGEUPDATE="
                        #$%appimageupdate-source-directory)
         (string-append "-DFETCHCONTENT_SOURCE_DIR_ZSYNC2="
                        #$%zsync2-source-directory)
         (string-append "-DFETCHCONTENT_SOURCE_DIR_LIBAPPIMAGE="
                        #$%libappimage-source-directory)
         (string-append "-DFETCHCONTENT_SOURCE_DIR_CPR="
                        #$%cpr-source-directory)
         (string-append "-DFETCHCONTENT_SOURCE_DIR_ARGS="
                        #$%args-source-directory))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'configure 'prepare-build
            (lambda _
              ;; versioning.cmake insists on a Git commit, but release
              ;; tarballs do not contain .git or cmake/GIT_COMMIT.
              (call-with-output-file "cmake/GIT_COMMIT"
                (lambda (port)
                  (display #$%appimagelauncher-commit port)))

              ;; The tag is 3.0.0-beta-3, but upstream's versioning file was
              ;; not bumped and still reports beta-2.
              (substitute* "cmake/versioning.cmake"
                (("set\\(V_SUFFIX \"-beta-2\"\\)")
                 "set(V_SUFFIX \"-beta-3\")"))

              ;; binfmt-bypass builds an additional 32-bit preload library
              ;; with -m32 on x86_64.  Guix's toolchain is not multilib, so
              ;; keep the native preload library only.
              (substitute* "src/binfmt-bypass/CMakeLists.txt"
                (("if\\(CMAKE_SYSTEM_PROCESSOR MATCHES x86_64\\)")
                 "if(FALSE)  # multilib toolchain unavailable"))))
          (add-after 'install 'wrap-programs
            (lambda* (#:key inputs outputs #:allow-other-keys)
              (let* ((out (assoc-ref outputs "out"))
                     (qtbase (assoc-ref inputs "qtbase"))
                     (qtdeclarative (assoc-ref inputs "qtdeclarative"))
                     (path-inputs
                      '("desktop-file-utils" "shared-mime-info" "gtk+"
                        "xdg-utils" "gnupg"))
                     (path
                      (map (lambda (input)
                             (string-append (assoc-ref inputs input) "/bin"))
                           path-inputs))
                     (data-dirs
                      (cons (string-append out "/share")
                            (map (lambda (input)
                                   (string-append
                                    (assoc-ref inputs input) "/share"))
                                 path-inputs)))
                     (qt-plugins
                      (list (string-append qtbase "/lib/qt5/plugins")
                            (string-append qtdeclarative
                                           "/lib/qt5/plugins")))
                     (qml-imports
                      (list (string-append qtdeclarative "/lib/qt5/qml"))))
                ;; Qt plugins, QML modules and XDG data directories for the
                ;; programs in bin/.
                (wrap-all-qt-programs
                 #:inputs inputs
                 #:outputs (list (cons "out" out))
                 #:qtbase (assoc-ref inputs "qtbase"))

                ;; The removal and update helpers live in lib/appimagelauncher,
                ;; not in bin/, so wrap-all-qt-programs does not see them.
                (for-each
                 (lambda (program)
                   (when (file-exists? program)
                     (wrap-program program
                       `("PATH" suffix ,path)
                       `("XDG_DATA_DIRS" suffix ,data-dirs)
                       `("QT_PLUGIN_PATH" prefix ,qt-plugins)
                       `("QML2_IMPORT_PATH" prefix ,qml-imports))))
                 (map (lambda (name)
                        (string-append out "/lib/appimagelauncher/" name))
                      '("remove" "update")))

                ;; AppImageLauncher refreshes the desktop, MIME and icon
                ;; databases with tools from PATH.
                (for-each
                 (lambda (program)
                   (wrap-program program
                     `("PATH" suffix ,path)))
                 (find-files
                  (string-append out "/bin")
                  (lambda (file stat)
                    (and (executable-file? file)
                         (not (string-prefix? "." (basename file)))))))))))))
    (inputs
     (list qtbase-5
           qtdeclarative-5
           glib
           libarchive
           libxpm
           libx11
           libxext
           libxt
           curl
           boost
           librsvg
           cairo
           xz
           (list zstd "lib")
           zlib
           libgcrypt
           libgpg-error
           gpgme
           openssl
           nlohmann-json
           squashfuse
           xdg-utils-cxx
           desktop-file-utils
           shared-mime-info
           gtk+
           xdg-utils
           gnupg
           bash-minimal))
    (native-inputs
     (list pkg-config
           qttools-5
           xxd
           patchelf
           autoconf
           automake
           libtool
           patch))
    (synopsis "Desktop integration and management for AppImages")
    (description
     "AppImageLauncher makes AppImages behave like regular applications.  It
intercepts attempts to run an AppImage, offers to move it to a central
location, and installs a desktop entry, icons, an update action and a removal
action.  The package includes the AppImageLauncher GUI, its settings program,
the @command{appimagelauncherd} daemon, and the @command{ail-cli} command-line
tool.

The kernel's binfmt_misc facility must be configured to use
@file{lib/appimagelauncher/binfmt-interpreter} as the interpreter for
AppImages; installing the package alone does not modify system-wide Binfmt
configuration.  See the channel README for the required registrations.")
    (home-page "https://github.com/TheAssassin/AppImageLauncher")
    (license expat)))
