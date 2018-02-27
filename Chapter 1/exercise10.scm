; Author: Diego Barros da Silveira
; Date:	  2018-02-23/2018-02-24

; --> Chapter 1 <--

; ==> Exercise 1.10:

; --> Below is the definiton of the procedure that
; --> abstracts the so called Ackermann's function:

(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))

; --> What is the value returned by the following ex-
; --> pression/composition:

(A 1 10)

; --> Using the substitution model:
; --> (A 1 10)
; --> (cond ((= 10 0) 0)
; -->       ((= 1 0) (* 2 10))
; -->       ((= 10 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- 10 1)))))

; --> (cond ((= 10 0) 0)
; -->       ((= 1 0) (* 2 10))
; -->       ((= 10 1) 2)
; -->       (else (A 0
; --> 	       (A 1 9))))

; --> (A 0 (A 1 9))
; --> (cond ((= (A 1 9) 0) 0)
; -->       ((= 0 0) (* 2 (A 1 9)))
; -->       ((= (A 1 9) 1) 2)
; -->       (else (A (- 0 1)
; --> 	       (A 0 (- (A 1 9) 1)))))

; --> The interpreter will first evaluate (A 1 9) to test the
; --> predicate of the first clause. In this case, taking the
; --> time to evaluate (A 1 9) won't be an issue, because even
; --> if the predicate of the first clause is false, the value
; --> returned by (A 1 9) will be the same one to calculate the
; --> value to be returned by the original function, because
; --> the second predicate (= 0 0) is (#t) (true). So:

; --> (A 1 9)
; --> (cond ((= 9 0) 0)
; -->       ((= 1 0) (* 2 9))
; -->       ((= 9 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- 9 1)))))

; --> (cond ((= 9 0) 0)
; -->       ((= 1 0) (* 2 9))
; -->       ((= 9 1) 2)
; -->       (else (A 0
; --> 	       (A 1 8))))

; --> Remembering that the original expression is now:
; --> (A 0 (A 0 (A 1 8))

; --> (A 0 (A 1 8))
; --> (cond ((= (A 1 8) 0) 0)
; -->       ((= 0 0) (* 2 (A 1 8)))
; -->       ((= (A 1 8) 1) 2)
; -->       (else (A (- 0 1)
; --> 	       (A 0 (- (A 1 8) 1)))))

; --> Again, we don't know if (A 1 k) is 0 or not, and have
; --> to evaluate the predicate to check if it's true or not,
; --> but no matter what this value returned by it will be
; --> used, because (= 0 0) is (#t) (true), and so, we continue...
; --> :

; --> (A 1 8)
; --> (cond ((= 8 0) 0)
; -->       ((= 1 0) (* 2 8))
; -->       ((= 8 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- 8 1)))))

; --> (cond ((= 8 0) 0)
; -->       ((= 1 0) (* 2 8))
; -->       ((= 8 1) 2)
; -->       (else (A 0
; --> 	       (A 1 7))))

; --> Remembering that the original expression is now:
; --> (A 0 (A 0 (A 0 (A 1 7))))

; --> (A 0 (A 1 7))
; --> (cond ((= (A 1 7) 0) 0)
; -->       ((= 0 0) (* 2 (A 1 7)))
; -->       ((= (A 1 7) 1) 2)
; -->       (else (A (- 0 1)
; --> 	       (A x (- (A 1 7) 1)))))

; --> We see that this pattern keeps repeating and by following it
; --> we would need to add an 0 to the pattern of execution and
; --> when reaching a 'definite' (without having to evaluate ano-
; --> ther instance of A) end, we would 'backtrack' by applying
; --> and evaluating the consequent expressions of the 
; --> "(= 0 0)" clauses in the 'backtracking'. And so it would be:

; --> Continuing: 
; --> (A 0 (A 0 (A 0 (A 1 7))))
; --> (A 0 (A 0 (A 0 (A 0 (A 1 6)))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4)))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3))))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2)))))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))

; --> Now we reach the 'end' of this repating pattern, because we
; --> would have to evaluate (A 1 1):

(A 1 1)
; --> (A 1 1)
; --> (cond ((= 1 0) 0)
; -->       ((= 1 0) (* 2 1))
; -->       ((= 1 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- 1 1)))))

