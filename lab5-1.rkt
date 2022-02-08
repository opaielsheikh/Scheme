#lang racket
;; Write a function (flatten L) which will take a list containing some sublists ( pairs or triplets etc.) and
;; returns a list in which every element is at the first level (every every element is there, but there are no sublists).
;; You can assume that L will contain sublists as elements, but those sublists will not contain any more lists (any sub-sublists!)
;; You will need the function (list? L) which returns true if L is a list.
;; A hint: This question involves the use of the built-in function 'append, which takes two lists and
;; joins them together to make a new list.  Test out how append works yourself at the scheme prompt.
;; Another hint: a recursive call (flatten (cdr L)) will return the rest of the list, flattened out.
;; To flatten the full list, you need to deal with the "left over" (car L).
;; If (car L) is a list itself, what do you want to do with it to join it on to the flattened rest of the list?
;; If (car L) is NOT a list, what do you want to do with it to join it on to the flattened rest of the list?
;; The answer to one of these questions involves append.

;; Test: (flatten '( (1 2 3) (a b c)))
;; (1 2 3 a b c)

(define flatten
    (lambda (L)
        (cond ((null? L)                         '()                 )
              ((list? (car L))    (append (car L) (flatten (cdr L))) )
              (     #t            (cons (car L) (flatten (cdr L)))   )
        )
    )
)
