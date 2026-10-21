#lang sicp

(define (check-equal? x y) (= x y))

; fractions aka rational numbers

(define (make-frac a b)
  (if (< (* a b) 0)
      (cons (- (abs a)) (abs b))
      (cons (abs a) (abs b))))


(define (num frac) (car frac))
(define (denum frac) (cdr frac))

(define (add-frac a b)
  (cons
   (+ (* (num a) (denum b))
      (* (num b) (denum a)))
   (* (denum a) (denum b))))

(make-frac 3 4)
(define fracA (make-frac 3 4))
(num fracA)
(denum fracA)

(define fracB (make-frac 2 3))

(add-frac fracA fracB) ; 17/12

(make-frac -2 -3) ; (2 . 3)
(make-frac 2 -3) ; (-2 . 3)

(make-frac 4 6) ; (2 . 3) TODO!! gcd function is builtin