; --> Evaluating the predicate of the clauses we see that the third
; --> one will be evaluated and returned:
; --> (A 1 1) ==> (* 2 1) ==> (2) ==> 2

; --> And now, in returning to the deferred chain of A (and by doing so
; --> evaluating the consequent of the second clause in every instance
; --> of A in this 'backtracking' process:

; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1))))))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 2)))))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 4))))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 8)))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 16))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 32)))))
; --> (A 0 (A 0 (A 0 (A 0 (* 2 32)))))
; --> (A 0 (A 0 (A 0 (A 0 64))))
; --> (A 0 (A 0 (A 0 (* 2 64))))
; --> (A 0 (A 0 (A 0 128)))
; --> (A 0 (A 0 (* 2 128)))
; --> (A 0 (A 0 256))
; --> (A 0 (* 2 256))
; --> (A 0 512)
; --> (* 2 512)
; --> (1024) ==> 1024

(A 2 4)
; --> (A 2 4)
; --> (cond ((= 4 0) 0)
; -->       ((= 2 0) (* 2 4))
; -->       ((= 4 1) 2)
; -->       (else (A (- 2 1)
; --> 	       (A 2 (- 4 1)))))

; --> (cond ((= 4 0) 0)
; -->       ((= 2 0) (* 2 4))
; -->       ((= 4 1) 2)
; -->       (else (A 1 
; --> 	       (A 2 3))))

; --> Since none of the clauses' predicates evaluate to (#t) (true)
; --> the returned expression is the else's consequent expression:

; --> (A 1 (A 2 3))
; --> (cond ((= (A 2 3) 0) 0)
; -->       ((= 1 0) (* 2 (A 2 3)))
; -->       ((= (A 2 3) 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- (A 2 3) 1)))))

; --> Now, first, we must evaluate (= (A 2 3) 0):
; --> (A 2 3)
; --> (cond ((= 3 0) 0)
; -->       ((= 2 0) (* 2 3))
; -->       ((= 3 1) 2)
; -->       (else (A (- 2 1)
; --> 	       (A 2 (- 3 1)))))

; --> Since none of the clauses' predicates evaluate to (#t) (true)
; --> the returned expression is the else's consequent expression:

; --> (A (- 2 1) (A 2 (- 3 1)))
; --> (A 1 (A 2 2))
; --> (cond ((= (A 2 2) 0) 0)
; -->       ((= 1 0) (* 2 (A 2 2)))
; -->       ((= (A 2 2) 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- (A 2 2) 1)))))

; --> Now, we must first evaluate (= (A 2 2) 0):
; --> (A 2 2)
; --> (cond ((= 2 0) 0)
; -->       ((= 2 0) (* 2 2))
; -->       ((= 2 1) 2)
; -->       (else (A (- 2 1)
; --> 	       (A 2 (- 2 1)))))

; --> Now, evaluating else's consequent expression (because all
; --> other clauses' predicates evaluate to (#f) (false)):

; --> (A (- 2 1) (A 2 (- 2 1)))
; --> (A 1 (A 2 1))
; --> (cond ((= (A 2 1) 0) 0)
; -->       ((= 1 0) (* 2 (A 2 1)))
; -->       ((= (A 2 1) 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- (A 2 1) 1)))))

; --> To evaluate the above cond, we must first evaluate
; --> (A 2 1) to evaluate the clauses' predicates:

; --> (A 2 1)
; --> (cond ((= 1 0) 0)
; -->       ((= 2 0) (* 2 1))
; -->       ((= 1 1) 2)
; -->       (else (A (- 2 1)
; --> 	       (A 2 (- 1 1)))))

; --> We see that the third clause's predicate evaluates to (#t)
; --> (true), so this cond returns 2;
; --> (A 2 1) ==> 2
; --> Now, we begin the 'backtracking' process:

; --> (cond ((= 2 0) 0)
; -->       ((= 1 0) (* 2 2))
; -->       ((= 2 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- (A 2 1) 1)))))

; --> None of the clauses' predicates evalute to (#t)... so
; --> the else of the above cond will be evaluated and retur-
; --> ned:

; --> (A (- 1 1) (A 1 (- (A 2 1) 1)))
; --> (A 0 (A 1 (- 2 1)))
; --> (A 0 (A 1 1))

