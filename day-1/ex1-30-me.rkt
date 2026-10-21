#lang sicp
;(#require (only racket require))
;(require rackunit)

(define (check-equal? x y) (= x y))

; ------

(define (identity x) x)
(define (square x) (* x x))
(define (addTwo x) (+ x 2))


; see Formulating Abstractions with Higher Order Procedures

; linear recursion
(define (slow-sum term a next b)
  (if (> a b)
      0
      (+ (term a) (slow-sum term (next a) next b)
         )
      )
  )

;(check-equal? (slow-sum square 2 addTwo 10) 220)

;iterative recursion
(define (fast-sum term a next b)
  (display a) (display " ") (display b)
  (newline)

  (define (iter a result)
    (display "result ")(display result)
    (newline)

    (if (> a b)
        result
        (iter (next a) (+ result (term a)))
        ))
    (iter (next a) (term a))
  )

(check-equal? (fast-sum square 2 addTwo 10) 220)
