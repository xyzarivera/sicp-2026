#lang sicp

(define (check-equal? x y) (= x y))

; This algorithm takes a number of steps that is linear in b
(define (slow-mul a b)
  (if (= b 0)
      0
      (+ a (slow-mul a (- b 1)))))

(check-equal? (slow-mul 2 3) 6)

; Now suppose we include, together with addition, operations double,
; which doubles an integer, and halve, which divides an (even) integer by 2.
; Using these, design a multiplication procedure analogous to fast-expt
; that uses a logarithmic number of steps.
(define (fast-mul a b)
  (define (double a) (* a 2))
  (define (halve a) (/ a 2))

  (cond
    ((= b 0) 0)
    (even? b (double (fast-mul a (halve b))))
    (else (+ a (fast-mul a (- b 1))))
    )
  )

(check-equal? (fast-mul 2 3) 6)
