; Author: Diego Barros da Silveira
; Date:	  2018-02-22

; --> Chapter 1 <--

; ==> Exercise 1.4:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
; --> Since the model of evaluation allows combinations whose
; --> operators are themselves compound expressions, we can say
; --> that the body test that if b is positive the primitive
; --> operation of addition is to be selected in the composition
; --> and otherwise it will be subtraction to be selected in the
; --> composition
; --> So, if b is positive the body of the abstraction can be
; --> "reduced" to (+ a b), and if b is negative, the body of
; --> the abstraction will be (- a b). In both cases, it is doing
; --> exactly what the definition names it (summing a to the abso-
; --> lute value of b).
