(define-module (deadbeef)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix download)
  #:use-module (guix svn-download)
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
  #:use-module (gnu packages xml)
  #:use-module (gnu packages algebra)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages sqlite))
  
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
;;gtk3 plugin doesn't compile
;;     ("gtk+3" ,gtk+)
;;needs >2.16
     ("gtk+2" ,gtk+-2)
     ("glib" ,glib)
     ("alsa-lib" ,alsa-lib)
     ("libvorbis" ,libvorbis)
     ("libogg" ,libogg)
     ("opusfile" ,opusfile)
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
   (version "19")
   (source (origin
             (method svn-fetch)
             (uri (svn-reference
                   (url "https://subversion.assembla.com/svn/deadbeef_vfs_archive_reader/trunk/src")
                   (revision (string->number version))))
             (sha256
              (base32
               "1sl3xrrv4chv70yxw70bacch4afp52n28m8rdqfp3nc7fpd6ryrh"))
             (patches (search-patches "fix-blargg_ok-declaration.patch" "fix-install-dir.patch"))))
   (build-system gnu-build-system)
   (arguments
   `(#:phases
     (modify-phases %standard-phases
;;      (add-before 'build 'break (lambda () (#f)))
      (delete 'configure))
     #:make-flags (list "CC=gcc")
     #:tests? #f))
   (inputs
   `(("deadbeef" ,deadbeef)
     ("zlib" ,zlib)))
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
   
;; disabled; circular dependency on librarybrowser
;;(define-public deadbeef-fb
;; (package
;;   (name "deadbeef-fb")
;;   (version "47bc3fe0fe151dfbb75f90f9e4d5e9a7affd280a")
;;   (source (origin
;;             (method url-fetch)
;;             (uri (string-append "https://gitlab.com/zykure/deadbeef-fb/repository/archive.tar.gz?ref=" version
;;                                 ))
;;             (sha256
;;              (base32
;;               "17gb1bhp4jzqgqv0yda40px4rigq75valhixmsfw0mkldl2910yv"))))
;;   (build-system gnu-build-system)
;;   (inputs
;;   `(("deadbeef" ,deadbeef)
;;     ("gtk+" ,gtk+)
;;;;     ("gtk+" ,gtk+-2)
;;     ("deadbeef-librarybrowser" ,deadbeef-librarybrowser)))
;;   (synopsis "DeaDBeeF filebrowser plugin")
;;   (description
;;    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
;;serves as an example of standard GNU coding practices.  As such, it supports
;;command-line arguments, multiple languages, and so on.")
;;   (home-page "https://gitlab.com/zykure/deadbeef-fb")
;;   (license gpl2))) 
   
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
   
(define-public deadbeef-infobar
 (package
   (name "deadbeef-infobar")
   (version "1.4")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://bitbucket.org/dsimbiriatin/deadbeef-infobar/downloads/deadbeef-infobar-" version
                                 ".tar.gz"))
             (sha256
              (base32
               "0c9wh3wh1hdww7v96i8cy797la06mylhfi0880k8vwh88079aapf"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("libxml2" ,libxml2)
     ("gdk-pixbuf" ,gdk-pixbuf)))
   (synopsis "DeaDBeeF infobar plugin that shows lyrics and artist's biography")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://bitbucket.org/dsimbiriatin/deadbeef-infobar")
   (license gpl2))) 
   
(define-public deadbeef-jack
 (package
   (name "deadbeef-jack")
   (version "62d1e6ac0452b7baa92fcc75b59bcb960df06da8")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/Alexey-Yakovenko/jack/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "17010bwa3pxznznv9bp8pxzibrmbnbr2ppz6wz4i92p98186cyx1"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("jack2" ,jack-2)))
   (synopsis "DeaDBeeF jack output plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/Alexey-Yakovenko/jack")
   (license expat))) 

;; disabled; circular dependency on fb
;;(define-public deadbeef-librarybrowser
;; (package
;;   (name "deadbeef-librarybrowser")
;;   (version "68e1a92339be65cbeda09304e74f1744ff1c127d")
;;   (source (origin
;;             (method url-fetch)
;;             (uri (string-append "https://github.com/JesseFarebro/deadbeef-librarybrowser/archive/" version
;;                                 ".tar.gz"))
;;             (sha256
;;              (base32
;;               "1q9cygay6ss7ci1mw5j2sy74984bvljahysgqikk52g8g82103lf"))))
;;   (build-system gnu-build-system)
;;   (inputs
;;   `(("deadbeef" ,deadbeef)
;;     ("gtk+" ,gtk+)
;;;;     ("gtk+" ,gtk+-2)
;;     ("deadbeef-fb" ,deadbeef-fb)))
;;   (synopsis "DeaDBeeF filebrowser plugin that resembles foobar2k music library")
;;   (description
;;    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
;;serves as an example of standard GNU coding practices.  As such, it supports
;;command-line arguments, multiple languages, and so on.")
;;   (home-page "https://github.com/JesseFarebro/deadbeef-librarybrowser")
;;   (license gpl2))) 
   
(define-public deadbeef-mpris
 (package
   (name "deadbeef-mpris")
   (version "1.9")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/Serranya/deadbeef-mpris2-plugin/releases/download/v" version "/deadbeef-mpris2-plugin-" version
                                 ".tar.xz"))
             (sha256
              (base32
               "1j9czga0fyns75lk0q64vcbb1v0987334060r99yzsb6bpr6kdm8"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)))
   (synopsis "DeaDBeeF MPRIS plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/Serranya/deadbeef-mpris2-plugin")
   (license gpl3))) 
   
