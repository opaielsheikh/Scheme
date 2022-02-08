#lang racket

;; the function will take a list and will return
;; how many times an element occurred twice in a row.
;; the function should return:
;; 3 for '(a b b c d d c c)
;; 4 for '(a b b b c d d c c)
;; 5 for '(a a a a a a b)
;; need to have a recursive call in the function that 
;; collects the number of times for each reoccurance.
;; base cases will involve:
;; 1. the case when L is empty: 
;;  ((null? L)    0       )
;; 2. the case when the list only has one element: 
;; ((= (length L) 1)   0   )
;; another case is when the function finds a 
;; reoccurance after the first element: 
;; with the recursion, the condiiton continues to
;; check for element for element with cadr L
;; ((equal? (car L) (cadr L))   (+ 1 (countConsecutive(cdr L))))
;; last condition is the recursive.



                  
(define countConsecutive
  (lambda (L)
    (cond ( (null? L)                               '()      )
          ( (eq? (length L) 1)                       0       )
          ( (eq? (car L) (cadr L))        (+ 1 (countConsecutive(cdr L))))
          ( #t                             (countConsecutive(cdr L)))
)))
       
                     
