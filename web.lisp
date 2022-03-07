(in-package :myweb)

; Объявление сокетов и переменных для mutex-ов

(defvar *listen-socket* nil)
(defvar *listen-thread* nil)


(defvar *request-mutex* (make-lock "request-mutex"))
(defvar *request-threads* (list))


(defvar *worker-mutex* (make-lock "worker-mutex"))
(defvar *workers* (list))
(defvar *worker-num* 0)
(defvar *idle-workers* (list))
(defvar *idle-workers-num* 0)
(defvar *request-queue* (list))

; Для принятия и распределения запросов по потокам будем использовать отдельный поток, указатель на который будет храниться в *listen-thread*.
; Это функция для запуска потока-распределителя, который будет вызывать функцию http-acceptor. Также два ключа: worker-limit - максимальное
; количество worker-ов и idle-workers - количество idle worker-ов.

(defun start-http (host port &key (worker-limit 10) (idle-workers 1))
  (if (not *listen-socker*)
      (setq *listen-thread*
	    (make-thread (lambda () (http-acceptor host port worker-limit idle-workers)) :name "socket-acceptor"))
      "HTTP server already started."))



