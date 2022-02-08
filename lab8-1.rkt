#lang racket
;; Write a function called average that takes  AS MANY ARGUMENTS as the caller wants to give,
;; and returns the average of all those arguments.  For example (average 3 4 5) should return 4,
;; and (average 1 2 3 4 5) should return 3.

;; Notice that the arguments to average are NOT IN A LIST: they are a sequence
;; of individual numbers! Look at the video on variable-arity functions to find out about the
;; alternative form of lambda you need to use to create a function that can take as many arguments
;; as the user want to give. Before you start doing anything: think carefully!
;; Does this function need to be recursive?

;; You will probably need to use the function apply here. A reminder:
;; if L=(1 2 3) then (apply + L) applies + to those 3 numbers in L, returning 6.
;; Also, you might want to use the length function here (this gives the length of a list).

(define average 
    (lambda L
        (/ (apply + L) (length L))
    )
)
