#lang racket
(define myList '(a b c d e))  ;;  (cons 'a (cons 'b (cons 'c (cons 'd (cons 'e '())))))

;;        ----------------------
;; cons  | @fintan   | @john   |
;;        ----------------------
;;
;;        ----------------------
;; cons  | @a   | @restofMylist  |
;;        ----------------------

;;        ----------------------------
;; cons  | @b   | @restofRestMylist  |
;;        ----------------------------

(define nested              '(   (a b c)   (1 2 3 4 5) (x y) ))
;;(countElements nested) ->   '(     3          5          2  )

(define countElements
  (lambda( L )
    (cond       (    (null? L)                       0                                )
                (     #t         (cons (length (car L))  (countElements (cdr L)))     )
    )
  )
)


;; define a function (replace A B L) takes a list L and gives back that
;; list but with the first occurence of A replaced by B (whatever they are)...
