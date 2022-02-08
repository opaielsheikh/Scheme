#lang racket
;; a simple recursion to add X to every number in a list:

(define addToAll
  (lambda( X L)
    (cond [  (null?  L) '()                                 ]
          [  #t  (cons (+ X (car L)) (addToAll X (cdr L)))  ]
    )
  )
 )

;; suppose I want to add X to every number in a list L, USING MAP
;; what I need to do is make a function that will add X to a single numberm
;; and then map that function to the list.

(define addAll (lambda (X L) (map (lambda(A) (+ X A)) L)))

;; write a recursive function called myMap that takes two arguments: the first
;; argument is a function (call it fn) and the second argument is a list
;; and myMap goes recursively throught the list L, calling fn for each
;; indivual element in L, and returning a list of all the answers that you get.


(define myList '( (a b) (c d) (e f)))


(define MyMap(lambda(X L)
                (cond [(null? L) '()]
                      [#t (cons (X (car L)) (MyMap X (cdr L))) ]
                 )))


;; remember the "separate_elements" and "join_elements2 functions from a
;; while ago?  We can do these easily with map
(define people '(  (romeo bonnie jack)  (juliet clyde jill)) )
;; to separate these out
;; what we want is:  '(  (romeo juliet) (bonnie clyde) (jack jill) )

(map list '(romeo bonnie jack) '(juliet clyde jill) )  ;; this gives us what we want

(apply map list people) ;; same thing
