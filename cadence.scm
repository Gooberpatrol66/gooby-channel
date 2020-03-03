(define-module (cadence)
  #:use-module (guix licenses)
  #:use-module (guix packages)
  #:use-module (gnu packages)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system meson)
  #:use-module (guix build-system waf)
  #:use-module (gnu packages audio)
  #:use-module (gnu packages qt)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages pulseaudio)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages python)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages base)
  #:use-module (guix git-download))

(define-public cadence
  (package
    (name "cadence")
    (version "0.9.1")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/falkTX/Cadence.git")
         (commit (string-append "v" version))))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "07z8grnnpkd0nf3y3r6qjlk1jlzrbhdrp9mnhrhhmws54p1bhl20"))))
    (build-system gnu-build-system)
;;    (arguments
;;     `(#:tests? #f                      ; no "check" target
;;       #:make-flags
;;       (list (string-append "PREFIX=" (assoc-ref %outputs "out")))
;;       #:phases
;;       (modify-phases %standard-phases
;;         (add-before 'build 'set-CC-variable-and-show-features
;;           (lambda _
;;             (setenv "CC" "gcc")
;;             (invoke "make" "features")))
;;         (delete 'configure))))
    (inputs
     `(("jack2" ,jack-2)
       ("qtbase" ,qtbase)
       ("python-pyqt" ,python-pyqt)
       ("python-dbus" ,python-dbus)
       ("a2jmidid" ,a2jmidid)
       ("jack_capture" ,jack_capture)
       ("pulseaudio" ,pulseaudio)
       ("ladish" ,ladish)))
;;    (native-inputs
;;     `(("pkg-config" ,pkg-config)))
    (home-page "https://kx.studio/Applications:Cadence")
    (synopsis "Collection of tools useful for audio production")
    (description "Includes Cadence, Cadence-JackMeter, Cadence-JackSettings, Cadence-Logs, Cadence-Render, Cadence-XY Controller, Catarina, Catia, Claudia, Claudia-Launcher")
    (license gpl2)))

(define-public a2jmidid
  (package
    (name "a2jmidid")
    (version "9")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/linuxaudio/a2jmidid.git")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "1x6rcl3f4nklnx4p5jln9a7fpj9y7agjxs9rw7cccmwnski7pnsq"))))
    (build-system meson-build-system)
;;    (arguments
;;     `(#:tests? #f                      ; no "check" target
;;       #:make-flags
;;       (list (string-append "PREFIX=" (assoc-ref %outputs "out")))
;;       #:phases
;;       (modify-phases %standard-phases
;;         (add-before 'build 'set-CC-variable-and-show-features
;;           (lambda _
;;             (setenv "CC" "gcc")
;;             (invoke "make" "features")))
;;         (delete 'configure))))
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("jack2" ,jack-2)
       ("dbus" ,dbus)))
    (native-inputs
     `(("pkg-config" ,pkg-config)))
    (home-page "https://github.com/linuxaudio/a2jmidid")
    (synopsis "ALSA sequencer to JACK MIDI bridging (for jack2)")
    (description "This project aims to ease the usage of legacy, non JACK enabled applications, in a JACK MIDI enabled system, when using jack2.")
    (license gpl2)))

(define-public jack_capture
  (package
    (name "jack_capture")
    (version "0.9.73")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/kmatheussen/jack_capture.git")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0jcqky96q8xgya6wqv1p8pj9fkf2wh7ynl67ah7x5bn3basgfclf"))))
    (build-system gnu-build-system)
    (arguments
;;     `(#:tests? #f                      ; no "check" target
;;       #:make-flags
;;       (list (string-append "PREFIX=" (assoc-ref %outputs "out")))
     `(#:phases
       (modify-phases %standard-phases
;;         (add-before 'build 'set-CC-variable-and-show-features
;;           (lambda _
;;             (setenv "CC" "gcc")
;;             (invoke "make" "features")))
         (delete 'configure))))
    (inputs
     `(("which" ,which)))
;;       ("jack2" ,jack2)
;;       ("dbus" ,dbus)))
;;    (native-inputs
;;     `(("pkg-config" ,pkg-config)))
    (home-page "https://github.com/kmatheussen/jack_capture")
    (synopsis "A program for recording soundfiles with jack")
    (description "Features: human-readable filenames, >4GB wav file splitting, sndfile format support, mp3 support, writing to stdout, console meter, connecting to jack ports, unlimited jack ports, automatic buffers, auto-reniced disk thread, better performance than Ardour, can write 256 channels of 32 bit wave at once to a local hard drive")
    (license gpl2)))

(define-public ladish
  (package
    (name "ladish")
    (version "ladish-1")
    (source
     (origin
       (method git-fetch)
       (uri
        (git-reference
         (url "https://github.com/LADI/ladish.git")
         (commit version)))
       (file-name (git-file-name name version))
       (sha256
        (base32
         "0cmmpz87cs2j15d5jbzffx24gqlgrcq0465k3qx12ai9mbi6lbf0"))))
    (build-system waf-build-system)
;;    (arguments
;;     `(#:tests? #f                      ; no "check" target
;;       #:make-flags
;;       (list (string-append "PREFIX=" (assoc-ref %outputs "out")))
;;       #:phases
;;       (modify-phases %standard-phases
;;         (add-before 'build 'set-CC-variable-and-show-features
;;           (lambda _
;;             (setenv "CC" "gcc")
;;             (invoke "make" "features")))
;;         (delete 'configure))))
    (inputs
     `(("alsa-lib" ,alsa-lib)
       ("jack2" ,jack-2)
       ("dbus" ,dbus)
       ("e2fsprogs" ,e2fsprogs)
       ("expat" ,expat)
       ("python" ,python)
       ("glib" ,glib)
       ("dbus-glib" ,dbus-glib)
       ("gtk+" ,gtk+)))
;;    (native-inputs
;;     `(("pkg-config" ,pkg-config)))
    (home-page "http://ladish.org/")
    (synopsis "LADI Session Handler")
    (description "LADI Session Handler or simply ladish is a session management system for JACK applications on GNU/Linux. Its aim is to allow you to have many different audio programs running at once, to save their setup, close them down and then easily reload the setup at some other time. ladish doesn't deal with any kind of audio or MIDI data itself; it just runs programs, deals with saving/loading (arbitrary) data and connects JACK ports together. It can also be used to move entire sessions between computers, or post sessions on the Internet for download.")
    (license gpl2)))
