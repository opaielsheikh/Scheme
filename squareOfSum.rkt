#lang racket
;; write a function called 'squareOfSum that takes in three numbers, adds them up,
;; and squares the result. so if the numbers were 5 12 17, we would get the square
;; of (+ 5 12 17), or  (square (+ 5 12 17))

;; our function is going to take three arguments: let's call them x y and z.
;; so the function is going to look like this:  (lambda (x y z) ....)
;; and what we want to do is add up x y and z, and then square the result
;; so the function will be (lambda (x y z) (square (+ x y z) )  )
;; and then we just have to give that function the name we want:

(define squareOfSum
  (lambda  (x y z)
    (square (+ x y z))
   )
 )

;; but if we try and run that function, it won't work!  There is no 'square' function.
;; No problem: we just define that function too:

(define square
  (lambda(x)
    (* x x)
   )
 )

;; and now, whever we run the squareOfSum function, by saying (squareOfSum 5 12 17), for example,
;; when scheme meets the word 'square', it will look up that definition for square, and
;; replace 'square' with the function (lambda(x) (* x x)) and then run that function.

;; notice that the order of definitions makes no difference here, because the definitions
;; are only 'looked up' (that is, evaulated) when we actually run our function by saying
;; (squareOfSum 5 12 17).  
