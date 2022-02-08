#lang racket
;; these examples are meant to show the 
;;  difference between evaluating something and quoting it
(define myAge       (quote (+ 20 30))               )    ;; myAge will be the list (+ 20 30)
(define myAge1       (+ 20 30)                       )    ;; myAge will be 50

;; (define myFullName   (fintan john costello)         )   ;; this will throw an error (it tries to run a
                                                        ;;    function called fintan - there is no function)
(define myFullName1  (quote (fintan john costello) ) )   ;; myFullName will be the list '(fintan john costello)

;; we can use the quote symbol as a shorthand, instead of the quote function.
(define story    '(it was a dark (and (very very) stormy) night)  )

;;(and we can have nested lists inside lists

;; here's a function definition: it's made of nested lists, just like data
(define abs
   (lambda(X)
      (cond  (   (> X 0)           X             )
             (   #t              (- 0 X)         )
      )
   )
 )
;; to run this we would say
(abs -3)

;; here's the code quoted and stored in a variable...
(define abs_as_data
  (quote
       (lambda (X)
           (cond  (   (> X 0)           X             )
                  (   #t              (- 0 X)         )
         )
      )
   )
 )

;; to run it we would say
;; (   (eval abs_as_data) -3  )   ;; eval evaluates the data in abs_as_data

;; some data in lists within lists...
(define namesAndAges     '(  (fintan 50)  (john 20)  (mary  26)  )  )

;; some more data in lists within lists
;; (define actions   '(  (+ 2 3)  (- 6 1)  (* 5 6)))

;; we can evaluate this data if we like:

;; (car actions)   ;; this will give back the list '(+ 2 3)

;; (eval (car actions) )    ;; this will give back 5


   (define add
      (lambda  ( L  )
        (cond  (      (null?  L)               0           ) 
               (       #t      (+ (car L) (add (cdr L) ))  )
        )
       )
     )