; --> Now we have to evaluate (A 1 1)
; --> (cond ((= 1 0) 0)
; -->       ((= 1 0) (* 2 1))
; -->       ((= 1 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- 1 1)))))

; --> The third clause (= 1 1) evaluates to (#t) (true), so,
; --> 2 will be returned i.e. (A 1 1) ==> 2

; --> Returning:
; --> (A 0 (A 1 1))
; --> (A 0 2) ==> (Simplyfing a bit...) (* 2 2) ==> (4) ==> 4


; --> (A 1 (A 2 2))
; --> where (A 2 2) ==> ... ==> 4
; --> (cond ((= 4 0) 0)
; -->       ((= 1 0) (* 2 4))
; -->       ((= 4 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- (A 2 2) 1)))))

; --> Since none of the clauses' predicates evaluate to (#t) (true):

; --> (A 2 3) ==> (A 1 (A 2 2)) ==> (A (- 1 1) (A 1 (- (A 2 2) 1)))
; --> (A (- 1 1) (A 1 (- (A 2 2) 1)))
; --> (A 0 (A 1 (- 4 1)))
; --> (A 0 (A 1 3))
; --> (cond ((= (A 1 3) 0) 0)
; -->       ((= 0 0) (* 2 (A 1 3)))
; -->       ((= (A 1 3) 1) 2)
; -->       (else (A (- 0 1)
; --> 	       (A 0 (- (A 1 3) 1)))))

; --> First, we evaluate the (A 1 3):
; --> (A 1 3)
; --> (cond ((= 3 0) 0)
; -->       ((= 1 0) (* 2 3))
; -->       ((= 3 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- 3 1)))))

; --> The else will be evaluated and returned as the result
; --> of evaluating (A 1 3):

; (A (- 1 1) (A 1 (-3 1)))
; (A 0 (A 1 2))
; --> (cond ((= (A 1 2) 0) 0)
; -->       ((= 0 0) (* 2 (A 1 2)))
; -->       ((= (A 1 2) 1) 2)
; -->       (else (A (- 0 1)
; --> 	       (A 0 (- (A 1 2) 1)))))

; --> Now we must evaluate (A 1 2):
; --> (A 1 2)
; --> (cond ((= 2 0) 0)
; -->       ((= 1 0) (* 2 2))
; -->       ((= 2 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- 2 1)))))

; --> The else's consequent will be evaluated and returned
; --> (A 1 2) ==> (A (- 1 1) (A 1 (- 2 1)))
; --> (A (- 1 1) (A 1 (- 2 1)))
; --> (A 0 (A 1 1))

; --> Now we must evaluate (A 1 1):
; --> (cond ((= 1 0) 0)
; -->       ((= 1 0) (* 2 1))
; -->       ((= 1 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- 1 1)))))

; --> Since the third clause's predicate evaluates to (#t) (true)
; -->, this cond above will return true, so:
; --> (A 1 1) ==> 2

; --> Backtracking... :
; --> (A 1 2) ==> (A 0 (A 1 1))
; --> (A 1 2) ==> (A 0 2)
; --> (A 1 2) => (A 0 2) ==> (Simplifying) ==> (* 2 2) ==> (4)
; --> (A 1 2) ==> 4
; --> (A 1 3) ==> (A 0 (A 1 2))
; --> (A 1 3) ==> (A 0 4)
; --> (A 1 3) ==> (Simplifying) ==> (* 2 4) ==> (8) ==> 8

; --> Backtracking even further:
; --> (A 2 3) ==> (A 0 (A 1 3))
; --> (A 2 3) ==> (A 0 8)
; --> (A 2 3) ==> (Simplifying) ==> (* 2 8) ==> (16) ==> 16

; --> Now we backtrack even further, to evaluate (A 1 (A 2 3))
; --> because (A 2 4) (what was asked!) ==> (A 1 (A 2 3))
; --> (A 1 (A 2 3)) ==> (A 1 16)
; --> (cond ((= 16 0) 0)
; -->       ((= 1 0) (* 2 16))
; -->       ((= 16 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- 16 1)))))

; --> None of the clauses' predicates evaluate to (#t) (true),
; --> so the else's consequent will be evaluated and returned:

