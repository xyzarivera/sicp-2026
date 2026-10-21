#lang sicp

(define (check-equal? x y) (= x y))

(define (inc x) (+ x 1))
(define (dec x) (- x 1))

; Implementation 1 - recursive
(define (plus-v1 a b)
  (if (= a 0)
      b
      (inc (plus-v1 (dec a) b))))

; Implementation 2 - iterative
(define (plus-v2 a b)
  (if (= a 0)
      b
      (plus-v2 (dec a) (inc b))))

(check-equal? (plus-v1 1 2) 3)
(check-equal? (plus-v2 1 2) 3)

