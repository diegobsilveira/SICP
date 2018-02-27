; Author: Diego Barros da Silveira
; Date:	  2018-02-22

; --> Chapter 1 <--

; ==> Exercise 1.1:
10 	  ; --> the expression is a numeral written in base 10, and 
   	  ; --> it evaluates to the number 10.

(+ 5 3 4) ; --> the expression is a composition that has as
	  ; --> operand the primitive procedure '+' and as
	  ; --> arguments a list of numerals in base 10 that
	  ; --> represent the numbers 5, 3 and 4, and thus it
	  ; --> all evaluates to the expression 12.

(- 9 1)   ; --> the expression is a composition that has as
	  ; --> operand the primitive procedure '-' and as
	  ; --> arguments a list of numerals in base 10 that
	  ; --> represent the numbers 9 and 1, and thus it
	  ; --> all evaluates to the expression 8.

(/ 6 2)   ; --> the expression is a composition that has as
	  ; --> operand the primitive procedure '/' and as
	  ; --> arguments a list of numerals in base 10 that
	  ; --> represent the numbers 6 and 2, and thus it
	  ; --> all evaluates to the expression 3.

(+ (* 2 4) (- 4 6))
; --> Using the procedure to evaluate expressions such as the above
; --> we first evaluate (* 2 4) as 8 and (- 4 6) as (-2) 
; --> and then we evaluate (+ 8 (-2)) as 6.

(define a 3) ; --> The interpreter prints nothing, but it associates
	     ; --> the value 3 with the name 'a'.

(define b (+ a 1)) ; --> The interpreter prints nothing, but it associates
		   ; --> the value resulting from the value associated with the name a summed with 1, with the name 'b'.

(+ a b (* a b))
; --> the expression is a composition that has as
; --> operand the primitive procedure '+' and as
; --> arguments a list of names that
; --> represent certain numbers.
; --> But it first evaluates the value of the sub-expression
; --> (* a b) which returns the procedure of multiplication
; --> applied to the arguments whose names are a and b.
; --> and so it is (* 3 (+ 3 1)) ==> (*3 (4)) ==> 12
; --> and returning to the original composition/expression:
; --> (+ 3 (+ 3 1) 12) ==> (+ 3 (4) 12) ==> (+ 3 4 12) ==> 19.

(= a b)
; --> This is a predicate that returns true if the values associated
; --> with the names a and b (respectively) are the same and false
; --> otherwise.
; --> By the definition of both a and b, they are not the same,
; --> and thus the interpreter returns false (#f).

(if (and (> b a) (< b (* a b)))
    b
    a)
; --> The expression above will be evaluated by substituting
; --> the values associated with the names a and b in the and
; --> predicate, which will (in this case) return true (#t) and
; --> return the value associated with the name b.

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
; --> The expression above will be evaluated by testing the value
; --> associated with both a and b and the specific values there
; --> and return the evaluation of the consequent expression.
; --> In this case, since the value associated with a is 3 and with
; --> b is (by definition) 4, and since one of the clauses has a
; --> predicate which is just that, its consequent expression is thus
; --> evaluated and returned:
; --> (+ 6 7 a) ==> (+ 6 7 3) ==> (16) ==> 16

(+ 2 (if (> b a) b a))
; --> The expression is a composition that will aplly the addition
; --> operation on 2 and the value returned in the if sub-expres-
; --> sion. To evaluate it, we check whether the value associated
; --> with the name b is greater than the one with a, and since it
; --> is, the value associated with b is returned (4).
; --> And returning to the original expression, it is:
; --> (+ 2 4) ==> (6) ==> 6

(* (cond ((> a b) a)
         ((< a b) b)
	 (else -1))
   (+ a 1))
; --> The expression is a composition that will aplly the multipli
; --> -cation operation on the list of evaluated operands, one of
; --> which is a conditional expression and the other is a simple
; --> arithmetical one (which evaluates to 4):
; (* (cond ((> a b) a)
;          ((< a b) b) 
;          (else -1))
;    4)
; --> When we evaluate the conditional sub-expressions of cond we
; --> see that it will return the value of b (because (< a b) re-
; --> turns true) and so, the resulting original expression is equi
; --> valent expression:
; --> (* 4 4) ==> (16) ==> 16.
