#lang racket
;; Write a function called power that takes AS MANY ARGUMENTS as the caller wants
;; to give, and returns the first number to the power of (the second number to the
;; power of (the third number ...))).  For example (power 4 3 2) should return 4 to
;; the power of (3 to the power of 2) = 4^(3^2)=4^9= 262144.

;; You can use the built-in function (expt A B) here, which gives
;; A^B; so (expt 3 2) returns 9, for example.

;; Your function power will need to be  recursive.
;; The base case is when THE USER GIVES NO ARGUMENTS! 
;; The answer for this base case is 1;  that is, the base case is (power)=1
;; (a little surprisingly, this is mathematically correct: nothing to the power of nothing is equal to 1!).

;; As well as being recursive, you will probably need to use apply again here,
;; to apply your power function recursively to the smaller list of arguments used
;; in the recursion.

(define power
    (lambda L
        (cond ((null? L)                 1                       )
              ( #t          (expt (car L) (apply power (cdr L))) )
                     
        )
    )
)
