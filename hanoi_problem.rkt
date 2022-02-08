#lang racket
;;   I'm writing a function to solve the tower of Hanoi problem.

;; problem design or problem statement stage:
;; Let's say the function is called Hanoi.  What input should I give it?
;; It needs to know how many disks are on the starting tower.
;; It needs to know he name of the target tower.
;; It also needs to know the name of the starting or source tower.
;; it should probably know the name of the other tower also!

;; what output should the function produce?  I think it should make something like:
;; ( (move a disk from A to C)
;     (move a disk from A to C)  ..... )
;; so my output is going to be a list of lists,  and each internal
;; list will contain the name of the tower I'm moving a disk from, and
;; the name of the tower I'm moving the disk to.
;;
;;   so example input might be:
;;        #disks    intermediate 
;;         |  source  |    target
;;  (hanoi 4   'A    'B   'C   )
;;  and my initial declaration for hanoi will be something like
;;   (define hanoi
;;     (lambda(N S I T)
;;
;; What sort of output can I make with these variables?
;; one "move" would be something like (list 'move 'a 'disk 'from S 'to I) -> (move a disk from A to B)
;; or to be really consise, all I need is the two disk names:  (list S I)

;; algorithm design stage:
;;  What is the base case? 
;;  (hanoi 0 'A 'B 'C)          nothing to move: the answer is a list of no moves: '()

;; the recursion!  I will have to solve (hanoi N ...): move N disks from one tower to another
;; by solving (hanoi (- N 1) .... )somehow!
;; Suppose the function is called with
;;  (hanoi 4 'A 'B 'C).  What recursive calls can I do?
;; I could try (hanoi 3 'A 'B 'C) - which will move the top 3 disks from A to C.
;;  This doesn't help solve the problem: I can't move the left-behind 4th disk to C.
;;
;;   I could try (hanoi 3 'A 'C 'B)
;; the biggest disk is left over on tower A.  What can I do with it?
;;  If I move that disk from A to C, then I'm nearly done:
;; All I need to do now is move the rest of the disks from B to C,
;; which I can do with another recursive call: (hanoi 3 'B 'A 'C)
;;
;; so here's the code:

(define hanoi
  (lambda(N S I T)
    (cond [   (= N 0)                    '()                          ]
          [   #t    (append (hanoi (- N 1) S T I)
                            (cons (list 'move 'a 'disk 'from S 'to T)
                                  (hanoi (- N 1) I S T)))             ]
 )))

;; Notice that the two recursive calls are moving the (- N 1) disks to two different
;; places: first from the source to the intermediate tower, and then from
;; the intermediate tower to the target.

;;  The thing I want you to get here is not the recursive solution (though it is nice!).
;; Instead the critical thing here is that solution comes from carefully thinking about
;; the "problem statement" or "problem design" stage: the stage that comes before
;; we even get to the algorithm.  This stage is a crucial part of all programming.
