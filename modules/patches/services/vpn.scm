;;; -*- mode: scheme; -*-
;;;
;;; Guix System service for the Mullvad VPN daemon.
;;;
;;; The daemon is the privileged half of the Mullvad client: it owns the
;;; WireGuard tunnel, the routing table, DNS configuration and the
;;; firewall/kill-switch rules.  The command-line client (mullvad) talks
;;; to it over a local socket, so both come from the same package.
;;;
;;; Unlike the systemd unit that upstream ships, this service does not
;;; point the daemon at /opt/Mullvad VPN/resources: it takes its paths from
;;; the MULLVAD_* environment variables, which is what the daemon expects on
;;; Linux.  It logs to stdout (captured by shepherd) and, like upstream, to
;;; /var/log/mullvad-vpn/daemon.log.
;;;
;;; ---------------------------------------------------------------------
;;; Usage, in /etc/config.scm
;;; ---------------------------------------------------------------------
;;;
;;;   1. Make sure the channel is in ~/.config/guix/channels.scm and that
;;;      you have run `guix pull'.
;;;
;;;   2. Add the module import at the top of /etc/config.scm:
;;;
;;;        (use-modules (patches services vpn))
;;;
;;;   3. Add the service to your operating-system's `services' field:
;;;
;;;        (operating-system
;;;          ...
;;;          (services
;;;           (append (list (service mullvad-vpn-service-type
;;;                                  (mullvad-vpn-configuration
;;;                                   (resource-directory
;;;                                    (file-append
;;;                                     mullvad-vpn-gui
;;;                                     "/libexec/mullvad-vpn/resources")))))
;;;                   %desktop-services)))
;;;
;;;      (file-append needs (guix gexp), and mullvad-vpn-gui comes from
;;;      (patches mullvad-gui).)
;;;
;;;   4. Reconfigure:
;;;
;;;        sudo guix system reconfigure /etc/config.scm
;;;
;;;      then check on it with:
;;;
;;;        sudo herd status mullvad-daemon
;;;        sudo herd log mullvad-daemon      # or: journalctl-equivalent
;;;        mullvad status                   # once logged in
;;;
;;; Note on `resource-directory': the daemon reads relays.json from there,
;;; the relay list it uses until it has downloaded a current one.  The
;;; default is #f (the daemon's own default, the directory of its
;;; executable, which holds no relays.json).  2026.5 does not use
;;; wireguard-go: it drives kernel WireGuard, or its in-process gotatun
;;; implementation, so the directory needs no tunnel binaries.
;;;
;;; The service also installs mullvad-exclude setuid root, as upstream's
;;; packages do, so the GUI's split-tunnelling page can launch programs
;;; outside the tunnel.
;;;
;;; Note on lockdown: upstream's systemd unit sends SIGUSR1 on restart so
;;; the daemon enables its lockdown (kill-switch) mode before shutting
;;; down, to avoid leaks.  `herd stop' sends SIGTERM, so a plain restart
;;; does not enter lockdown first.  If you care about that, stop the
;;; service explicitly before reconfiguring.

(define-module (patches services vpn)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (gnu system privilege)
  #:use-module ((gnu packages base) #:select (coreutils))
  #:use-module ((gnu packages dns) #:select (openresolv))
  #:use-module ((gnu packages linux) #:select (iproute))
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (patches vpn)
  #:export (mullvad-vpn-configuration
            mullvad-vpn-configuration?
            mullvad-vpn-configuration-package
            mullvad-vpn-configuration-resource-directory
            mullvad-vpn-configuration-settings-directory
            mullvad-vpn-configuration-verbosity
            mullvad-vpn-configuration-log-to-file?
            mullvad-vpn-service-type))

;;;
;;; Configuration.
;;;

