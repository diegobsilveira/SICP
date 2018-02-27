; Author: Diego Barros da Silveira
; Date:	  2018-02-22

; --> Chapter 1 <--

; ==> Exercise 1.7:
; --> Below is the definition of the good-enough procedure:
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

; --> The above procedure is not effective for computing
; --> the square root of very small numbers because:
; --> The implementation used in the book tests whether the 
; --> guess is close enough to being the actual number by a 
; --> tolerance factor (which in this case is 0.001). But
; --> it could happen that right off the bat that "closeness" 
; --> is already satisfied by an inital guess and it would
; --> produce a wrong output for just about any number close 
; --> to the one whose square root is being calculated.

(square-root 0.0000000000000000000000000000000000001)
; --> Notice that the number is smaller than the tolerance
; --> factor.

; --> The above procedure is not effective for computing
; --> the square root of very large numbers because:
; --> As it was framed in the question: real computers
; --> perform arithmetic operations in almost all cases
; --> with limited precision, and after a few iterations
; --> the improve function/procedure won't be able
; --> to improve the guess in the same rate as before
; --> and will eventually run forever (obviously not, at
; --> some point it will stop with an incorrect and not
; --> satisfying result).

(square-root 124928931283128308120830192098312089380912310983)

; --> A new good-enough definition:
; --> The ratio between the current and previous guesses
; --> (between the greatest and least of the two, respectively)
; --> must be greater than a large fraction (so that they are
; --> almost equal).
(define (new-good-enough current-guess previous-guess)
  (> (/ (min current-guess previous-guess) 
	(max current-guess previous-guess)) 
     0.99))

; --> A new sqrt-iter definition:
(define (new-sqrt-iter current-guess previous-guess x)
  (if (new-good-enough current-guess previous-guess)
    current-guess
    (new-sqrt-iter (improve current-guess x)
		   current-guess
		   x)))

; --> A new square-root definition:
; --> Obs.: For the first iteration, the previous-guess
; --> is defaulted to the number whose square-root is being
; --> calculated.
(define (new-square-root x)
  (new-sqrt-iter 1.0 x x))

; --> It is reasonably fast compared to the other one
; --> and is more 'tolerable' to higher values or smaller ones.
