#lang racket
;; Write a recursive function called sum_of_squares that takes as its argument an integer N
;; and returns as its answer the sum of the square of every number from N down to 1.
;; You can use your square function from last week to get the square of a single number.
;; You can assume that the integer N is going to be greater than 0.  
;; Stop and think!   Remember to use recursion!   Plan your function by
;; (1) thinking about the simple case,
;; (2) thinking about how the answer for a complex case can be produced from the answer for a simpler case.
;; A USEFUL HINT:  the sum of square roots from N down is equal to (square N) plus the sum of squares from (- N 1) down.
;; Test: (sum_of_squares 5) 55

(define square (lambda (x) (* x x)))

(define sum_of_squares
    (lambda (N)
        (cond ((= N 1) 1)
                ((> N 1) (+ (square N) (sum_of_squares(- N 1))))
        )
    )
)
