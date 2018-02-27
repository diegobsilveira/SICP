; Author: Diego Barros da Silveira
; Date:	  2018-02-23

; --> Chapter 1 <--

; ==> Exercise 1.8:
; --> For Newton's cube root method

(define (square x) (* x x))

; --> Taken from the previous exercise:
(define (new-good-enough current-guess previous-guess)
  (> (/ (min current-guess previous-guess) 
	(max current-guess previous-guess)) 
     0.99))

; --> As the formula in the question's framing showed:
(define (better-approximation y x)
  (/ (+ (/ x (square y)) (* 2 y)) 3))

(define (cbrt-iter current-guess previous-guess x)
  (if (new-good-enough current-guess previous-guess)
    current-guess
    (cbrt-iter (better-approximation current-guess x)
	       current-guess
	       x)))

; --> Practically the same as the definition of the
; --> newly defined new-square-root in the previous exercise.
(define (cbrt x) (cbrt-iter 1.0 x x))
