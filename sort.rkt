#lang racket
;; problem: sort a list of numbers

;; (sort '( 5 2 4 5 7))  -> (2 4 5 5 7)

;;  Base case?
;;  [    (null? L)           L                 ]
;;  [    (null? (cdr L))     L                 ]

;; recursive case?  We must make L smaller.
;; How can we make a list smaller?
;;  Take the first element off?  Take some middle element out?
;; split the list in half or something?


;;  Lets say we remove the first elemnt to make the list smaller.
;;  The recursive call is:
;;   (sort (cdr L)).   If L='(4 3 1 2)  (sort (cdr L)) = '(1 2 3)
;;  The answer we want is this, but with the missing 4 inserted.
;;  So the full recursive call is
;;   (insert (car L) (sort (cdr L))

   (define sort
      (lambda(L)
        (cond  [    (null? L)           L                   ]
               [    (null? (cdr L))     L                   ]
               [    #t      (insert (car L) (sort (cdr L))) ]
               )))

    (define insert
      (lambda(E L)
        (cond [   (null? L)        (cons E L)             ]
              [   (< E (car L))    (cons E L)             ]
              [   #t    (cons (car L) (insert E (cdr L))) ]
              )))

;; The above sort only works for lists of numbers (becaue the comparison function used is <,
;; which only compares numbers.  To make a general version of the sort, we can pass in a
;; comparison function to the sort, and the insert function (as you did in your labs on sorting).
;; or we can use "scoping", by defining a function that takes a comparison function as an argument,
;; giving that argument the name "<", and then including our sort and insert functions within
;; that scope.  "<" in those "inner functions", will then refer to whatever comparison function
;; we pass in:

(define insertionSort
  (lambda(<  L)

        (define sort
      (lambda(L)
        (cond  [    (null? L)           L                   ]
               [    (null? (cdr L))     L                   ]
               [    #t      (insert (car L) (sort (cdr L))) ]
               )))

    (define insert
      (lambda(E L)
        (cond [   (null? L)        (cons E L)             ]
              [   (< E (car L))    (cons E L)             ]
              [   #t    (cons (car L) (insert E (cdr L))) ]
              )))

   (sort L)
))


;;  How about taking out the lowest element of the list L, rather than the first?
;;  If we remove the lowest element from a list, we know it must go at the
;;  start of the sorted list (no insertion is needed), giving the following sort:

(define selectionSort
  (lambda(<  L)
    
    (define sort
      (lambda(L)
        (cond  [    (null? L)           L                   ]
               [    (null? (cdr L))     L                   ]
               [    #t    (cons (lowest L)
                              (sort (remove (lowest L) L))) ]
     )))

    (define lowest
      (lambda(L)
        (cond [   (null? (cdr L))               (car L)    ]
              [   (< (car L) (lowest (cdr L)))   (car L)   ]
              [   #t                    (lowest (cdr L))   ]
   )))

  (sort L)
 ))

;;  That version of selectionSort requires us to go through
;; the list twice (onece to get the lowest element, and once
;; to remove the lowest element).  Can we do this in one pass
;; through the list?
;; Yes: use variables to hold "lowest" and "rest", and do a
;; "mutual recursion"

(define onePassSelectionSort

(define getLowestAndSort
  (lambda(Low Rest L)
    (cond [ (null? L)        (cons Low (sort Rest))                               ]
          [ (< (car L) Low)  (getLowestAndSort (car L) (cons Low Rest) (cdr L))   ]
          [ #t               (getLowestAndSort Low (cons (car L) Rest) (cdr L))   ]
 )))

 (define sort
     (lambda(L)
        (cond  [    (null? L)           L                        ]
               [    (null? (cdr L))     L                        ]
               [    #t    (getLowestAndSort (car L) '() (cdr L)) ]
  )))
  (sort L)
 )

 
