(in-package :cl-user)


(defpackage :myweb ; содержит функции для запуска и остановки веб-сервера
  (:use :cl :usocket :bordeaux-threads)
  (:export :start-http :stop-http :list-workers :list-requests))


(defpackage :myweb.util ; содержит функции, помогающие обрабатывать запросы
  (:use :cl :local-time)
  (:export :parse-request :read-utf-8-string :response-write :get-param :get-header :http-response
	   :file-response :html-template :log-info :log-warning :log-error))


(defpackage :myweb.handler ; содержит код обработки запроса
  (:use :cl)
  (:export :process-request))
