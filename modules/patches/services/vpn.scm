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
;;; point the daemon at /opt/Mullvad VPN/resources: it logs to its stdout
;;; (captured by shepherd) and takes its paths from the MULLVAD_*
;;; environment variables, which is what the daemon expects on Linux.
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
;;;                                    "/var/lib/mullvad-vpn/resources"))))
;;;                   %desktop-services)))
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
;;; Note on `resource-directory': the daemon spawns `wireguard-go' from
;;; there to build the tunnel.  Guix has no wireguard-go package yet, so
;;; the default is #f (daemon's own default, which looks next to the
;;; executable and will not contain it).  Until that is packaged, drop a
;;; wireguard-go binary in a directory and point the field at it.  The
;;; daemon still runs without it; only bringing a tunnel up will fail.
;;;
;;; Note on lockdown: upstream's systemd unit sends SIGUSR1 on restart so
;;; the daemon enables its lockdown (kill-switch) mode before shutting
;;; down, to avoid leaks.  `herd stop' sends SIGTERM, so a plain restart
;;; does not enter lockdown first.  If you care about that, stop the
;;; service explicitly before reconfiguring.

(define-module (patches services vpn)
  #:use-module (gnu services)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (patches vpn)
  #:export (mullvad-vpn-configuration
            mullvad-vpn-configuration?
            mullvad-vpn-configuration-package
            mullvad-vpn-configuration-resource-directory
            mullvad-vpn-configuration-settings-directory
            mullvad-vpn-configuration-verbosity
            mullvad-vpn-service-type))

;;;
;;; Configuration.
;;;

(define-record-type* <mullvad-vpn-configuration>
  mullvad-vpn-configuration make-mullvad-vpn-configuration
  mullvad-vpn-configuration?
  (package            mullvad-vpn-configuration-package
                      (default mullvad-vpn))
  ;; Directory holding wireguard-go.  #f means "leave it to the daemon",
  ;; which resolves this relative to its own executable.
  (resource-directory mullvad-vpn-configuration-resource-directory
                      (default #f))
  ;; Where the daemon keeps settings.json (account number, relay
  ;; preference, ...).  Must be writable by root only.
  (settings-directory mullvad-vpn-configuration-settings-directory
                      (default "/var/lib/mullvad-vpn"))
  ;; Number of -v flags.  0 is "error only", 2 matches upstream's unit.
  (verbosity          mullvad-vpn-configuration-verbosity
                      (default 2)))

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

         ;; Build the command line on the host side so the gexp below stays
         ;; readable.  -v is a counting flag, hence "-v", "-vv", ...
         (arguments
          (append (list (file-append package "/bin/mullvad-daemon"))
                  (if (> verbosity 0)
                      (list (string-append "-" (make-string verbosity #\v)))
                      '())
                  ;; Let shepherd own the logs: with --disable-log-to-file
                  ;; everything goes to stdout, which avoids needing a
                  ;; writable /var/log/mullvad-vpn and keeps the service
                  ;; self-contained.
                  (list "--disable-stdout-timestamps"
                        "--disable-log-to-file")))

         ;; The daemon reads its paths from the environment, not from
         ;; command-line flags.
         (environment
          (append (list (string-append "MULLVAD_SETTINGS_DIR="
                                       settings-directory))
                  (if resource-directory
                      (list (string-append "MULLVAD_RESOURCE_DIR="
                                           resource-directory))
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
                #:environment-variables (list #$@environment)))
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
                             mullvad-vpn-activation)))
   (default-value (mullvad-vpn-configuration))))
