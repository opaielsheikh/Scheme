#lang racket
(define numberTree '( ( 1 ( 2  3)) ( (4 (5 (6)) 7)) 8 ) )

;;   (     @           @    8 )
;;        /            |
;;    ( 1 @  )     (  @  )
;;        |           |
;;     ( 2  3)       ( 4  @   7 )
;;                        |
;;                       ( 5 @ )
;;                           |
;;                          (6)

;; write a function called sumAll that takes a nested list (a Tree)
;; of numbers and adds up all the numbers in that tree.

;; what is the simplest case?
;; try an empty list:  '()
;; What should (sumAll '() ) return?    0
;; what about recursive cases?
;;   What will the recurive call actually look like?
;;   Have to call this function:   (sumAll  ??? )
;;   and the argument must get smaller.
;;   so I'll try                   (sumAll (cdr L))
;;   What will this recursive call give me back (assuming the function works)?
;;   if L is '( ( 1 ( 2  3)) ( (4 (5 (6)) 7)) 8 ), then
;;   (cdr L) = '(  ( (4 (5 (6)) 7)) 8 )
;;    what will (sumAll '(  ( (4 (5 (6)) 7)) 8 )   ) = (+ 4 5 6 7 8) = 30
;;    what do I want as the full answer?  That is, the answer for
;;    (sumAll '( ( 1 ( 2  3)) ( (4 (5 (6)) 7)) 8 )  )?  I want 36 as the full answer
;;    or I want  (sumAll '(  ( (4 (5 (6)) 7)) 8 )    + the sum of all the numbers
;;    in  this list '( 1 ( 2  3)); or another way of saying it is
;;   I want (sumAll (cdr L)) + the sum of all the numbers in (car L)
;;   Ok, in this case the recursive call is going to be
;;                                   (+  (sumAll (car L))  (sumAll (cdr L)) )


(define sumAll
  (lambda ( L )
    (cond   [   (null? L)                        0                           ] 
            [   (list? (car L))   (+  (sumAll (car L))  (sumAll (cdr L)) )   ]
            [    #t               (+   (car L)  (sumAll (cdr L)) )           ]  
)))

(define myPair (cons 2 3))

;;  Write a function countAll that take two arguments: an element A
;; and a nested list (a tree) L, and returns the number of times A occurs
;; anywhere in that list

(define aTree '( x (y 1 (x) 2) (r  f ( t ( v (x))) x)) )

;; (countAll 'x aTree)  -> 4


(define countAll
   (lambda (A L)
      (cond   [   (null? L)                        0                                  ]
              [   (equal? (car L) A) (+ 1 (countAll A (cdr L)))                       ]
              [   (list? (car L))    (+ (countAll A (car L)) (countAll A (cdr L)))    ]
              [     #t               (countAll A (cdr L))                             ]
)))
