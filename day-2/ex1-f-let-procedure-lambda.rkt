#lang sicp
;(#require (only racket require))
;(require rackunit)

(define (check-equal? x y) (= x y))

; ------
; f(x,y) =

(define (f x y)
  ; TODO let version

  ; convert to procedure
  (define (helper a b)
    (+
     (* x a a)
     (* y b)
     (* a b)))

  (helper
   (+ 1 (* x y))
   (- 1 y)))

; TODO: convert to lambda

(f 3 4)
(check-equal? (f 3 4) 456)

