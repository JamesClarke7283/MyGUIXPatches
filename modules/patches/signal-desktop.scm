;;; -*- mode: scheme; -*-
;;;
;;; Signal Desktop, updated from Guix's Electron package recipe.
;;;

(define-module (patches signal-desktop)
  #:use-module (guix base32)
  #:use-module (guix packages))

(define-public signal-desktop
  (package
    (inherit (@@ (nongnu packages messaging) signal-desktop))
    (name "signal-desktop")
    (version "8.35.0")
    (source
     (origin
       (inherit (package-source (@@ (nongnu packages messaging) signal-desktop)))
       (uri
        (string-append
         "https://updates.signal.org/desktop/apt/pool/s/" name "/" name "_" version
         "_amd64.deb"))
       (sha256
        (base32 "1lxl6bwvsc9mbp7k97in226w7d82r45466794mdzjjac78vb0218"))))))
