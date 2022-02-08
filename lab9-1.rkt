#lang racket
;; Write a function called insertBy that takes three arguments, called C, E and S.
;; E is an element, and S is a list that is already sorted in increasing order:
;; the insertBy function inserts E into its correct place into the sorted list S.  
;; The first argument to insertBy is a comparison function C.
;; This comparison function is not created by you: it's passed in by the user.
;; You can call the comparison function C (whatever it is) within your function to compare E
;; and the first element of S: if C returns #t (true) for that comparison, the element E should
;; come before (car S) in the list, while if C returns #f (false) for that comparison, the element E should
;; come after (car S) in the list.    insertBy inserts E into S by using the passed-in comparison function C
;; to put the element E in its correct position.  
;; The user can pass in different comparison functions, to produce different results.  For example, the call
;; (insertBy < 4 '(3) )          ; ;   where the variable C holds the function  < 
;; should return the answer
;; (3 4)      
;; because (C 4 3)  is false and so the element E=4 should come after 3 in the list
;; (here we are using C, which holds <, to compare E, which holds 4, with the first element of S,
;; which is 3) .  But with a different comparison function the call
;; (insertBy > 4 '(3) )     ; ;   where the variable C holds the function  >
;; should return the answer
;; (4 3) 
;; because (C 4 3)  is true in this case: and so the element E=4 should come
;; before 3 in the list (here we are using C, which now holds >, not <, to compare E
;; with the first element of S) .  Your function should work for any already sorted list S:
;; not just a list with one thing in it!
;; This is a recursive function.  What is the base case?  Are there two base cases?
;; (hint: yes!) What does the recursive call look like?  What do we do with the left-over bit in the recursive call?


;; Why are we using this comparison function here?  Because it makes our function very flexible for the user:
;; they can insert elements in whatever ordering they like, by creating their own comparison functions.

;; In the last two examples below, for instance, the user is first passing in a comparison function which compares
;; the first number ( the car ..)  of one element against the first number (car ..) of the another element:
;; and so will insert things in increasing order of the cars.   In the very last example, however, the user gives
;; a comparison functions that compares the second number of one element (the cadr ..) against the second number
;; of the other element: and produces a different insertion.

(define insertBy
    (lambda (C E S)
         (cond  ( (null? E) S)
                ( (null? S) (list E) )
                ( (C E (car S)) (cons E S))
                (#t (cons (car S) (insertBy C E (cdr S) )))
        )
    )
)
