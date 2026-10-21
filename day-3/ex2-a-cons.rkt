#lang sicp

(define (check-equal? x y) (= x y))


;

(define (cons a b)
  (lambda (request)
    (cond
      ((= request 1) a)
      ((= request 2) b)
      (else (error "bad request")))))

(define (car c)
  (c 1))

(define (cdr c)
  (c 2))

(define me (cons 1 2))
(car me)
(cdr me)
