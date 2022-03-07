(in-package :cl-user)


(quicklisp:quickload "swank")
(quicklisp:quickload "usocket")
(quicklisp:quickload "bordeaux-threads")
(quicklisp:quickload "trivial-utf-8")
(quicklisp:quickload "cl-log")
(quicklisp:quickload "local-time")


(pushnew '*default-pathname-defaults* asdf:*central-registry*)
(asdf:load-system 'myweb)


(swank:create-server)