(define-record-type* <mullvad-vpn-configuration>
  mullvad-vpn-configuration make-mullvad-vpn-configuration
  mullvad-vpn-configuration?
  (package            mullvad-vpn-configuration-package
                      (default mullvad-vpn))
  ;; Directory holding relays.json, the relay list the daemon starts from
  ;; before it has fetched a fresh one.  #f means "leave it to the daemon",
  ;; which resolves this relative to its own executable.  May be a string
  ;; or a file-like object, e.g.
  ;; (file-append mullvad-vpn-gui "/libexec/mullvad-vpn/resources").
  (resource-directory mullvad-vpn-configuration-resource-directory
                      (default #f))
  ;; Where the daemon keeps settings.json (account number, relay
  ;; preference, ...).  Must be writable by root only.
  (settings-directory mullvad-vpn-configuration-settings-directory
                      (default "/var/lib/mullvad-vpn"))
  ;; Number of -v flags.  0 is "error only", 2 matches upstream's unit.
  (verbosity          mullvad-vpn-configuration-verbosity
                      (default 2))
  ;; Also log to /var/log/mullvad-vpn/daemon.log, as upstream's unit does.
  ;; The GUI's "Report a problem" page collects that file; with #f the
  ;; daemon logs only to stdout, i.e. to the Shepherd.
  (log-to-file?       mullvad-vpn-configuration-log-to-file?
                      (default #t)))

;;;
;;; Shepherd service.
;;;

(define (mullvad-vpn-shepherd-service config)
  "Return the shepherd service running the Mullvad VPN daemon described by
CONFIG."
  (let* ((package            (mullvad-vpn-configuration-package config))
         (resource-directory (mullvad-vpn-configuration-resource-directory config))
         (settings-directory (mullvad-vpn-configuration-settings-directory config))
         (verbosity          (mullvad-vpn-configuration-verbosity config))
         (log-to-file?       (mullvad-vpn-configuration-log-to-file? config))

         ;; Build the command line on the host side so the gexp below stays
         ;; readable.  -v is a counting flag, hence "-v", "-vv", ...
         (arguments
          (append (list (file-append package "/bin/mullvad-daemon"))
                  (if (> verbosity 0)
                      (list (string-append "-" (make-string verbosity #\v)))
                      '())
                  ;; stdout always goes to the Shepherd's log.  The daemon
                  ;; creates /var/log/mullvad-vpn itself when it logs to a
                  ;; file as well.
                  (list "--disable-stdout-timestamps")
                  (if log-to-file?
                      '()
                      (list "--disable-log-to-file"))))

         ;; The daemon reads its paths from the environment, not from
         ;; command-line flags.  RESOURCE-DIRECTORY may be a string or a
         ;; file-like object, so build the environment as a gexp and let
         ;; #$ lower it; #$@ splices the optional resource entry.
         ;;
         ;; #:environment-variables *replaces* the environment, so without
         ;; an explicit PATH the daemon has none, and it runs programs:
         ;;
         ;;   ip          adds the IPv6 address to a userspace (gotatun)
         ;;               tunnel, used for DAITA, some obfuscation modes and
         ;;               whenever kernel WireGuard is unavailable; without it
         ;;               connecting fails outright;
         ;;   resolvconf  is how DNS is managed on Guix System, where
         ;;               NetworkManager hands resolv.conf to openresolv.
         ;;               The daemon finds it through PATH; NetworkManager
         ;;               itself is newer than the daemon will drive for DNS;
         ;;   uname       reports the kernel version for logs and problem
         ;;               reports.
         (environment
          #~(list (string-append "MULLVAD_SETTINGS_DIR=" #$settings-directory)
                  (string-append "PATH="
                                 #$(file-append iproute "/sbin") ":"
                                 #$(file-append openresolv "/sbin") ":"
                                 #$(file-append coreutils "/bin"))
                  #$@(if resource-directory
                         (list #~(string-append "MULLVAD_RESOURCE_DIR="
                                                #$resource-directory))
                         '()))))

    (list
     (shepherd-service
      (documentation "Run the Mullvad VPN daemon.")
      (provision '(mullvad-daemon))
      ;; The daemon manages its own network configuration, so only wait
      ;; for the basics rather than for a `networking' provision that is
      ;; not present on every system.
      (requirement '(user-processes))
      (start #~(make-forkexec-constructor
                (list #$@arguments)
                #:environment-variables #$environment))
      (stop #~(make-kill-destructor))))))

;;;
;;; Activation: create the settings directory before the daemon starts.
;;;

(define (mullvad-vpn-activation config)
  "Return an activation gexp for CONFIG, creating the settings directory."
  #~(begin
      (use-modules (guix build utils))
      (let ((settings #$(mullvad-vpn-configuration-settings-directory config)))
        (mkdir-p settings)
        ;; settings.json holds the account number, so root only.
        (chmod settings #o700))))

;;;
;;; Split tunnelling helper.
;;;

;;; mullvad-exclude launches a program outside the tunnel by moving itself
;;; into the daemon's net_cls cgroup and then dropping back to the caller's
;;; user and group before exec'ing the program.  Joining that cgroup needs
;;; root, so upstream installs it setuid root (after-install.sh); the GUI's
;;; split-tunnelling page runs it by name, and /run/setuid-programs comes
;;; first in PATH on Guix System.
(define (mullvad-vpn-privileged-programs config)
  (list (privileged-program
         (program (file-append (mullvad-vpn-configuration-package config)
                               "/bin/mullvad-exclude"))
         (setuid? #t))))

;;;
;;; Service type.
;;;

(define mullvad-vpn-service-type
  (service-type
   (name 'mullvad-vpn)
   (description
    "Run the Mullvad VPN daemon, which manages the WireGuard tunnel, the
routing table, DNS settings and the firewall rules for the Mullvad client.
The @command{mullvad} command-line client talks to it over a local socket.")
   (extensions
    (list (service-extension shepherd-root-service-type
                             mullvad-vpn-shepherd-service)
          (service-extension activation-service-type
                             mullvad-vpn-activation)
          (service-extension privileged-program-service-type
                             mullvad-vpn-privileged-programs)))
   (default-value (mullvad-vpn-configuration))))