(define-public deadbeef-musical-spectrum
 (package
   (name "deadbeef-musical-spectrum")
   (version "215bbad824b1ecf291083026f6b2a2bdbee1101b")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/cboxdoerfer/ddb_musical_spectrum/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "1qbgfalzqj05k34r4qjw9mhn18cv34zkqcp3aspsjkn514xvka7b"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("gtk+" ,gtk+)
;;     ("gtk+" ,gtk+-2)
     ("fftw" ,fftw)))
   (synopsis "DeaDBeeF musical spectrum plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/cboxdoerfer/ddb_musical_spectrum")
   (license gpl2))) 
   
;;redundant, with builtin opus support?
(define-public deadbeef-opus
 (package
   (name "deadbeef-opus")
   (version "0.6")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://bitbucket.org/Lithopsian/deadbeef-opus/downloads/opus-" version
                                 ".tar.gz"))
             (sha256
              (base32
               "13dbd8ch4l5mhfszp8njvpv3w13m30809gphjgxmrymy2yvwvk8p"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("opusfile" ,opusfile)
     ("libogg" ,libogg)))
   (synopsis "DeaDBeeF ogg opus decoder plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://bitbucket.org/Lithopsian/deadbeef-opus")
   (license gpl2))) 
   
(define-public deadbeef-plugins-meta
 (package
   (name "deadbeef-plugins-meta")
   (version "0")
   (source #f)
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("deadbeef-archive-reader" ,deadbeef-archive-reader)
     ("deadbeef-bs2b" ,deadbeef-bs2b)
     ("deadbeef-decast" ,deadbeef-decast)
;;     ("deadbeef-fb" ,deadbeef-fb)
     ("deadbeef-gnome-mmkeys" ,deadbeef-gnome-mmkeys)
     ("deadbeef-infobar" ,deadbeef-infobar)
     ("deadbeef-jack" ,deadbeef-jack)
;;     ("deadbeef-librarybrowser" ,deadbeef-librarybrowser)
     ("deadbeef-mpris" ,deadbeef-mpris)
     ("deadbeef-musical-spectrum" ,deadbeef-musical-spectrum)
     ("deadbeef-opus" ,deadbeef-opus)
     ("deadbeef-quick-search" ,deadbeef-quick-search)
     ("deadbeef-replaygain-control" ,deadbeef-replaygain-control)
     ("deadbeef-soxr" ,deadbeef-soxr)
     ("deadbeef-spectrogram" ,deadbeef-spectrogram)
     ("deadbeef-statusnotifier" ,deadbeef-statusnotifier)
     ("deadbeef-stereo-widener" ,deadbeef-stereo-widener)
     ("deadbeef-vk" ,deadbeef-vk)
     ("deadbeef-vu-meter" ,deadbeef-vu-meter)
     ("deadbeef-waveform-seekbar" ,deadbeef-waveform-seekbar)))
   (synopsis "Meta package for DeaDBeeF player third party plugins")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page #f)
   (license gpl2))) 
   
(define-public deadbeef-quick-search
 (package
   (name "deadbeef-quick-search")
   (version "f1fc79733c8e488259ccf168bcf5b1445b71975c")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/cboxdoerfer/ddb_quick_search/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "19mkcvqyidlfvm554l6iw3zp9nfism46nr1rsvk1a35rpfajpad1"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("gtk+" ,gtk+)))
;;     ("gtk+" ,gtk+-2)))
   (synopsis "DeaDBeeF quick search plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/cboxdoerfer/ddb_quick_search")
   (license gpl2))) 
   
(define-public deadbeef-replaygain-control
 (package
   (name "deadbeef-replaygain-control")
   (version "c0788d47e5bcc2428c57fe4321566891c4abe452")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/cboxdoerfer/ddb_replaygain_control/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "1kyvnb5w38qq88c0hxkrg6mkasbcpns20n65z5ywbilp8w5gjp75"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("gtk+" ,gtk+)))
