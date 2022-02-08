#lang racket
;; Write a recursive function (consToAll A L) that takes two arguments:an element A and a list L, and conses A to every element in L.
;; If L is empty (null? L), consToAll returns an empty list.
;; If L is, for example, '(  (1) (2) (3) ) then (consToAll 'a L) returns '( (a 1) (a 2) (a 3) ).


(define consToAll(lambda(A L)
        (cond ((null? L)                             '()                          )
              (#t                    (cons(cons A (car L)) (consToAll A (cdr L))) )
)))
