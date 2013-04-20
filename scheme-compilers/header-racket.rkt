#lang racket
(require 
 (only-in srfi/1 iota fold)
 (only-in "church/trie.rkt"
          make-empty-trie trie-empty? trie-insert 
	  trie-pop trie-size trie->alist alist->trie)
 (only-in "church/AD.rkt" 
          xy-gradient-R tape?
          make-tapifier untapify))

;;for score gradients:
(define (*with-score-gradient*) #f)
(define tapify (make-tapifier))
(define (min a b) (if (< a b) a b)) ;;FIXME: proper dmin?
(define (continuous? x) (and (real? x) (not (fixnum? x))))

;; Fake out
(define set-car! #f)
(define set-cdr! #f)
(define warning #f)
(define gce '())
(define implemented #f)
(define current-date current-milliseconds)
(define lnfact #t)
(define scheme-gensym gensym)
(define (random-integer)(random 100))
(define (random-real) 0.5)
(define (sample-dirichlet) 0.4)
(define (sample-gaussian) 0.2)
(define (gaussian-lnpdf) 0.5)
(define (dirichlet-lnpdf) 0.2)
(define (discrete-sampler) 0.1)
(define (discrete-pdf) 0.2)

(define (randomize-rng) (random-seed (modulo (current-milliseconds) 2147483647)))
