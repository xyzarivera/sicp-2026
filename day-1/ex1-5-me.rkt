#lang sicp

(define (square x) (* x x))
(define (check-equal? x y) (= x y))

(define (p) (p)) ; indefinite loop function

(define (test x y)
  (if (= x 0)
      0
      y))

(check-equal? (test 0 1) 0)
(test 0 1 (/ 1 0)) ; crashes because its a division by zero (/ 1 0)

; (test 0 (p)) ; loops infinitely
