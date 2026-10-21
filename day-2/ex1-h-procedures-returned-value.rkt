#lang sicp

(define (check-equal? x y) (= x y))

; ----
(define (add10 n)
  (+ n 10))

(add10 3)

(define (add4 n)
  (+ n 4))

(add4 3)

; ---

(define (make-adder-fn to-add)
  (lambda (n)
    (+ n to-add)))

(define add22 (make-adder-fn 22))
(add22 3) ; 25

; input and output are functions
(define (debug f)
  (lambda (x)
    (display "debug: ")(display x) (newline)
    (f x)))

((debug add22) 3)
;Python decorators
