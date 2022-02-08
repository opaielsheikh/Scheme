#lang racket
;; Write a scheme function called midpoint that takes two numbers as input,
;; and evaluates to the number that is half-way between those two numbers.
;; Tests:
;; (midpoint 1 5) 3
;; (midpoint 2 5) 7/2

(define midpoint (lambda (x y) (/ (+ x y) 2)))
