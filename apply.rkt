#lang racket
(define myList1 '( 10 20 30))  
(define myList2 '( (1) (2) (3)))

;; example of map:
(map (lambda(X Y) (list (+ X (car Y))) )      myList1 myList2)


;; fixed arity function:
(define hypotenuse
  (lambda (X Y) (sqrt (+ (* X X) (* Y Y)))))

;; variable arity function:
(define fun
  (lambda L  (length L)))

;; write a function that takes in any number of arguments
;; and returns a list containing the first two arguments
;; firstTwo
;; (firstTwo 6 3 1 6 7)
;; (6 3)
;; (firstTwo 1 2)
;; (1 2)

(define firstTwo  (lambda L  (list (car L) (car (cdr L)))))


;; write a function that gets the sum of the reciprocals of any sequence of numbers:

(define sumOfReciprocals
  (lambda L
     (apply +  (map (lambda (E) (/ 1 E))  L))
  )
)



;; make a version of hypotenuse that takes as many arguments as you want.
;;call it: M_hypotenuse


(define M_hypotenuse
  (lambda L
    (sqrt (apply + (map (lambda (E) (* E E)) L)))
    )
  )


;;   write a function "evens" that takes in a sequence of numbers
;;   (as many as you like) and gives back a list containing
;;   only the even numbers in that sequence
;;  (evens 4 6 5 2 7 8 9)
;;  (4 6 2 8)

;;  This is going to be a recursion, involving the list L (the list
;; of argument numbers).
;;   I'll begin with the base case.
;;  (null? L)          ->   '()
;;  recursive case:
;;    what is the recursive call going to look like?
;;    Maybe this?     (evens (cdr L))
;;    suppose I do:  (evens 2 4 5).  What will that recursive call look
;;    like?  In this case L= (2 4 5)   (evens (cdr L)) = (evens 4 5)
;;    (apply evens (cdr L))

(define evens
  (lambda l
     (cond ((null? l) '())
           ((even? (car l)) (cons (car l) (apply evens (cdr l))))
           (#t  (apply evens (cdr l)))
           )))  ;; notice that I MUST use apply in the recursive call here
                ;; in a variable arity function, you have to use apply in the recursive call




;; a version of constToAll using map:

 (define consToAll (lambda (X L) (map   (lambda (E) (cons X E))  L)))

;; the powerset function from last week's labs:
;;
;;  (powerset L) = the list of all possible subsets of L, including
;;  L itself and the empty list.
;; for example:  (powerset '(b) ) = '(  () (b))
;;             (powerset '(a b)) =   '(  ()  (b) (a) (a b) )
;;               (powerset '() ) =       '(  () )
;; I notice that powerset '(a b) is made up of (powerset '(b)) and
;; (powerset '(b)) with 'a cons'd on to every element.  This gives
;; me the recursive call

(define powerset
  (lambda (L)
    (cond  [   (null? L)         '( () )                                             ]
           [   #t   (append (powerset (cdr L))
                            (map (lambda (E) (cons (car L) E))  (powerset (cdr L)))) ]  
   )))             ;; I could have used consToAll here, but I can just use map directly if I like...