; --> (A 1 16) ==> (A (- 1 1) (A 1 (- 16 1)))
; --> (A 1 16) ==> (A 0 (A 1 15)) 

; --> Now we must evaluate (A 1 15), but we will soon realise
; --> that it will be evaluated in a similar manner to (A 1 16)

; --> So it will be as follows:
; --> (A 1 16)
; --> (A 0 (A 1 15))
; --> (A 0 (A 0 (A 1 14)))
; --> (A 0 (A 0 (A 0 (A 1 13))))
; --> (A 0 (A 0 (A 0 (A 0 (A 1 12)))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10)))))))
; --> And since we calculated before the value of (A 1 10)...

; --> (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (1024)))))))
; --> By evaluating these deferred operations back,
; --> we see that the second clauses' predicates of the
; --> A function that are deferred are applied:

; --> (A 0 (A 0 (A 0 (A 0 (A 0 (* 2 1024))))))
; --> (A 0 (A 0 (A 0 (A 0 (A 0 2048)))))
; --> (A 0 (A 0 (A 0 (A 0 (* 2 2048)))))
; --> (A 0 (A 0 (A 0 (A 0 4096))))
; --> (A 0 (A 0 (A 0 (* 2 4096))))
; --> (A 0 (A 0 (A 0 8192)))
; --> (A 0 (A 0 (* 2 8192)))
; --> (A 0 (A 0 16384))
; --> (A 0 (* 2 16384))
; --> (A 0 32768)
; --> (* 2 32768)
; --> (65536)
; --> 65536 <== (A 2 4)

(A 3 3)
; --> (A 3 3)
; --> (cond ((= 3 0) 0)
; -->       ((= 3 0) (* 2 3))
; -->       ((= 3 1) 2)
; -->       (else (A (- 3 1)
; --> 	       (A 3 (- 3 1)))))

; --> By evaluating cond, we see that the first three clauses'
; --> predicates evaluate to (#f) (false), so the else's con-
; --> sequent will be evaluated and returned.

; --> (A 3 3) ==> (A (- 3 1) (A 3 (- 3 1)))
; --> (A 3 3) ==> (A 2 (A 3 2))
; --> (A 2 (A 3 2))
; --> (cond ((= (A 3 2) 0) 0)
; -->       ((= 2 0) (* 2 (A 3 2)))
; -->       ((= (A 3 2) 1) 2)
; -->       (else (A (- 2 1)
; --> 	       (A 2 (- (A 3 2) 1)))))

; --> Now, to evaluate (A 2 (A 3 2)), we must first evaluate
; --> (A 3 2):
; --> (A 3 2)
; --> (cond ((= 2 0) 0)
; -->       ((= 3 0) (* 2 2))
; -->       ((= 2 1) 2)
; -->       (else (A (- 3 1)
; --> 	       (A 3 ( - 2 1)))))

; --> Since none of the clauses' predicates evaluate to (#t) (true)
; --> the else will be returned i.e. (A 3 2) ==> (A (- 3 1) (A 3 ( - 2 1)))

; --> (A (- 3 1) (A 3 (- 2 1)))
; --> (A 2 (A 3 1))
; --> And now we must evaluate (A 3 1):

; --> (A 3 1)
; --> (cond ((= 1 0) 0)
; -->       ((= 3 0) (* 2 1))
; -->       ((= 1 1) 2)
; -->       (else (A (- 3 1)
; --> 	       (A 3 (- 1 1)))))

; --> The third clause's predicate evaluates to (#t) (true), so
; --> (A 3 1) ==> 2
; --> (A 2 (A 3 1)) ==> (A 2 2)

; --> (A 2 2)
; --> (cond ((= 2 0) 0)
; -->       ((= 2 0) (* 2 2))
; -->       ((= 2 1) 2)
; -->       (else (A (- 2 1)
; --> 	       (A 2 (- 2 1)))))

; --> The else's consequent will be evaluated and returned
; --> (A 2 2) ==> (A (- 2 1) (A 2 (- 2 1)))
; --> (A 2 2) ==> (A 1 (A 2 1))
; --> Now we must evaluate (A 1 (A 2 1))
; --> (A 1 (A 2 1))
; --> (cond ((= (A 2 1) 0) 0)
; -->       ((= 1 0) (* 2 (A 2 1)))
; -->       ((= (A 2 1) 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- (A 2 1) 1)))))

