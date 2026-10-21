#lang sicp

(define (check-equal? x y) (= x y))

; trees

(define x (cons (list 1 2) (list 3 4)))
x
;(length x) ;3
; [ [1, 2],3 ,4]
; elem 1: [1, 2]
; elem 2: 3
; elem  3: 4

;

(define (count-leaves t)
  (cond
    ((null? t) 0)
    ((not (pair? t)) 1)
    (else (+ (count-leaves (car t)) (count-leaves (cdr t))))))

(check-equal? (count-leaves x) 4)
