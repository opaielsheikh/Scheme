#lang racket
;; Write a function (everySecond L) that takes a list L as input and returns a list containing every second element from L,
;; starting from the first element.  For example (everySecond '(1 a 2 b 3 c 4)) should return '(1 2 3 4),
;; and (everySecond '(a b c d e)) should return '(a c e).

;; A hint: think carefully about the stopping conditions.  There are two stopping conditions here
;; (cases where the function can give an answer immediately with no further work): when the list L is empty,
;; when the list L has exactly ???? element(s) in it (exactly how many?  what is returned?)
;; Another hint: (null? L) is true if L is empty.  (cdr L) is L with the first element missing.
;; (null?  (cdr L)) is therefore true if L contains exactly 1 element.

;; Test: (everySecond '(1 a 2 b 3 c 4 d))
;; (1 2 3 4)
;; (everySecond '(a b c d e))
;; (a c e)

(define everySecond
  (lambda (L)
     (cond
      ( (= (length L) 1)         L                                 )
      ( (null? L)               '()                                )
      ( #t                  (cons(car L) (everySecond (cdr(cdr L)))))
     )
  )
)
