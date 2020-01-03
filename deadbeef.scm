(define-module (deadbeef)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages autotools)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages web)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xiph)
  #:use-module (gnu packages curl)
  #:use-module (gnu packages image)
  #:use-module (gnu packages mp3)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages cdrom)
  #:use-module (gnu packages video)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages compression)
  #:use-module (gnu packages assembly)
  #:use-module (gnu packages xml))
  
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
   (arguments
    `(#:tests? #f))
   (native-inputs
   `(("gettext" ,gettext-minimal)
	 ("automake" ,automake)
	 ("autoconf" ,autoconf)
	 ("libtool" ,libtool)
	 ("intltool" ,intltool)
	 ("pkg-config" ,pkg-config)))
   (inputs
   `(("jansson" ,jansson)
     ("libsamplerate" ,libsamplerate)
;;needs >3.10
     ("gtk+" ,gtk+)
;;needs >2.16
;;     ("gtk+" ,gtk+-2)
     ("glib" ,glib)
     ("alsa-lib" ,alsa-lib)
     ("libvorbis" ,libvorbis)
     ("libogg" ,libogg)
;;needs >7.10
     ("curl" ,curl)
     ("imlib2" ,imlib2)
;;     ("libjpeg" ,libjpeg)
;;     ("libpng" ,libpng)
     ("libmad" ,libmad)
     ("mpg123" ,mpg123)
     ("flac" ,flac)
     ("wavpack" ,wavpack)
     ("libsndfile" ,libsndfile)
     ("libcdio" ,libcdio)
     ("libdccb" ,libcddb)
     ("ffmpeg" ,ffmpeg)
     ("libx11" ,libx11)
     ("dbus" ,dbus)
     ("pulseaudio" ,pulseaudio)
     ("faad2" ,faad2)
     ("zlib" ,zlib)
     ("libzip" ,libzip)
     ("yasm" ,yasm)))
   (synopsis "A music player for *nix-like systems and OS X")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://deadbeef.sourceforge.io/")
   (license gpl2)))

(define-public deadbeef-archive-reader
 (package
   (name "deadbeef-archive-reader")
   (version "1.8.2")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/DeaDBeeF-Player/deadbeef/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "1wsx62gi1bfd9rx5br2gprq4q3sfp7iqj1inxhhiqjasbm85vg50"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)))
   (synopsis "DeaDBeeF vfs archive reader plugin with gzip, 7z and rar support")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://www.assembla.com/spaces/deadbeef_vfs_archive_reader")
   (license lgpl2.1)))
   
(define-public deadbeef-bookmark-manager
 (package
   (name "deadbeef-bookmark-manager")
   (version "44b067c30d6301c2eca6e91159b6267fa847d850")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/cboxdoerfer/ddb_bookmark_manager/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "1f3i0717z0xzbmn9cmisixy22rsasp5rykdh0y36p2wrjxmvd3fk"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)))
   (synopsis "DeaDBeeF vfs archive reader plugin with gzip, 7z and rar support")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/cboxdoerfer/ddb_bookmark_manager")
   (license gpl2)))
   
(define-public deadbeef-bs2b
 (package
   (name "deadbeef-bs2b")
   (version "a1961cd2f0686a7bdf0915f1fc7d62b5aba369bd")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/Alexey-Yakovenko/bs2b/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "0qrlbbv1wwfj9a4jnbjwg6cvbvfflsbzdwf31acwhr08n03id7kw"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("libbs2b" ,libbs2b)))
   (synopsis "DeaDBeeF bs2b dsp plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/Alexey-Yakovenko/bs2b")
   (license expat))) 
   
(define-public deadbeef-decast
 (package
   (name "deadbeef-decast")
   (version "9ffd6d6dfb14")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://bitbucket.org/thesame/decast/get/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "18g1k5ikyjqpypyqxz86m9sjcm0car2fwhzz58vdm20yf4x491ad"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("gtk+" ,gtk+)
;;     ("gtk+" ,gtk+-2)
     ("libxml2" ,libxml2)))
   (synopsis "DeaDBeeF podcast subscription plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://bitbucket.org/thesame/decast")
   (license zlib))) 
   
(define-public deadbeef-fb
 (package
   (name "deadbeef-fb")
   (version "47bc3fe0fe151dfbb75f90f9e4d5e9a7affd280a")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://gitlab.com/zykure/deadbeef-fb/repository/archive.tar.gz?ref=" version
                                 ))
             (sha256
              (base32
               "17gb1bhp4jzqgqv0yda40px4rigq75valhixmsfw0mkldl2910yv"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("gtk+" ,gtk+)
;;     ("gtk+" ,gtk+-2)
     ("deadbeef-librarybrowser" ,deadbeef-librarybrowser)))
   (synopsis "DeaDBeeF filebrowser plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://gitlab.com/zykure/deadbeef-fb")
   (license gpl2))) 
   
(define-public deadbeef-gnome-mmkeys
 (package
   (name "deadbeef-gnome-mmkeys")
   (version "8e95cd380ba457fe6b666e5e704aa823d5eca1fa")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/barthez/deadbeef-gnome-mmkeys/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "0bq4d1j4q3j2j257lm9i7r1n83jna2h24msxn4wcldyliw2q602c"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("dbus" ,dbus)))
   (synopsis "DeaDBeeF gnome (via dbus) multimedia keys plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/barthez/deadbeef-gnome-mmkeys")
   (license gpl2))) 
   
