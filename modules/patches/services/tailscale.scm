;;; -*- mode: scheme; -*-
;;;
;;; Guix System service for tailscaled.
;;;
;;; Example:
;;;   (use-modules (patches services tailscale))
;;;   (services
;;;    (cons* (service tailscale-service-type)
;;;           ...))
;;;
;;; After reconfiguring, run `sudo tailscale up' to authenticate this machine.
;;;

(define-module (patches services tailscale)
  #:use-module (gnu services)
  #:use-module (gnu services admin)
  #:use-module (gnu services shepherd)
  #:use-module (guix gexp)
  #:use-module (guix records)
  #:use-module (patches tailscale)
  #:export (tailscale-configuration
            tailscale-configuration?
            tailscale-configuration-tailscale
            tailscale-configuration-tailscaled
            tailscale-configuration-port
            tailscale-configuration-socket
            tailscale-configuration-log-file
            tailscale-configuration-state-directory
            tailscale-configuration-verbosity
            tailscale-configuration-upload-logs?
            tailscale-configuration-extra-options
            tailscale-service-type))

(define-record-type* <tailscale-configuration>
  tailscale-configuration make-tailscale-configuration
  tailscale-configuration?
  (tailscale        tailscale-configuration-tailscale
                    (default tailscale))
  (tailscaled       tailscale-configuration-tailscaled
                    (default tailscaled))
  (port             tailscale-configuration-port
                    (default 41641))
  (socket           tailscale-configuration-socket
                    (default "/var/run/tailscale/tailscaled.sock"))
  (log-file         tailscale-configuration-log-file
                    (default "/var/log/tailscaled.log"))
  (state-directory  tailscale-configuration-state-directory
                    (default "/var/lib/tailscale"))
  (verbosity        tailscale-configuration-verbosity
                    (default 0))
  (upload-logs?     tailscale-configuration-upload-logs?
                    (default #f))
  (extra-options    tailscale-configuration-extra-options
                    (default '())))

(define (tailscale-shepherd-service config)
  "Return the Shepherd service for the Tailscale daemon described by CONFIG."
  (let ((daemon (tailscale-configuration-tailscaled config))
        (port (tailscale-configuration-port config))
        (socket (tailscale-configuration-socket config))
        (log-file (tailscale-configuration-log-file config))
        (state-directory (tailscale-configuration-state-directory config))
        (verbosity (tailscale-configuration-verbosity config))
        (upload-logs? (tailscale-configuration-upload-logs? config))
        (extra-options (tailscale-configuration-extra-options config)))
    (list
     (shepherd-service
      (documentation "Run the Tailscale mesh VPN daemon.")
      (provision '(tailscaled))
      (requirement '(user-processes))
      (start
       #~(make-forkexec-constructor
          (list #$(file-append daemon "/bin/tailscaled")
                "-port" #$(number->string port)
                "-socket" #$socket
                "-statedir" #$state-directory
                "-verbose" #$(number->string verbosity)
                #$@(if upload-logs? '() '("-no-logs-no-support"))
                #$@extra-options)
          #:log-file #$log-file))
      (stop #~(make-kill-destructor))))))

(define (tailscale-activation config)
  "Create the daemon's persistent state and runtime socket directories."
  #~(begin
      (use-modules (guix build utils))
      (let ((state #$(tailscale-configuration-state-directory config))
            (socket-directory
             (dirname #$(tailscale-configuration-socket config))))
        (mkdir-p state)
        (chmod state #o700)
        (mkdir-p socket-directory))))

(define (tailscale-profile config)
  "Make both the CLI and daemon available in the system profile."
  (list (tailscale-configuration-tailscale config)
        (tailscale-configuration-tailscaled config)))

(define tailscale-service-type
  (service-type
   (name 'tailscale)
   (description
    "Run @command{tailscaled}, which manages Tailscale WireGuard mesh VPN
connections.  Authenticate the machine after system reconfiguration with
@command{sudo tailscale up}.")
   (extensions
    (list (service-extension shepherd-root-service-type
                             tailscale-shepherd-service)
          (service-extension activation-service-type
                             tailscale-activation)
          (service-extension profile-service-type
                             tailscale-profile)
          (service-extension log-rotation-service-type
                             (compose list
                                      tailscale-configuration-log-file))))
   (default-value (tailscale-configuration))))