; --> And now, evaluating (A 2 1)
; --> (A 2 1)
; --> (cond ((= 1 0) 0)
; -->       ((= 2 0) (* 2 1))
; -->       ((= 1 1) 2)
; -->       (else (A (- 2 1)
; --> 	       (A 2 (- 1 1)))))

; --> The third clause's predicate evaluates to (#t) (true), so
; --> the value returned by (A 2 1) is 2
; --> (A 2 1) ==> 2

; --> Backtracking to (A 1 (A 2 1)):
; --> (cond ((= 2 0) 0)
; -->       ((= 1 0) (* 2 2))
; -->       ((= 2 1) 2)
; -->       (else (A (- 1 1)
; --> 	       (A 1 (- (A 2 1) 1)))))

; --> Since none of the clauses' predicates evaluate to (#t) (true)
; --> (A 1 (A 2 1)) ==> (A 1 2) ==> (A (- 1 1) (A 1 (- (A 2 1) 1)))

; --> (A (- 1 1) (A 1 (- (A 2 1) 1)))
; --> (A 0 (A 1 (- 2 1)))
; --> ==> (A 0 (A 1 1))

; --> Backtracking process: 
; --> (A 0 (A 1 1)) (And simplifying a bit (A 1 1) ==> 2)
; --> (A 0 2) ==> (* 2 2) ==> (4) ==> 4
; --> (A 2 2) ==> (A 1 (A 2 1)) ==> (A 0 2) ==> 4
; --> (A 2 (A 3 1)) ==> (A 2 2) ==> 4
; --> (A 3 2) ==> (A 2 (A 3 1)) ==> 4
; --> (A 2 (A 3 2)) ==> (A 2 4)

; --> Now, evaluating (A 2 4):
; --> (A 2 4) ==> .... ==> 65536
; --> (A 3 3) ==> (A 2 4) ==> .... ==> 65536


; --> We are asked to give concise mathematical
; --> definitions to the procedures for positve integer
; --> values of n:

(define (f n) (A 0 n))			; --> (f n) computes 2n
; --> On the first 'iteration' of
; --> the procedure, when we evalua-
; --> te it, we see that the second
; --> clause's predicate is (#t) (true)
; --> and we evaluate and return its
; --> consequent expression, which is:
; --> (* 2 n).

(define (g n) (A 1 n))			; --> (g n) computes 2^n
; --> Because when evaluated, it will
; --> fall on the else and evaluate
; --> its consequent, which is:
; --> (A 0 (A 1 (n - 1))), which
; --> itself can be reduced as
; --> (A 0 (A 0 ... (A 1 ...)))
; --> but it will reach a point where
; --> its innermost A procedure is
; --> (A 1 1) which is evaluated as 2
; --> and returns it. And so the defer-
; --> red chain will be evaluated as
; --> the second clause's consequent
; --> (of the definition) and so it
; --> will keep multiplying 2, n times.


(define (h n) (A 2 n))			; --> (h n) computes 
					; --> 2^(h (- n 1))
					; --> base case: n evaluated = 1
; --> Flow of execution example:
; --> (A 2 n)
; --> (A 1 (A 2 (- n 1))
; --> (A 1 (A 1 (A 2 (- n 2))))
; --> (A 1 (A 1 (A 1 (A 1 ... (A 2 (x))...)))) 
; --> there are n deferred application of A
; --> x ==> 1
; --> and so :
; --> (A 1 (A 1 (A 1 (A 1 ... (A 2 1)...)))) 
; --> (A 1 (A 1 (A 1 (A 1 ... (2) ... ))))
; --> (A 1 (A 1 (A 1 (A 1 ... 2 ... ))))
; --> In the innermost part of these deferrals
; --> will be a (A 1 2), which will return 4.
; --> And now, we have (n - 1) deferrals 
; --> and in the innermost part again, we have
; --> (A 1 4) and so on...
; --> (A 2 n) = 2^(A 2 (- n 1))

(define (k n) (* 5 n n)) 		; --> (k n) computes (5 * n^2)
