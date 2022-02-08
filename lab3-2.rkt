#lang racket
;; For a list L, (car L) gives the first element in the list, (car (cdr L)) gives the second element in the list
;; (because (cdr L) is the list with the first element removed), (car (cdr (cdr L))) gives the third element in the list, and so on.

;; Using these expressions is annoying.  To replace them, write a recursive function (getElement N L)
;; that takes a number N and a list L and returns the Nth element in the list L. Here are some examples of (getElement N L):

;; >(getElement 1 '(a b c))
;; a
;; >(getElement 2 '(a b c))
;; b 
;; You shouldn't need to use (car (cdr L)) or anything like that in your function: (car L) and (cdr L) are all you need.

;; In writing your function, you can assume that N will always be 1 or greater, and that N will never be greater than the number of elements in the list.   

;; Some hints to consider:

 ;; (getElement 2 '(a b c)) gives the same answer as (getElement 1 '(b c)).   

;; You can change both arguments in the recursive call, if you like (you can do anything you like!!)

;; The base case or stopping condition for a question like this happens, not when the list L is empty, but when the number N is equal to <what?>

;; Test: (getElement 3 '(a b c d e)) c

(define getElement 
    (lambda (N L)
        (cond ( (= N 1)                (car L)       )   
              (   #t    (getElement (- N 1) (cdr L)) )
        )
    )
)