;;     ("gtk+" ,gtk+-2)))
   (synopsis "DeaDBeeF replay gain control plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/cboxdoerfer/ddb_replaygain_control")
   (license gpl2))) 
   
(define-public deadbeef-soxr
 (package
   (name "deadbeef-soxr")
   (version "103341b7388d38110181494bb9763daa9dafa63e")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/silentlexx/deadbeef_soxr/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "0zwgd2rqkscbmjm4i1b899j7zh7p7byvwdrxpmy6rd75zdcvlcpr"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("soxr" ,soxr)))
   (synopsis "DeaDBeeF sox resampler plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/silentlexx/deadbeef_soxr")
   (license gpl2))) 
   
(define-public deadbeef-spectrogram
 (package
   (name "deadbeef-spectrogram")
   (version "8d1b3713f3a3a8a93b4934a4782fb3db7f744fb7")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/cboxdoerfer/ddb_spectrogram/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "1whi1zj64jby7bkdrsj4rrwg0mkgx1z3kqk97w5s2rj6k5nkbdkx"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("fftw" ,fftw)))
   (synopsis "DeaDBeeF spectrogram plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/cboxdoerfer/ddb_spectrogram")
   (license gpl2))) 
   
(define-public deadbeef-statusnotifier
 (package
   (name "deadbeef-statusnotifier")
   (version "1.2")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/vovochka404/deadbeef-statusnotifier-plugin/archive/v" version
                                 ".tar.gz"))
             (sha256
              (base32
               "0vjimsqwshi1qb9pjzbgpr1ll9ydg2k19glkmrw25ry0smxw01l3"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("libdbusmenu" ,libdbusmenu)))
   (synopsis "DeaDBeeF plasma5 tray icon plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/vovochka404/deadbeef-statusnotifier-plugin")
   (license gpl2))) 
   
(define-public deadbeef-stereo-widener
 (package
   (name "deadbeef-stereo-widener")
   (version "d3990d772b02cdc6206f067748f5d1f9650616fb")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/Alexey-Yakovenko/stereo-widener/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "105pcm7pymcb11g2q434rrqzvfp3a5k8m3l02rg3ialjsjjvha3y"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)))
   (synopsis "DeaDBeeF simple stereo widener plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/Alexey-Yakovenko/stereo-widener")
   (license expat))) 
   
(define-public deadbeef-vk
 (package
   (name "deadbeef-vk")
   (version "0.2.2")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/scorpp/db-vk/archive/v" version
                                 ".tar.gz"))
             (sha256
              (base32
               "1yi7dh3spm03aq2zr23a4zdvfns9zpvx83s3qwpay957k2618q7q"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("gtk+" ,gtk+)
;;     ("gtk+" ,gtk+-2)))
     ("json-glib" ,json-glib)))
   (synopsis "DeaDBeeF plugin for listening music from vkontakte.com")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/scorpp/db-vk")
   (license gpl2))) 
   
(define-public deadbeef-vu-meter
 (package
   (name "deadbeef-vu-meter")
   (version "940d8d72a46993619c3fba4cde5e30c95f5a4b82")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/cboxdoerfer/ddb_vu_meter/archive/" version
                                 ".tar.gz"))
             (sha256
              (base32
               "0659ysi14s5b81bqhkas3sjdbmnnfk7w7xzrxsyanvffmxvvfz3v"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("gtk+" ,gtk+)))
;;     ("gtk+" ,gtk+-2)))
   (synopsis "DeaDBeeF vu meter plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/cboxdoerfer/ddb_vu_meter")
   (license gpl2))) 
   
(define-public deadbeef-waveform-seekbar
 (package
   (name "deadbeef-waveform-seekbar")
   (version "0.5")
   (source (origin
             (method url-fetch)
             (uri (string-append "https://github.com/cboxdoerfer/ddb_waveform_seekbar/archive/v" version
                                 ".tar.gz"))
             (sha256
              (base32
               "1pc50b793f1kc6558igffi16npf3iswm7wcbzr8q9r1bglk4dkbf"))))
   (build-system gnu-build-system)
   (inputs
   `(("deadbeef" ,deadbeef)
     ("gtk+" ,gtk+)
     ("sqlite" ,sqlite)))
;;     ("gtk+" ,gtk+-2)))
   (synopsis "DeaDBeeF waveform seekbar plugin")
   (description
    "GNU Hello prints the message \"Hello, world!\" and then exits.  It
serves as an example of standard GNU coding practices.  As such, it supports
command-line arguments, multiple languages, and so on.")
   (home-page "https://github.com/cboxdoerfer/ddb_waveform_seekbar")
   (license gpl2))) 
