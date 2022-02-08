#lang racket
(define everySecond
  (lambda (L)
   (cond    [ (null? L)                    '()                           ]
            [ (null? (cdr L))               L                            ]
            [  #t          (cons (car L) (everySecond (cddr L)))         ] 
 )))

(define myList '(a 1 b 2 c 3 d))

;; (define L1 (cons 'fintan '() )) ->   '(fintan)
;;    
;;      ----------------------
;; L1  @| @fintan  | @null   |
;;      ----------------------
;; (define L2 (cons 'john  L1 )) ->   '(john fintan)
;;    
;;      ----------------------
;; L2  @| @L1    | @L2       |
;;      ----------------------


;; (define X (cons 'fintan 'john )) 
;;    
;;      ----------------------
;;  X  @| @fintan  | @john    |
;;      ----------------------



(define nested         '(  (0 1 2 3) (4 5 (a b c)) (6 7)))
;;(nestedLength nested) ;; '(  4           3           2 )

(define nestedLength
   (lambda (L)
     (cond ( (null?  L)                   '()                              )
           (  #t          (cons (length (car L)) (nestedLength (cdr L)))   )
   )))




;; write a function called replace that takes 3 arguments A B L
;; and it replaces the first occurence of A in the list L, with B.
;; and the returns the list that results.
