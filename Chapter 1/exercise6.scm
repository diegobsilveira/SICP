; Author: Diego Barros da Silveira
; Date:	  2018-02-22

; --> Chapter 1 <--

; ==> Exercise 1.6:
; --> By using these procedure definitions
; --> and specially considering the 'new-if'
; --> procedure
(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))

(define (square-root x)
  (sqrt-iter 1.0 x))

; --> If one tries to use this version of the if to implement
; --> sqrt-iter (and consequently square-root) the interpreter
; --> will try to run the procedure "infinitely". That occours
; --> because when the procedure is executed with a precise value
; --> it will do the new-if procedure (that is not built into the
; --> language, unlike the if special form) and test with the actual values
; --> (as per the applicative substitution model) and if the
; --> result returned from good-enough? is false it will try
; --> to execute sqrt-iter again which will involve another use
; --> of a new-if procedure (that is, again not built into the language).
