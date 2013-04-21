
;;seed the random number generator
(randomize-rng)

(displayln (church-main '(top) (make-empty-store)))
;;done