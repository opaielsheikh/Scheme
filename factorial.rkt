#lang racket
;; this is the factorial function as given in lectures
;; (using a different variable name, to show that we
;; can do that)

(define factorial
   (lambda ( X )
      (cond   (  (= X 1)        1                      )
              (  (> X 1)   (* X (factorial (- X 1)) )  )
      )
   )
)
