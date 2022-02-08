#lang racket
;; the factorial function from the start of the module:

(define factorial
  (lambda(N)
    (cond   [   (= N 1)         1                       ]
            [    #t         (* N (factorial (- N 1)))   ]
     )
   )
 )


;; this function multiplies all the numbers from N down to 1
;; but what if we wanted to use / instead of multiply?  Or +? or - ?
;; we could rewrite different versions of the function, with everything the same
;; but with the * changed to / or + or -.

;; but a better way is to do this is to use functions as arguments.
;; This function takes an argument 'op that stands for the function
;; want to use.  It calls that function in (op N ...)
;; and we can run the function by saying (rep * 5) which will give
;; (* 5  (* 4 (* 3 (* 2 1))))=120   [factorial 5], or by saying
;; (rep / 5 ) which will give (/ 5  (/ 4 (/ 3 (/ 2 1)))) and so on.

(define rep
  (lambda(op N)
    (cond   [   (= N 1)         1                     ]
            [    #t         (op N (rep op (- N 1)))   ]
     )
   )
 )


;; here's a function to get the the maximum of a list of numbers.
;; Think through it to understand how it works!
(define max
  (lambda (op L )
    (cond [  (null? (cdr L))                 (car L)             ]
          [  (op (car L) (max op (cdr L)))   (car L)             ]
          [   #t                        (max  op (cdr L))        ]
    )
  )
 )

;;We could do the same thing, of passing in a function, with this "max",
;; to give this "maxOp" function.  Do you see how it works?

(define maxOp
  (lambda (op L )
    (cond [  (null? (cdr L))                             (car L)  ]
          [  (op (car L) (maxOp op (cdr L)))             (car L)  ]
          [   #t                              (maxOp op (cdr L))  ]
    )
  )
 )

;; now we can find all sorts of maximums.

;; suppose we have a list of people like this:
(define people '(  (age 50 name fintan john costello) (age 19 name mike rogers)
                                                      (age 21 name a b c d e smith)))

;; and we want to find the oldest person on the list.  We write a function that
;; compares people's ages, like this:
(define age
  (lambda(person1 person2)
     (>  (car (cdr person1)) (car (cdr person2)))))

;; and we use the max function like this:

(max age people)

;; sometimes we don't want to even name this comparison function: so
;; we can do something like this:
  
(max (lambda(x y) (> (length x) (length y)))   people)
  



;; (power X Y) is X multipled by itself Y times.  Write power


(define power
  (lambda ( X Y)
    (cond   [  (= Y 0)                  1                 ]
            [   #t           (* X (power X (- Y 1)))      ]
     )
   )
 )



;;   write a recursive function
