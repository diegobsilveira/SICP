; Author: Diego Barros da Silveira
; Date:	  2018-02-22

; --> Chapter 1 <--

; ==> Exercise 1.5:
; --> The procedures below were defined to test
; --> whether the interpreter uses applicative-order
; --> or normal-order evaluation.
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

; --> If the interpreter uses applicative-order evaluation:
; --> (if (= x 0)
; -->     0
; -->     y)
; --> It will substitute the arguments passed for the formal
; --> formal parameters directly in the body of the function
; --> (as seen above):
; --> (if (= 0 0)
; -->     0
; -->     (p))
; --> Since any number is equal to itself, the interpreter
; --> will then evaluate and return the consequent expression
; --> which is in this case just a number (0) and the value
; --> returned is 0.

; --> If the interpreter uses normal-order evaluation:
; --> (if (= x 0)
; -->     0
; -->     y)
; --> It will expand first according to the body definition
; --> and apply the appropriate function definition to any 
; --> composition and sub-expressions encountered, before
; --> evaluating and returning them.
; --> And so, the conditional expression is "transformed" into:
; --> (if (= 0 0)
; -->     0
; -->     (p))
; --> Since p is itself a procedure, the interpreter will
; --> try to expand it by the body definition, but since p
; --> returns itself without any other "restriction", the
; --> interpreter will try to go on evaluating it in an infinite
; --> loop, with another instance of p being used in each "itera-
; --> tion".
