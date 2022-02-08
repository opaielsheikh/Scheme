#lang racket
;; Write a function (removeTop A L) that removes EVERY occurrence of A at the top level of the list L.
;; Your function must be recursive, and will have one stopping condition and two recursive conditions.
;; Your function does not need to remove occurrences of A that are inside sublists of L:
;; only occurences of A that are at the 'top level' need to be removed.

;; Test: (removeTop 'a '(a b a c a (a a a)))
;; (b c (a a a))
;; (removeTop 1 '(1 2 1 3 1 4 1))
;; (2 3 4)

(define removeTop 
    (lambda (A L)
        (cond ((null? L)           '()                              )
              ((equal? A (car L))   (removeTop A (cdr L))           )
              ( #t              (cons(car L) (removeTop A (cdr L))) )
        )
    )
)
