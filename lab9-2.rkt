#lang racket
;; Write a recursive function called sort that takes in two arguments (a comparison function C, and a list L) and returns the list L sorted in the order specified by C.
;; Here's a hint:  suppose you have recursively used this sort function by calling  (sort C (cdr L)) to sort the rest of the list (cdr L).  How can you make a sorted version of the whole list L?  
;; Your includeBy function from the previous question will be helpful here: make sure to include the code for that function in your answer!

(define sort
    (lambda (C L)
        (cond ( (null? L)                   '()                    )
              (  #t          (insertBy C (car L) (sort C (cdr L) )))
        )
    )
)


(define insertBy
  (lambda (C E S)
    (cond ( (null? E)                      S                 )
          ( (null? S)                     (list E)           )
          ( (C E (car S))                (cons E S)          )
          (#t               (cons (car S) (insertBy C E (cdr S) )))
    )
  )
)
