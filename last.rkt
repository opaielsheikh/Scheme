#lang racket
;; this lang racket line is so you can load this
;; file into racket.  Only the function definition
;; is needed if you are running scheme anywher else.

;; this was the exercise we did in the lectures this
;; morning: get the last element of a list.

(define last
  (lambda (L)
    (cond (  (null? (cdr L))     (car L)        )
          (  #t               (last(cdr L))     )
    )     
  )
)
