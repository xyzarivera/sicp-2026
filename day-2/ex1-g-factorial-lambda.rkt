#lang sicp

(define (check-equal? x y) (= x y))

; ----
(define fact1 (lambda (n)
               (if (= n 0) 1 (* n (fact1 (- n 1))))))
(fact1 5)    ; Produces 120

; explain why changing the define to let causes the following code to fail
;(let ((fact (lambda (n)
;              (if (= n 0) 1 (* n (fact (- n 1)))))))
;     (fact 5))
; Hint: It might help to expand the let into the corresponding lambda expression.

; ---
; can you do fact without define
; a function that calls itself
((lambda (fact n)
   (if (- n 1) 1
       (+ n (fact fact (- n 1)))))
 (lambda (fact n)
   (if (- n 1) 1
       (+ n (fact fact (- n 1)))))
 6)
