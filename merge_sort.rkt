#lang racket

;; problem: sort a list of numbers

;; (sort '( 5 2 4 5 7))  -> (2 4 5 5 7)

;;  In previous sorts we've done our recursive call by making the input
;;   list smaller by 1 item: (take away the first: insertion sort, the lowest: selection sort)
;;
;;  Here' we're going to do a sort where we make our input list L  smaller
;;  by taking half of L out, (and doing the recursive call on the remaining list)
;;

;; We're going to divide our list in half based on position, and do our
;; recursive call on the second half of the list
;;       (merge  (sort (firstHalf L) ) (sort  (secondHalf L)) )
;;  L  = '( 5 1 3 4 4 2 6 8 )   (firstHalf L) = '( 5 1 3 4)  (secondHalf L) = '(4 2 6 8 )
;;      (sort (firstHalf L)) = '( 1 3 4 5) (sort (secondHalf L)) = '(2 4 6 8 )
;;   (merge '(1 3 4 5)  '(2 4 6 8) ) ->
;;   (cons 1 (merge '(3 4 5)  '(2 4 6 8) )
;;   (cons 1 (cons 2 (merge '(3 4 5)  '(4 6 8) ) )
;;   (cons 1 (cons 2 (cons 3 (merge '(4 5)  '(4 6 8) ) )
;;    and so on

;; The problem: merge two sorted lists: given two list A B, both sorted in order,
;; return a sorted list of all elements in A and B

;;  Base case for merge?   [  (null? A)       B ]
;;                         [  (null? B)       A ]
;; recursive case:
;;          [  (< (car A) (car B))   (cons (car A) (merge (cdr A) B)   ]
;;          [  #t                    (cons (car B) (merge A (cdr B))   ]

(define merge
  (lambda(A B)
    (cond    [  (null? A)                              B                 ]
             [  (null? B)                              A                 ]
             [  (< (car A) (car B))   (cons (car A) (merge (cdr A) B))   ]
             [  #t                    (cons (car B) (merge A (cdr B)))   ]
)))

;; as with selectionSort, I'll use mutual recursion, and "holder" variables
;; to carry through the first and second parts of the list

(define sort
  (lambda(L)
    (cond [    (null? L)                                L                 ]
          [    (null? (cdr L))                          L                 ]
          [     #t                    (divideAndSort   '()   '()  L)      ]
)))


;;  F will hold the first "half" of the list, S will hold the second "half".
(define divideAndSort
  (lambda(F S L)
    (cond  [  (null? L)                             (merge (sort F) (sort S))              ]
           [  (null? (cdr L))                  (divideAndSort (cons (car L) F) S (cdr L))  ]
           [  #t   (divideAndSort (cons (car L) F) (cons (car (cdr L)) S)  (cdr (cdr L)))  ]
)))


;;  One thing to note here: we're dividing the list into two halves more-or-less randomly.
;;  Maybe it would be better to divide the list into two halves in some way where we
;;  make sure one half is automatically sorted, just by the division process.  This is
;;  the idea behind "timsort" (a version of mergesort).


(define sortTim
  (lambda(L)
    (cond [    (null? L)                                  L                             ]
          [    (null? (cdr L))                            L                             ]
          [     #t                    (divideAndSortTim '() (list (car L))  (cdr L))    ]
)))


;;  U is going to hold the unsorted part of the list, S is going to hold a sorted
;; sequence that we find as we're dividing the list up.
(define divideAndSortTim
  (lambda(U S L)
    (cond  [  (null? L)               (merge S   (sortTim U) )                      ]
           [  (< (car L) (car S))   (divideAndSortTim U (cons (car L) S)  (cdr L))  ]
           [  #t                    (divideAndSortTim (cons (car L) U) S (cdr L))   ]
)))



;;; Quicksort:  get's the lowest half of the list, and the highest half.
;;  (append  (quickSort LowestHalf)  (quickSort highestHalf))
;;
