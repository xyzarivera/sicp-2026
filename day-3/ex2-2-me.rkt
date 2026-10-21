#lang sicp

(define (check-equal? x y) (= x y))


; line segments

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-point x y) (cons x y))
(define (x-point pt) (car pt))
(define (y-point pt) (cdr pt))

(define (make-segment start end) (cons start end))
(define (start-segment sgmt) (car sgmt))
(define (end-segment sgmt) (cdr sgmt))

(define (average a b) (/ (+ a b) 2))

(define (midpoint-segment sgmt)
  (cons (average (x-point (start-segment sgmt)) (x-point (end-segment sgmt)))
        (average (y-point (start-segment sgmt)) (y-point (end-segment sgmt)))))

(define p1 (make-point 2 3))
(define p2 (make-point 10 7))
(define s (make-segment p1 p2))
(define mp (midpoint-segment s))
(print-point mp)         ;  Should produce (6, 5)
