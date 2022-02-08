#lang racket
;; the function "chain" will take some arguments 
;; (each function call will take only one arg)
;; and after series of other functions, 
;; will return a final result.
;; the base condition needs to checks if the list
;; only has one element: (null? (cdr L))  (car L) 
;; and returns the first element.
;; second condition is the recursive:
;; #t     ( (car L) (apply chain (cdr L)))

(define chain
    (lambda L
        (cond ((null? (cdr L))                  (car L)               )
              (#t                 ((car L) (apply chain (cdr L)))     )
)))
