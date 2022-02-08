#lang racket
(define noRuns (lambda (L)
    (cond      ((null? (cdr L))                        (cons (car L) '()))
               ((= (- (car (cdr L)) (car L)) 1)          (noRuns (cdr L)))
               ( #t                       (cons (car L) (noRuns (cdr L))))
)))
