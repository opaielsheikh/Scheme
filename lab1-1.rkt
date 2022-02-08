#lang racket
;; Define a function called square that takes as its argument (its input) a single number, and evaluates to (returns) the square of that number.
;; You'll need to use 'lambda' to make this function, and 'define' to give it a name.  Here's how the square function should work:
;; (square 4) evaluates to 16
;; (square 2) evalutes to 4
;; A hint: your answer will look like this: (define square (lambda(X)  ...body... ) )
;; where (lambda(X) means 'here is a function that takes a single argument, labelled X,
;; and where ...body... represents the calculation carried out on X which this function will evaluate to.
;; In these questions you can type your definition for the function into the given box.  When you click
;; submit the system will call your function with some different numbers as arguments, and check if the answers are correct.

(define square (lambda (x) (* x x)))
