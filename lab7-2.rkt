#lang racket
;; The 'power set' of a set S is the list of all subsets of S (including the empty set, and the set S itself).
;; If we take a list '(a b) to represent a set, then (powerset '(a b) ) is the list  '( () (b) (a) (a b) ).
;; (strictly speaking,  any other ordering of this list is also the powerset: but for this question only this ordering is correct).

;; In this exercise, you must write a recursive function (powerset L) that gets the power set of a list L.
;; For L='(a b), the function should return the list  '( () (b) (a) (a b) ).

;; VERY IMPORTANT: Think about this problem, read and understand the hints, and plan your algorithm, before you begin writing any code!!!
;; A hint: (powerset '() ) is ' ( () ), because the list of all subsets of the empty list '() (including itself), is simply a list  containing '() as its only element.
;; Another hint: notice that the smaller recursive call (powerset '(b) ), gives us back '( () (b) ).
;; Also notice that (powerset '(a b)) is made up of   '( () (b) )  [which is (powerset '(b)) ]
;; appended to the list  '( (a) (a b) )  [appending   '( () (b) ) to  '( (a) (a b) ) gives  '( () (b) (a) (a b) ), which is the list we want].
;; How can you make the second part of the powerset list:  '( (a) (a b) )?
;; Think of using your function consToAll from question 1, and a recursive call to powerset.
;; When entering your code for the test cases below you will need to include both your definition for consToAll
;; and your definition for powerset here!  You will need to copy your definition for consToAll from the previous question,
;; and paste it here, for your powerset function to work.

(define consToAll
  (lambda (A L)
    (cond ((null? L)            '()                                   )
          (#t           (cons (cons A (car L)) (consToAll A (cdr L))) )
)))
 

(define powerset
  (lambda (L)
    (cond ((null? L)                                 '(())                                   )
          (#t             (append (powerset (cdr L)) (consToAll (car L) (powerset (cdr L)))) )
)))
