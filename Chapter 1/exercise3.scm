; Author: Diego Barros da Silveira
; Date:	  2018-02-22

; --> Chapter 1 <--

; ==> Exercise 1.3:
; --> The following two procedure definitions are auxiliary procedures/abstractions
; --> for the sum-of-two-largest procedure.
(define (square x) (* x x))
(define (sum-of-squares x y) (+ (square x) (square y)))

; --> Sums the squares of the two largest numbers (of the three to be passed).
(define (sum-of-two-largest x y z)
  	(if (>= x y)			
	    (if (>= y z)
	      	(sum-of-squares x y)	; --> x and y are the two greatest.
		(sum-of-squares x z))	; --> x and z are the two greatest.
	    (if (>= x z)
	      	(sum-of-squares y x)	; --> y and x are the two greatest.
		(sum-of-squares y z)))  ; --> y and z are the two greatest.
)
