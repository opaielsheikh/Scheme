#lang racket
;;  (sumToAll 3 '(2 4 8)) ->  (5 7 11)

(define sumToAll
  (lambda(X L)
    (cond  [  (null? L)    '()                                ]
           [   #t  (cons (+ X (car L)) (sumToAll X (cdr L)))  ]
    )
  )
 )

;; map takes a number of inputs.  The first is a function,
;; and all the other inputs are lists of arguments for that function.
;; map calls this input function for each argument in those lists.
;; (map sqrt '(4 9 16))  -> (2 3 4)
 
;; (map (lambda(A) (+ A 3)) '(2 4 8))

;; (define sumToAllMap (lambda(X L) (map (lambda(A) (+ A X)) L)))

;; (map +   '(1 2 3) '(20 30 40)  '(100 200 300) )

 (map cons '(a b c)  '( (1) (2) (3 4 5) ))

 


;; powerset: give a list of inputs, and return every possible subset
;; of that list, including the list itself and '()
;; For example:  (powerset '(a b)  ) ->  '( () (b) (a) (a b) )

;; I notice that the base case here is:    (powerset '()) ->  '( () )
;; I also notice that (powerset L) = (powerset '(a b)  ) ->  '( () (b) (a) (a b) )
;; and   ( powerset (cdr L)) = (powerset '(b))  =   '(  ()  (b))
;; I notice that (powerset '(a b)  ) =  (powerset '(b))   and
;; (powerset '(b))   but with 'a joined on to everything
;; so the recursion is:
;;     (append (powerset (cdr L))  (consToAll (car L) (powerset (cdr L)))


(define powerset
  (lambda (L)
    (cond  [  (null?  L)           '(  () )                                  ]
           [  #t  (append (powerset (cdr L))
                    (map (lambda(A) (cons (car L) A)) (powerset (cdr L))))   ]
    )
  )
 )

(define consToAll (lambda(E L) (map (lambda(A) (cons E A)) L)))
