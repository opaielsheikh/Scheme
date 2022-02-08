#lang racket
;; Write a function (removeFirst A L) which takes an element A and a list L and returns a list 
;; equal to L with the first occurrence of A removed. Your function must be recursive.
;; Make sure your function returns ALL of the list L except for the first occurrence of A.
;; Note that this function will have 2 stopping conditions and one recursive condition.  
;; Start out by trying some examples on paper and working out the stopping and recursive conditions.
;; Useful examples are: some element and an empty list, a non empty list that starts with A, a non empty list that doesn't start with A.

;; Test: (removeFirst 'c '(a b c d c b a))
;; (a b d c b a)
;; (removeFirst 1 '(2 1 1 2))
;; (2 1 2)

(define removeFirst 
    (lambda (A L)
        (cond ((null? L)                          '()                 )
              ((equal? A (car L))              (cdr L)                )
              (#t                (cons(car L)(removeFirst A (cdr L))) )
        )
    )
)
