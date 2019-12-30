(define-module (deadbeef)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages autotools))
  
(define-public deadbeef
 (package
   (name "deadbeef")
   (version "1.8.2")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/DeaDBeeF-Player/deadbeef/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "1wsx62gi1bfd9rx5br2gprq4q3sfp7iqj1inxhhiqjasbm85vg50"))))
   (build-system gnu-build-system)
   (native-inputs
   `(("gettext" ,gettext-minimal)
	("autotools" ,autotools)))
   (synopsis "A music player for *nix-like systems and OS X")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://deadbeef.sourceforge.io/")
   (license gpl2)))
