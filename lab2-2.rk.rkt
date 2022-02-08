#lang racket
;; Write a recursive function called reciprocals that takes as its argument an integer N and
;; returns as its answer the sum of all the fractions 1/N + 1/(N-1) + ... 1/2 + 1/1.
;; You can assume that the integer N is going to be greater than 0.
;; Remember to plan your function by
;; (1) thinking about the simple case,
;; (2) thinking about how the answer for a complex case can be produced from the answer for a simpler case.
;; A USEFUL HINT:  to get the reciprocal 1/N for a single number N, call the / function like this:   (/ 1 N).
;; This will return a fraction, not a floating-point number, but that's ok.  Try it out a few times before using it in your reciprocals function.
;; Test: (reciprocals 4) 25/12

(define fraction (lambda (x) (/ 1 x)))

(define reciprocals
    (lambda (N)
        (cond ((= N 1) 1)
              ((> N 1) (+ (fraction N) (reciprocals(- N 1))))
        )
    )
)
