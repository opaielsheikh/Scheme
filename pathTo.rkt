#lang racket
(define myTree '( (a (b (c ) d) ) ( (e) f (g))))

;;    (   @            @   )
;;       /              \
;;      ( a @ )          ( @  f  @ )         
;;           \            /      \
;;           (b  @ d)    (e)     (g)  
;;             /
;;           (c)

;; write a function called PathTo - that takes two
;; arguments, an element A, and a list (actually a tree)
;; call it T.  And (pathTo 'd myTree)   ->  '(1 2 3)

;; what exactly is a 'path' to a location?  How do
;; I represent a path?  Let's say the path to a given element
;; in a tree is a list of numbers, represnting the sequential
;; choices we have to make to that that element (the "turns" that
;; we have to make to get to the element).
;; so that (pathTo 'd myTree)  = (1 2 3)
;; because 1 means the first sublist in myTree (which is '(a (b (c ) d) ) )
;; and 2 means the second sublist in that (which is '(b (c ) d)  )
;; and 3 means the third "sublist" in that (which is 'd, the thing we want  )

;; what is the base case for "pathTo"?

;; one base case is:    (equal? (car T) E)
;; if we know the number of the current element (B) then
;; the answer here is (list B)

;; another base case: if T is empty then the response is  '()

;;  what will the recursive call look like?
;;                            (pathTo E (cdr T))
;; take T = myTree ='( (a (b (c ) d) ) ( (e) f (g))    (e) ))
;; and lets say I'm looking for 'e
;; what will  (pathTo 'e '(( (e) f (g)))  ) -> '(1 1)
;; This is a problem: the recursive call doesn't "know" the correct
;; number to start the path with (the number that goes with the first "branch")
;;
;; ok, I'm stuck here: I need to somehow "carry" around the "branch" number
;; for the first position in my list (which will increase as I go along the list).

;; let me write a helper function to do this: I'll call it path.
;; it takes a number B to represent the current "branch" (the branch number of the
;; current first entry in the list (the car of T).  It will also take
;; the element E we want the path to, and the tree T.
;; so to start with the first entry in the tree labeled branch 1, we would call:
;;(path 1 'e myTree)


;; So now I want to write a function "path" that takes in an element E and and tree T, and
;; a number B indicating the current "branch".  This function will give
;; back the path to E in the tree T, assuming that the first branch in T
;; is "labelled" B.

;; if this path function works, then I can use
;; (define pathTo (lambda (E T)  (path 1 E T)))
;; to solve the overall problem (by calling path and starting with position B=1)

;; path takes in the current "branch label" B, the element we're looking
;; for E and the tree T.  It returns the path to E in that tree.
;; If there is no path to E, the path function returns '()
;; whats the base case?  If there is nothing in the tree, then there is
;; no path to E.  And so we just return the empty list '()
;; and we have the base case     [  (null? T)   '()      ]

;; what if the first element in the list is equal to the thing we are loooking
;; for?  (what if (equal? (car T) E): for example, what if
;; E='e  T='(e f) and  B=1.  In this case, the path to 'e is   (list B)
;; and so for this base case we have
;; [   (equal? (car T) E)       (list B)       ]

;; recursive case...
;;  I know I have to do a recurive call!
;;  and it has to take a smaller Tree (a smaller List)
;;      So I'm going to have    (path (+ B 1)  E  (cdr T) )
;; as the recursive call for (cdr T).  I have to have
;; (+ B 1) here because, as I move to (cdr T), the branching "label" for
;; the first element in the list is going to be one more than the "label"
;; for the first element in the full list T.

;;  What about the left over bit in this?  That is, (car T)?
;;  car T can be a list itself, or car L can be just an element (not a list).
;;  If (car T) is not a list itself, then the correct answer for the whole
;; function is just the recursive call (path (+ B 1)  E  (cdr T) )
;; (because we know that E is not equal to (car T) ).  So we have
;; the recursive case
;;     [  (not (list? (car T)))     (path (+ B 1)  E  (cdr T) )    ]

;; the final case I need to deal with is, if the first element is a list iself.
;;  There are two possibilies: the element E is inside the sublist (car T)
;;  or the element E is not inside the sublist (car T).

;; how can I find out if E is within the sublist (car T)?  Well
;; (path 1 E (car T)) returns the path to E within (car T).  If this
;; is empty, the E is not in (car T).  In this case the answer we
;; have to return is the path to E in (cdr T) (because E is not in car T)
;; so we have the recursive case
;;     [  (null? (path 1 E (car T)))    (path (+ B 1)  E (cdr T))      ]
;; Now suppose that E is in fact in the sublist (car T).  In this
;; case we want the path to go into (car T): so the path has to
;; start with B (the branch that leads to (car T).  Once we are "in"
;; (car T) we want to follow on to find E within (car T): by following
;; the path (path 1 E (car T)).  So in this case we want the recursive call
;; (cons B( (path 1 E (car T))
;; there are no other cases I can think of, so we're done.  Here's the code:


(define pathTo (lambda (E T)  (path 1 E T)))

(define path
   (lambda(B E T)
     (cond  [  (null? T)                                 '()                ]
            [  (equal? (car T) E)                       (list B)            ]
            [  (not (list? (car T)))         (path (+ B 1)  E (cdr T))      ]
            [  (null? (path 1 E (car T)))    (path (+ B 1)  E (cdr T))      ]
            [   #t                        (cons B (path 1 E (car T)))       ]
     )
   )
 )
