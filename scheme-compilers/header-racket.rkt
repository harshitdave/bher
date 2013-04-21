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
;;(define set-car! #f)
;;(define set-cdr! #f)
(define gce '())
(define implemented 'implemented)
(define current-date current-milliseconds)
(define lnfact 'lnfact)
(define scheme-gensym gensym)
(define (random-integer n)(random n))
(define random-real random)
(define (sample-dirichlet) 'sample-dirichlet)
(define (sample-gaussian) 'sample-gaussian)
(define (gaussian-lnpdf) 'gaussian-lnpdf)
(define (dirichlet-lnpdf) 'dirichlet-lnpdf)
(define (discrete-sampler) 'discrete-sampler)
(define (discrete-pdf) 'discrete-pdf)

(define (randomize-rng) (random-seed (modulo (current-milliseconds) 2147483647)))
