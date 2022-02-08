#lang racket
;; this is a "trace through" of me trying to solve this problem:

;; write a function called "contains" that takes two LISTS as input
;;  (call them L and S) and returns true if the list L has a
;; subsequence equal to S.
;; here are some examples.
;;   (contains '(a b c d e f g)   '(c d e f ) )
;;   #t
;;   (contains '(a b c d e f g)   '(c d f) )
;;   #f

;; I've never done this before! There is no guarantee I'll get to
;; the "nicest" solution.  I just want to show the thought processes.

;; Like always, I start by thinking about base cases.

;; what are the base cases in this problem?  I'll try some example input and see what I get.
;; (contains '()  '(a b c) ) is false (#f):   (and (null? L) (not (null? S)))    ->   #f
;; (contains '()   '()     ) is true (#t):   (and (null? L)  (null? S))     ->   #t
;;   [   (null? L)      (null? S)       ]    this can be a base case
;;   [  (equal?  L  S)   #t         ]        so can this
;; (contains '(a b c d )   '() )  ->  #t
;;  [   (null? S)            #t     ]   and this

;; recursive call:
;; I'm going to call the function with smaller arguments.
;;  so that I get closer to the stopping condition. Maybe like this:
;;     (contains (cdr L)   S)
;;  let's say L = '(a b c d) and S = '(b c))
;;  What will (contains (cdr L)   S) return?   #t  (I pretend the function is working!!)
;; [  (contains (cdr L) S)      #t     ]     this is a possible recursive case
;;  This deals with all cases except the one where S is at the
;;  very start of the list L.
;;  let's say L = '(a b c d) and S = '(a b c)

;;  let's say L = '(b c d) and S = '(b c)
;; maybe try [  (equal? (car S) (car L))    (contains (cdr L) (cdr S)) ]
;; suppose I had
;;  let's say L = '(a b c d) and S = '(a c d)
;; then (contains (cdr L) (cdr S))  will turn into
;; (contains (b c d) (c d)  )
;; ok, forget that possible recursion.  This seems complicated - I
;; need a helper function to make it easier to solve.

;;  Try again: I want to deal with the case where S is at the
;;  very start of the list L.
;; I will use a helper function startsWith that returns true
;; if L starts with S.
;; then my  call will be
;;   [ (startWith L S)            #t           ]
;; and so here's my code attempt

(define contains
  (lambda (L S)
    (cond   [  (null? L)           (null? S)        ]
            [  (equal?  L  S)        #t             ]            
            [  (null? S)             #t             ]
            [  (contains (cdr L) S)  #t             ]
            [  (startsWith L S)      #t             ]
            [  #t                    #f             ]  ;; <- I initially forgot this last line 
     )                                                 ;; and "debugged" by asking:
  )                                                    ;; what cases have I missed?
)                                                      ;; I'd missed the case where L doesn't start with S.
 




;; I tested out this code by first making sure startsWith worked properly:
;; trying it for various possible inputs, making sure it gave #t and #f when it
;; should.   This did work.  Then I tried out "contains" with various inputs (see above for
;; an error I found).

(define startsWith
  (lambda (L S)
    (cond [ (and (null? L) (null? S))       #t                            ]
          [ (null? L)                       #f                            ]
          [ (null? S)                       #t                            ]
          [ (equal? (car L) (car S))       (startsWith (cdr L) (cdr S))   ]
          [   #t                            #f                            ]
  )))
          
;; this is my initial version of startsWith.  I could play around with it
;; a little more and get a shorter, more elegant version:

(define startsWith2
  (lambda (L S)
    (cond [ (or (null? L) (null? S))      (null? S)                          ]
          [ (equal? (car L) (car S))     (startsWith2 (cdr L) (cdr S))       ]
          [  #t                           #f                                 ]
  )))

;; the same for the 'contains' function: I can look at the version I got in
;; my first run-through, and try and re-organise the logic.  Here is an improved version


(define contains2
  (lambda (L S)
    (cond   [  (equal?  L  S)        #t                                     ]            
            [  (null? L)            (null? S)                               ]
            [  #t              (or  (startsWith L S)(contains2 (cdr L) S) ) ]
    )
  )
)

;; Now that I look at it, this solution is more "natural".  It says:
;;  if the two lists are equal, then it is true that one contains the other.
;; if L is empty, then  L contains S only if S is empty too.
;; otherwise, L contains S if L starts with S, or if (cdr L) contains S.
;; this is a sign of a good solution: you can "read" it almost as if it's
;; natural language.
