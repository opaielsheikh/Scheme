#lang racket
;; Write a recursive function (positions N A L) which takes an element A and a list L and
;; returns a list of numbers identifying the positions at which A occurs in the list L.
;; The argument N to this function identifies the number that should be given to the very first element in the list.
;; A hint: both N and L will need to change on the recursive call.

;; Test: (positions 0 'a '(a b a a c))
;; (0 2 3)
;; (positions 1 'a '(a b b a))
;; (1 4)

(define positions
    (lambda (N A L)
        (cond ((null? L)                            '()              )
              ((equal? A (car L))       (cons N (positions (+ 1 N) A (cdr L))) )
              (#t                       (positions (+ 1 N) A (cdr L)) )
        )
    )
)
