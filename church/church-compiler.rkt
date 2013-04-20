#lang racket

(provide main)

(require 
 (only-in  "compiler.rkt" compile))

;; get filename from command line
;; read source code from file
;; read source code from external-defs file
;; call compile on code + external-defs code
;; write to filename-church.sc

(define (read-source pathname)
  (call-with-input-file pathname
    (lambda (port)
      (let loop ((forms '()))
        (let ((form (read port)))
          (if (eof-object? form)
              (reverse forms)
              (loop (cons form forms))))))))

(define (write-object objects pathname pretty)
  (call-with-output-file pathname
    (lambda (port)
      (for-each
       (lambda (o) ((if pretty pretty-display write) o port))
       objects))))

(define (empty-string? s)
  (equal? s ""))

(define (string->bool s)
  (cond [(equal? s "T") #t]
        [(equal? s "F") #f]
        [else (error s "string->bool: can't convert string to bool")]))

;; could be more forgiving here
(define (parse-args args)
  (let ([in (first args)]
        [out (second args)]
        [ext (third args)]
        [pretty (string->bool (fourth args))])
    (values in out ext pretty)))

(define (main in out ext pretty)
  (let ([ext-source (if (empty-string? ext) '() (read-source ext))])
    (write-object (compile (read-source in) ext-source) out pretty)))
