#lang sicp

(define (check-equal? x y) (= x y))


;

(define (cons x y)
  (lambda (m) (m x y)))


(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

(define p (cons 2 3))
(car p)       ; -> 2;(cdr p)       ; -> 3
