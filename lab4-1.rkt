#lang racket
;; Write a function (removeN N L) that takes a list L and a number N and
;; returns the list L but with the first N elements removed.
;; For example, (removeN 2 '(a b c d) ) should return '(c d).
;; If the number N is greater than the number of elements in the list L,
;; this function should return the empty list; so (removeN 4  '(a b c)) should return '().  
;; The number N may be 0 or may be greater than 0.  It will never be negative.

;; A hint for the stopping condition or base case: for what value of N should this function
;; just return the list L, with no elements removed, and do nothing else?

;; Tests: (removeN 3 '(a b c d e f g))
;; (d e f g)
;; (removeN 5 '(a b c))
;; ()

(define removeN
  (lambda (N L)
    (cond  ((= N 0)                          L           )
           ((> N (length L))                '()          )
           ( #t                (removeN (- N 1) (cdr L)) )
   )
 )
)
