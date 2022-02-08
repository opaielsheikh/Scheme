#lang racket
;; Write a function (removeAll A L) that removes All occurrences of element A in the list L,
;; even occurrences within sublists of L.  You can assume that the element A is never going to be a list itself.

;; Test: (removeAll 'a '(a b a c (a a b) a d))
;; (b c (b) d)
;; (removeAll 1 '(1 (1 2) (1 2 3)))
;; ((2) (2 3))

(define removeAll 
    (lambda (A L)
        (cond ((null? L)                            '()                                    )
              ((equal? A (car L))            (removeAll A (cdr L))                         )
              ((list? (car L))           (cons(removeAll A (car L)) (removeAll A (cdr L))) )
              (#t                        (cons(car L)(removeAll A (cdr L)))                )    
        )
    )
)
