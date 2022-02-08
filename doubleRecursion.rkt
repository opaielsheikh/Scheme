#lang racket
;; here's how to see a nested list as a tree:

(define L  '(  a  (1 2) (fintan (is (here now)) ok) 6 ) )

;; each sublist is pointed-to by a 'branch' of the top-level list
;;     (a  @      @   6 )                                0
;;        /       \
;;    (1 2)    (fintan  @ ok)                            1
;;                     /
;;                    (is  @  )                          2
;;                         /
;;                        (here now)                     3


;; the depth of a list (or a tree) is the level of the deepest part of that list.
;; here are some examples:
;; How do we get the depth of a list?
;; (depth L)      ->  3
;; (depth '(1 2) )   ->  0
;; (depth '( a (1 2) )  -> 1
;; (depth '(fintan (is (here now)) ok) ) -> 2
;;
;; how do we write code for the depth function?
;;  main call is (depth L)
;;  recursive call is going to be (depth (cdr L))
;; (depth (cdr L)) =  (depth '( (1 2) (fintan (is (here now)) ok) 6 ) ) -> 3

;; some things to note:
;; (depth '()  ) -> 0
;; (depth '(  () ) ) -> 1  (car '(  () ))  ->  '()    (depth (car '( ())))  = (depth '()  ) -> 0

;; process of writing the code:
;; identify the base case
;; identify the recusive call
;; make the argument smaller in the recursive call
;; ask what the recursive call gives you back as an answer
;; ask what is left over after the smaller recursive call
;; ask what you can do with that left-over thing to get the full answer.



;; here's a second question to try:
;; write a function flatten that reduces a list with any number of sublists or sublists of sublists
;; to a single flat list...
;; for example:
;; (flatten '(  a  (1 2) (fintan (is (here now)) ok) 6 ) ) -> '(a 1 2 fintan is here now ok 6)
;; or
;;  (flatten  '( a ( 1 2) b (3 4) )) -> (a 1 2 b 3 4)
;;
;; what is the simplest input here? And what answer should I give for that?
;;   (flatten  '() )->   '()
;; what if the list isn't empty?  Suppose it's like this
;; > (flatten '(a (b c) )
;; what should I get as an answer here?  I should get '(a b c)
;; what's the recursive call?  (flatten (cdr L))
;; for that example, the recursive call will be (flatten '( (b c) ) ) -> '(b c)
;; what do I do to the answer from that recursive call to get the answer I want
;; which is '(a b c)
;; suppose I had the input list  (flatten '( ( a (b (c))) d e) )
;; what will the recursive call give back here? (flatten '(d e)) -> '(d e)
;; what do I want?  I want: ( a b c d e)
;; the '(a b c) terms here come from the car of my list, which is (car L)= '( a (b (c)))
;; how do I get the '(a b c) required from  (car L)= '( a (b (c)))?
;;  I need to flatten (car L):  (flatten '( a (b (c))) -> '(a b c)
;; then I can join the result of that call onto the result of the other recursive call
;; (flatten (cdr L)):
;; (flatten  '( (a (b ))  c (d (e ))) ) = (append (flatten ' (a (b ))) (flatten '(  c (d (e )))) )
;;                                       (append    '(a b)              '(c d e) ) ->'(a b c d e)

;; and here's the code:

(define flatten
   (lambda ( L )
     (cond   [ (null? L)                          '()                          ]
             [ (not (list? (car L)))        (cons (car L) (flatten (cdr L)))   ]
             [ #t               (append (flatten (car L))  (flatten (cdr L)))  ]
      )
    )
 )



;; heres a beautiful alternative solution, by Daniel.
;; do you see how this works?


(define D_flatten
  (lambda (L)
     (cond [    (null? L )          L                                       ]
           [    (list? (car L))     (D_flatten (append (car L) (cdr L)))    ]
           [     #t                 (cons (car L) (D_flatten (cdr L)))      ]
 )))
