#lang racket
;; car cdr lambda define cond length list? null? > < <= map filter append

;; write a function countAll, that takes a list L with sublists

(define test '( (a (b c)) a ( (d (e ) e) e)) )
;; and returns
'( (a 2) (b 1) (c 1) (d 1) (e 3))

;; assume the initial call is (countAll L)
;; base case?            [   (null? L)   '()  ]
;; recursive case?
;;     I know there must be a recursive call like this:
;;                     (countAll (cdr L))
;; ok what will that call give me back?
;; Suppose I take the list "test" as my example:
;; so I'm doing (countAll L) - I'm trying to work out the value of this.
;; and from the recurive call (countAll (cdr L))
;; which is equal to (countAll '( a ( (d (e ) e) e)) -> '( (a 1) (d 1) (e 3))
;; what I want to do is make the full answer for (countall L), which is
'( (a 2) (b 1) (c 1) (d 1) (e 3))
;; and what I have is (countAll (cdr L)) = '( (a 1) (d 1) (e 3))
;; and I also have (car test) = '(a (b c))
;; I notice that (b 1) and (c 1) are missing from the recursive answer.
;; AND I can make them by calling (countAll (car L)) -> ( (a 1)(b 1) (c 1))
;;  What i have now is
;;  cdr recursion :  (countAll (cdr L)) = '( (a 1)            (d 1) (e 3))
;;  car recursion : (countAll (car L)) =  '( (a 1)(b 1) (c 1))
;; what I want is :  (countAll L)      =  '( (a 2) (b 1) (c 1) (d 1) (e 3))

;; There is a subproblem I need to solve now: take two count lists
;; and join them to produce a single count list.

;; So I now solve this problem, using the same recursive design approach.
;; the join function, takes a list of counts A and another list of counts B
;; and joins them together, so that each symbol occurs once and it's count is
;; the sum of the counts in both lists.

;; base caese: when either list is empty, just return the other list
;; recursive case:   need to make a recursive call - I'll try (join (cdr A) B).
;; This will give me the result of joining all counts together, except for
;; the very first count in A (car A).
;; To make the full solution, I need to add the value in (car A) to the corresponding
;; value (with the same symbol) in the recursive result.  I'll write another
;; helper function to "add a count" in this way.

(define join
  (lambda(A B)
     (cond  [  (null? A)                        B     ]
            [  (null? B)                        A     ]
            [   #t (addCount (car A) (join (cdr A) B))]
)))

;; addCount takes a pair like this:  (a 1), and a list of such pairs,
;; and if a occurs in any of the pairs, it adds 1 to that pair, otherwise
;; it puts (a 1) into the list it's producing

(define addCount
  (lambda (E  L)
    (cond  [ (null? L)    (cons E L)                                                   ]
           [ (equal? (car (car L)) (car E)) (cons (list (car E)              ;;  make a count with same symbol 
                                                        (+ (cadr E) (cadr (car L)))) ;; but added numbers
                                                  (cdr L))                             ]
           [ #t   (cons (car L) (addCount E (cdr L)))                                  ]
)))


(define countAll
  (lambda(L)
    (cond [     (null? L)             '()                                          ]
          [    (list? (car L))    (join (countAll (car L)) (countAll (cdr L)))     ]
          [    #t                 (addCount (list (car L) 1) (countAll (cdr L)))   ]
 )))
