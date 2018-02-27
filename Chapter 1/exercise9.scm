; Author: Diego Barros da Silveira
; Date:	  2018-02-23

; --> Chapter 1 <--

; ==> Exercise 1.9:

(define (+ a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

; --> Utilizing the substitution model to show the evolution of
; --> the process defined above:
; --> Example:
(+ 4 5)

; --> (if (= 4 0)
; -->   5
; -->   (inc (+ (dec 4) 5)))

; --> Evaluating the predicate (= 4 0) (#f):
; --> (inc (+ (dec 4) 5)))
; --> (inc (+ 3 5))
; --> (inc (if (= 3 0)
; -->        5
; -->        (inc (+ (dec 3) 5))))

; --> Evaluating the predicate (= 3 0) (#f):
; --> (inc (inc (+ (dec 3) 5)))
; --> (inc (inc (+ 2 5)))
; --> (inc (inc (if (= 2 0)
; --> 	    5
; --> 	    (inc (+ (dec 2) 5)))))

; --> Evaluating the predicate (= 2 0) (#f):
; --> (inc (inc (inc (+ (dec 2) 5))))
; --> (inc (inc (inc (+ 1 5))))
; --> (inc (inc (inc (if (= 1 0)
; --> 		 5
; --> 		 (inc (+ (dec 1) 5))))))

; --> Evaluating the predicate (= 1 0) (#f):
; --> (inc (inc (inc (inc (+ (dec 1) 5)))))
; --> (inc (inc (inc (inc (+ 0 5)))))
; --> (inc (inc (inc (inc (if (= 0 0)
; --> 		      5
; --> 		      (inc (+ (dec 0) 5)))))))

; --> Evaluating the predicate (= 0 0) (#t):
; --> (inc (inc (inc (inc (5)))))

; --> And now applying the deferred inc's:
; --> (inc (inc (inc (inc (5)))))
; --> (inc (inc (inc (6))))
; --> (inc (inc (7)))
; --> (inc (8))
; --> (9)
; --> 9

; --> As one can perceive by using the substitution model
; --> the evolution of this process can categorise it as
; --> a linear recursive one.

; --> And now, by using another definition of (+ a b):

(define (+ a b)
  (if (= a 0)
    b
    (+ (dec a) (inc b))))

; --> And again, by utilizing the substitution model we can
; --> see the evolution of the process defined above with
; --> the same example:

(+ 4 5)

; --> (if (= 4 0)
; -->   5
; -->   (+ (dec 4) (inc 5)))

; --> Evaluating the predicate (= 4 0) (#f):
; --> (+ (dec 4) (inc 5))
; --> (+ 3 6)

; --> And continuing applying the definition of the + procedure:
; --> (+ 3 6)
; --> (if (= 3 0)
; -->   6
; -->   (+ (dec 3) (inc 6)))

; --> Evaluating the predicate (= 3 0) (#f):
; --> (+ (dec 3) (inc 6))
; --> (+ 2 7)

; --> (+ 2 7)
; --> (if (= 2 0)
; -->   7
; -->   (+ (dec 2) (inc 7)))

; --> Evaluating the predicate (= 2 0) (#f):
; --> (+ (dec 2) (inc 7))
; --> (+ 1 8)

; --> (+ 1 8)
; --> (if (= 1 0)
; -->   8
; -->   (+ (dec 1) (inc 8)))

; --> Evaluating the predicate (= 1 0) (#f):
; --> (+ (dec 1) (inc 8))
; --> (+ 0 9)

; --> (+ 0 9)
; --> (if (= 0 0)
; -->   9
; -->   (+ (dec 0) (inc 9)))

; --> Evaluating the predicate (= 0 0) (#t):
; --> 9

; --> As we can see with this definition of the + procedure
; --> It does not 'grow' and 'shrink back' (i.e. it does not
; --> deffer operations to a chain), it keeps a 'constant
; --> space' by the passing of a and b (its 'state variables'). 

; --> Both procedure definitions when applied to specific argu-
; --> ments return the same value in the end, but they both
; --> are different in the sense that the process that stem from
; --> them evolve in different ways (linearly recursive and
; --> iteratively).
