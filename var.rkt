#lang racket
;; suppose we have a function average, that takes
;; in three numbers and gets their average.  It looks
;; like this:

(define average  (lambda(x y z)  (/ (+ x y z)  3) ) )

;; Our challenge here is:
;; Write a function Var that takes in three numbers
;; and gives back the average of the square of each 
;; number's difference from their average.

;; this is a complicated function!!!! I'm showing it
;; as an example of how you would think through these
;; things.

;; suppose we have three numbers, 5 12 and 17.
;; we need to get their average.  Lets say we use
;; our function average to work this out:
;; (average 5 12 17)  -> 34/3

;; so what we want, from our Var function is:

;; (average (square (- 5 34/3))   
;;          (square (- 12 34/3))
;;          (square (- 17 34/3))
;; but we don't have a square function!  Wat to do?
;; we just write a square function:

(define square (lambda(x) (* x x)) )

;; Now we can write our var function, by replacing
;; the number 5 by x, the number 7 by y and the number
;; 17 by z.  And by replacing the average number 34/3
;; by the code that worked out that number.
;; so the function looks like this.

(define var
   (lambda(x y z)
     (average  (square (- x (average x y z) ))   
               (square (- y (average x y z) ))
               (square (- z (average x y z) ))
)))
