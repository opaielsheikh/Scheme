#lang racket
;; Write a recursive function called 'product' that takes a list of numbers L and multiplies all numbers in that list together. 
;; For example,
;; (product '(1 2 3)) should give 6. Your function has to be recursive! 

;; I know you can easily multiply all the numbers in the list by just applying "*" to the list; e.g. (* 1 2 3). Don't do that. Remember to plan your function by 
;; (1) thinking about the simple case, and 
;; (2) thinking about how the answers for a complex case can be produced from the answer for a simpler case.

;; A hint: a list L is empty if the boolean test (null? L) returns true; if (null? L) returns false, the list is not empty. 

;; A weird but true mathematical fact: if you multiply together 'all' the numbers in an empty list, the result of that multiplication is always 1. 
;; (This is called the 'empty product': look it up online).

;; Test: (product '(1 2 3)) 6

(define product
    (lambda  (L)
        (cond  ( (null?  L)               1         ) 
               (    #t      (* (car L) (product (cdr L) )))
        )
    )
)
