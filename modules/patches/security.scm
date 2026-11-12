;;; -*- mode: scheme; -*-
;;;
;;; Security assessment tools: Metasploit, Nmap, Gobuster, SecLists and ZAP.
;;;
;;; Metasploit includes its native msfmcpd server.  The launcher enables
;;; dangerous actions by default, as requested; set MSF_MCP_DANGEROUS_ACTIONS
;;; to false, 0, no or off to run in read-only safe mode.  ZAP includes the
;;; official MCP Integration add-on, whose HTTP listener is enabled separately
;;; from ZAP's Options > MCP Integration panel.

(define-module (patches security)
  #:use-module (gnu packages admin)
  #:use-module (gnu packages bash)
  #:use-module (gnu packages base)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages crypto)
  #:use-module (gnu packages debian)
  #:use-module (gnu packages elf)
  #:use-module (gnu packages gcc)
  #:use-module (gnu packages java)
  #:use-module (guix base32)
  #:use-module (guix build-system trivial)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix utils)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages))

(define-public nmap
  (package
    (inherit (@@ (gnu packages admin) nmap))
    (version "7.993")
    (source
     (origin
       (inherit (package-source (@@ (gnu packages admin) nmap)))
       (uri (string-append "https://nmap.org/dist/nmap-" version
                           ".tar.bz2"))
       (sha256
        (base32 "0ncwqzhp2xf0y6j20i89ijj8dfn5sicvkzmqbp5wxgqm97q5a3i7"))))
    (arguments
     (substitute-keyword-arguments (package-arguments (@@ (gnu packages admin) nmap))
       ((#:phases phases)
        #~(modify-phases #$phases
            ;; 7.993 already contains the Python 3.12 importlib fix; applying
            ;; the older compatibility patch corrupts importlib.util.
            (delete 'fix-tests-for-python-3.12)))))))

(define-public gobuster
  (package
    (name "gobuster")
    (version "3.8.2")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/OJ/gobuster/releases/download/v" version
             "/gobuster_Linux_x86_64.tar.gz"))
       (file-name (string-append name "-" version "-linux-x64.tar.gz"))
       (sha256
        (base32 "08c01z66d9q01hsl9rxb7y5npa73lc2j7vx0hbb13c7fcslwda68"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let ((tar (assoc-ref %build-inputs "tar"))
                (gzip (assoc-ref %build-inputs "gzip"))
                (out (assoc-ref %outputs "out")))
            (setenv "PATH" (string-append gzip "/bin:" tar "/bin"))
            (invoke (string-append tar "/bin/tar") "xzf"
                    (assoc-ref %build-inputs "source"))
            (install-file "gobuster" (string-append out "/bin"))))))
    (native-inputs (list gzip tar))
    (supported-systems '("x86_64-linux"))
    (home-page "https://github.com/OJ/gobuster")
    (synopsis "Directory, file, DNS and virtual-host discovery tool")
    (description
     "Gobuster enumerates directories and files, DNS subdomains, virtual hosts,
TFTP servers and Amazon S3 buckets.  This package installs upstream's static
Linux x86_64 release executable.")
    (license license:asl2.0)))

(define-public seclists
  (package
    (name "seclists")
    (version "2026.2")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/danielmiessler/SecLists")
             (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1zwm1nlr0dx9k3rdz684f15hchzsydc8x6hvpl3j1hqq4zsgr44x"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build union) (guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build union) (guix build utils))
          (mkdir-p (string-append %output "/share"))
          ;; SecLists is several gigabytes of small text files.  Keep the
          ;; immutable checkout in the store and link its files rather than
          ;; copying the whole tree into a second store item.
          (union-build (string-append %output "/share/seclists")
                       (list (assoc-ref %build-inputs "source"))
                       #:create-all-directories? #t))))
    (home-page "https://github.com/danielmiessler/SecLists")
    (synopsis "Security assessment wordlists and test data")
    (description
     "SecLists is a collection of wordlists for usernames, passwords, URLs,
files, directories, subdomains, fuzzing and other security assessments.  It is
installed under @file{share/seclists}; point Gobuster's @option{-w} option at
the desired list there.")
    (license license:cc-by-sa4.0)))

(define-public zaproxy-mcp
  (package
    (name "zaproxy-mcp")
    (version "0.4.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zaproxy/zap-extensions/releases/download/mcp-v"
             version "/mcp-alpha-" version ".zap"))
       (file-name (string-append name "-" version ".zap"))
       (sha256
        (base32 "1h0j9n7q1aqa7jkssk4x4hxggn3j5njiya0dqjdy3hfdfi88bvsa"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (install-file (assoc-ref %build-inputs "source")
                        (string-append %output "/share/zaproxy/plugin")))))
    (home-page "https://www.zaproxy.org/docs/desktop/addons/mcp-integration/")
    (synopsis "Official MCP Integration add-on for ZAP")
    (description
     "This is the ZAP Dev Team's official MCP Integration add-on.  It provides
an HTTP MCP server inside ZAP with spider and active-scan tools, alert and
history resources, scan prompts, and support for importing external MCP
servers as test targets.  The @code{zaproxy} package includes this add-on.")
    (license license:asl2.0)))

(define-public zaproxy
  (package
    (name "zaproxy")
    (version "2.17.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://github.com/zaproxy/zaproxy/releases/download/v"
             version "/ZAP_" version "_Linux.tar.gz"))
       (file-name (string-append name "-" version "-linux.tar.gz"))
       (sha256
        (base32 "0nnyvnrjpl9l0h7hm3yc01fbg85f231cj01znj1vczb2lfm9krzg"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils))
      #:builder
      #~(begin
          (use-modules (guix build utils))
          (let* ((out (assoc-ref %outputs "out"))
                 (source (assoc-ref %build-inputs "source"))
                 (mcp (assoc-ref %build-inputs "zaproxy-mcp"))
                 (tar (assoc-ref %build-inputs "tar"))
                 (gzip (assoc-ref %build-inputs "gzip"))
                 (bash (assoc-ref %build-inputs "bash-minimal"))
                 (coreutils (assoc-ref %build-inputs "coreutils-minimal"))
                 (java (assoc-ref %build-inputs "openjdk"))
                 (root (string-append out "/opt/zaproxy")))
            (setenv "PATH" (string-append gzip "/bin:" tar "/bin"))
            (mkdir-p root)
            (invoke (string-append tar "/bin/tar") "xzf" source "-C" root
                    "--strip-components=1")
            (mkdir-p (string-append root "/plugin"))
            (copy-file (car (find-files mcp "\\.zap$"))
                       (string-append root "/plugin/mcp-alpha-"
                                      #$(package-version zaproxy-mcp) ".zap"))
            ;; Constant.VERSION_TAG in ZAP 2.17.0.  A current-version template
            ;; avoids a second initialization pass in the user's home directory.
            (substitute* (string-append root "/xml/config.xml")
              (("^</config>")
               "\t<version>20017000</version>\n</config>"))
            (substitute* (string-append root "/zap.sh")
              (("#!/usr/bin/env bash")
               (string-append "#!" bash "/bin/bash")))

            (let ((apps (string-append out "/share/applications"))
                  (icons (string-append out "/share/icons/hicolor/256x256/apps")))
              (mkdir-p apps)
              (mkdir-p icons)
              (copy-file (string-append root "/zap.ico")
                         (string-append icons "/zaproxy.ico"))
              (make-desktop-entry-file
               (string-append apps "/zaproxy.desktop")
               #:name "ZAP"
               #:generic-name "Web application security scanner"
               #:exec (string-append out "/bin/zaproxy")
               #:icon "zaproxy"
               #:categories '("Development" "Security")))

            (mkdir-p (string-append out "/bin"))
            (for-each
             (lambda (name)
               (let ((launcher (string-append out "/bin/" name)))
                 (call-with-output-file launcher
                   (lambda (port)
                     (format port "#!~a/bin/bash~%" bash)
                     (format port "export JAVA_HOME=~a~%" java)
                     (format port "export PATH=~a/bin:~a/bin:$PATH~%"
                             java coreutils)
                     (display "zap_home=\"${ZAP_HOME:-$HOME/.ZAP}\"\n" port)
                     (display "if [ ! -e \"$zap_home/config.xml\" ]; then\n" port)
                     (display "  mkdir -p \"$zap_home\"\n" port)
                     (format port
                             (string-append
                              "  cp ~a/opt/zaproxy/xml/config.xml "
                              "\"$zap_home/config.xml\"\n")
                             out)
                     (display "  chmod u+w \"$zap_home/config.xml\"\n" port)
                     (display "fi\n" port)
                     (format port "exec ~a/opt/zaproxy/zap.sh \"$@\"~%" out)))
                 (chmod launcher #o555)))
             '("zaproxy" "zap" "zap-mcp"))))))
    (native-inputs (list gzip tar))
    (inputs (list bash-minimal coreutils-minimal openjdk21 zaproxy-mcp))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.zaproxy.org/")
    (synopsis "Zed Attack Proxy with the official MCP Integration add-on")
    (description
     "ZAP is a web application security scanner and intercepting proxy.  This
package includes the official MCP Integration add-on.  Start it with
@command{zaproxy} or @command{zap-mcp}, then enable the MCP listener in
Options > MCP Integration; it is disabled by default and uses port 8282.
Secure Only rejects plain HTTP by default.  A generated security key can be
required in the client's Authorization header.  Do not expose this control port
to other machines or networks.")
    (license license:asl2.0)))

;;;
;;; Metasploit Framework and its native MCP server.
;;;

(define-public metasploit-framework
  (package
    (name "metasploit-framework")
    (version "6.5.10-20261106055829")
    (source
     (origin
       (method url-fetch)
       (uri (string-append
             "https://apt.metasploit.com/pool/main/m/metasploit-framework/"
             "metasploit-framework_6.5.10~20261106055829~1rapid7-1_amd64.deb"))
       (file-name (string-append name "-" version ".deb"))
       (sha256
        (base32 "02ihwxyq12lzsh56dfpl4p6kijvzvsvlqmpjj9likdfv53lfn1bi"))))
    (build-system trivial-build-system)
    (arguments
     (list
      #:modules '((guix build utils)
                  (ice-9 ftw)
                  (ice-9 popen)
                  (ice-9 rdelim))
      #:builder
      #~(begin
          (use-modules (guix build utils)
                       (ice-9 ftw)
                       (ice-9 popen)
                       (ice-9 rdelim))
          (define (metasploit-script? file)
            ;; Return true for text scripts, false for binary payloads.
            (catch #t
              (lambda ()
                (call-with-input-file file
                  (lambda (port)
                    (string-prefix? "#!" (read-line port)))))
              (lambda _ #f)))
          (define (metasploit-elf? file)
            ;; READ-CHAR also handles empty and short payload files safely.
            (call-with-input-file file
              (lambda (port)
                (equal? (list (read-char port) (read-char port)
                              (read-char port) (read-char port))
                        '(#\x7f #\E #\L #\F)))))
          (define (regular-file? file stat)
            ;; Ignore symlinks, including links whose targets are directories.
            (eq? 'regular (stat:type stat)))
          (define (replace-all text needle replacement)
            ;; Replace every occurrence without relying on host-only Guix utils.
            (let ((needle-length (string-length needle)))
              (let loop ((start 0))
                (let ((index (string-contains text needle start)))
                  (if index
                      (string-append
                       (substring text start index) replacement
                       (loop (+ index needle-length)))
                      (substring text start))))))
          (define (command-output . command)
            ;; Return stdout even when patchelf has no value to report.
            (let* ((port (apply open-pipe* OPEN_READ command))
                   (output (read-line port)))
              (close-pipe port)
              (if (eof-object? output) "" output)))
          (let* ((out (assoc-ref %outputs "out"))
                 (source (assoc-ref %build-inputs "source"))
                 (dpkg (assoc-ref %build-inputs "dpkg"))
                 (tar (assoc-ref %build-inputs "tar"))
                 (gzip (assoc-ref %build-inputs "gzip"))
                 (xz (assoc-ref %build-inputs "xz"))
                 (patchelf (assoc-ref %build-inputs "patchelf"))
                 (glibc (assoc-ref %build-inputs "glibc"))
                 (libxcrypt (assoc-ref %build-inputs "libxcrypt"))
                 (gcc-lib (assoc-ref %build-inputs "gcc:lib"))
                 (bash (assoc-ref %build-inputs "bash-minimal"))
                 (root (string-append out "/opt/metasploit-framework")))
            (setenv "PATH" (string-append tar "/bin:" gzip "/bin:" xz "/bin"))
            (mkdir-p out)
            (invoke (string-append dpkg "/bin/dpkg-deb") "-x" source out)

            ;; Patch only the Omnibus runtime.  In particular, leave the ELF
            ;; payloads under embedded/framework/data byte-for-byte untouched.
            (define (patch-runtime-elf file patch-interpreter?)
              (when (metasploit-elf? file)
                (when patch-interpreter?
                  (let ((interpreter
                         (command-output
                          (string-append patchelf "/bin/patchelf")
                          "--print-interpreter" file)))
                    (when (string-contains
                           interpreter "/lib64/ld-linux-x86-64.so.2")
                      (invoke (string-append patchelf "/bin/patchelf")
                              "--set-interpreter"
                              (string-append glibc "/lib/ld-linux-x86-64.so.2")
                              file))))
                (let ((rpath
                       (command-output
                        (string-append patchelf "/bin/patchelf")
                        "--print-rpath" file)))
                  (when (string-contains rpath "/opt/metasploit-framework")
                    (invoke (string-append patchelf "/bin/patchelf")
                            "--set-rpath"
                            (replace-all rpath "/opt/metasploit-framework" root)
                            file)))))

            (for-each (lambda (file) (patch-runtime-elf file #t))
                      (find-files (string-append root "/embedded/bin")
                                  regular-file?))
            (for-each (lambda (file) (patch-runtime-elf file #f))
                      (find-files (string-append root "/embedded/lib")
                                  regular-file?))
            (for-each
             (lambda (file)
               (when (metasploit-script? file)
                 (substitute* file
                   (("#!/bin/sh")
                    (string-append "#!" bash "/bin/bash"))
                   (("/opt/metasploit-framework") root))))
             (find-files (string-append root "/bin") regular-file?))

            ;; Install environment-setting launchers for every upstream command.
            ;; The wrappers also cover native gems loaded by Ruby and ensure
            ;; msfrpcd started by msfmcpd uses the same store paths.
            (mkdir-p (string-append out "/bin"))
            (for-each
             (lambda (name)
               (let ((target (string-append root "/bin/" name))
                     (launcher (string-append out "/bin/" name)))
                 (call-with-output-file launcher
                   (lambda (port)
                     (format port "#!~a/bin/bash~%" bash)
                     (format port "export PATH=~a/embedded/bin:~a/bin:~a/bin:$PATH~%"
                             root root out)
                     (format port
                             (string-append
                              "export LD_LIBRARY_PATH=~a/embedded/lib:~a/lib:"
                              "~a/lib:~a/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}~%")
                             root glibc libxcrypt gcc-lib)
                     (display "unset GEM_HOME GEM_PATH GEM_ROOT RUBY_ENGINE RUBY_ROOT\n"
                              port)
                     (format port "exec ~a \"$@\"~%" target)))
                 (chmod launcher #o555)))
             (scandir (string-append root "/bin")
                      (lambda (name)
                        (not (member name '("." ".."))))))

            ;; The native MCP launcher enables dangerous actions by default.
            ;; Setting the documented variable to false/0/no/off selects the
            ;; read-only gate instead, without editing the immutable package.
            (let ((launcher (string-append out "/bin/msfmcpd"))
                  (real (string-append root "/embedded/framework/msfmcpd")))
              (call-with-output-file launcher
                (lambda (port)
                  (format port "#!~a/bin/bash~%" bash)
                  (format port "export PATH=~a/embedded/bin:~a/bin:~a/bin:$PATH~%"
                          root root out)
                  (format port
                          (string-append
                           "export LD_LIBRARY_PATH=~a/embedded/lib:~a/lib:"
                           "~a/lib:~a/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}~%")
                          root glibc libxcrypt gcc-lib)
                  (display "unset GEM_HOME GEM_PATH GEM_ROOT RUBY_ENGINE RUBY_ROOT\n"
                           port)
                  (format port
                          (string-append
                           "export RUBYLIB=~a/embedded/framework/lib"
                           "${RUBYLIB:+:$RUBYLIB}~%")
                          root)
                  (display "case \"${MSF_MCP_DANGEROUS_ACTIONS:-true}\" in\n" port)
                  (display "  0|false|FALSE|no|NO|off|OFF)\n" port)
                  (format port "    exec ~a/embedded/bin/ruby ~a \"$@\" ;;\n"
                          root real)
                  (display "  *)\n" port)
                  (format port
                          (string-append
                           "    exec ~a/embedded/bin/ruby ~a "
                           "--enable-dangerous-actions \"$@\" ;;\n")
                          root real)
                  (display "esac\n" port)))
              (chmod launcher #o555))))))
    (native-inputs (list dpkg patchelf tar gzip xz))
    (inputs `(("bash-minimal" ,bash-minimal)
              ("glibc" ,glibc)
              ("libxcrypt" ,libxcrypt)
              ("gcc:lib" ,gcc "lib")))
    (supported-systems '("x86_64-linux"))
    (home-page "https://www.metasploit.com/")
    (synopsis "Metasploit Framework with its native MCP server")
    (description
     "Metasploit Framework is a modular platform for vulnerability research,
security testing and exploit development.  This package installs Rapid7's
Omnibus build with Ruby, modules and native dependencies included.  It also
provides @command{msfmcpd}, the native 16-tool MCP server with automatic local
MessagePack RPC startup.

Dangerous actions are enabled by default in this package.  Set
@env{MSF_MCP_DANGEROUS_ACTIONS} to @code{false}, @code{0}, @code{no} or
@code{off} to use the read-only gate instead.  Module execution and session
control should only be used on systems you own or are authorized to test.")
    (license license:bsd-3)))
