(asdf:defsystem #:myweb
  :serial t
  :components ((:file "package")
	       (:file "log")
	       (:file "util")
	       (:file "web")
	       (:file "handler")))
