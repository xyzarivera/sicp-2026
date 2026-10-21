#lang sicp
;(#require (only racket require))
;(require rackunit)

(define (check-equal? x y) (= x y))

; ------
; 2 ... 5 => 2 + 3 + 4 +5
(define (sum-integers a b)
  (if (= a b) a
      (+ a (sum-integers ( + a 1) b))
      )
  )

;(sum-integers 2 5)
(check-equal? (sum-integers 2 5) 14)

; TODO: fix this
(define (sum-squares-evens a b)
  (cond
    ((> a b) (error "b has to be higher"))
    ((= a b) (if (even? b) (* b b) 0))
    ((even? a) (+ (* a a) (sum-squares-evens (+ a 2) b)))
    (else (sum-squares-evens (+ a 1) b)))
  )

(check-equal? (sum-squares-evens 2 7) 56)

(define (square x) (* x x))
(define square (lambda(x) (* x x))) ; interpreter resolves to this ??? verify
(lambda(x) (* x x))
