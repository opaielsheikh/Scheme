#lang racket
;; Define a function called 'hypotenuse' that takes two numbers as arguments (call them  X and Y)
;; and returns the result of squaring X, squaring Y, adding the results together, and returning the square root of that sum.
;; You can use a built-in function called sqrt to get the square root.

(define square (lambda (x) (* x x)))
(define hypotenuse (lambda (a b) (sqrt (+ (square a) (square b)))))
