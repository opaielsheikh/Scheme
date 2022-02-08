#lang racket
;; simple template for a recursive function

(define NameOfFunction
  (lambda (Arg1  Arg2 ... )
    (cond  (   IsThisABaseCase?                           BaseCaseAnswer         )
           (   ??                                            ??                  )
           (  IsARecursiveCase?  (dealWithLeftOver (NameOfFunction ChangedArgs)) )
           (  #t                                             ??                  )
   )
 )
)
