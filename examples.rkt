#lang racket
;; If I would rather not use car and cdr, I can just define different words
;; to stand for them:
(define first car)
(define rest cdr)

;; getting all the postive numbers in a list, using first and rest

(define positives
  (lambda (L)
    (cond  (  (null? L)                      '()                           )
           (  (>= (first L) 0)   (cons (first L) (positives (rest L)))     )
           (  (< (first L) 0)                  (positives (rest L))        )
       )
    )
  )




;; write a recursive function that takes in a list of number L
;; and returns the MAXIMUM in that list.  You can assume the list is not empty.

;;What is the simplest input where I can give an answer straight away?
;; suppose I can get the maximum of the smaller list (using this function).
;; how do I get the maximum of the list overall?

(define max
  (lambda (L)
    (cond  (    (null? (cdr L))                  (car L)        )
           (    (> (car L) (max (cdr L)))        (car L)        )
           (     #t                              (max (cdr L))  )
    )
  )
 )




(define myL '( (a b c) (1 2 3 4 5 6) (w x y z) ))

;; take in a list of sublists, and return a list containg the count or size of each
;; sublist
;; for myL we would want to get  (3 5 4)

(define sizeOfSublists
   (lambda (L)
     (cond  (  (null? L)                  '()                                   )
            (  #t       (cons (length (car L))   (sizeOfSublists (cdr L)))      )
     )
   )
 )
