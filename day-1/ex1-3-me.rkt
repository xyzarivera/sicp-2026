#lang sicp

(define (square x) (* x x))

(define (sum-squares-two-largest a b c)
  ; returns the sum of the squares of the two larger numbers
  (define large1 0)
  (define large2 0)

  (define cond1 (< a b))
  (if cond1 (define large1 a) (define large1 b))

  (define cond2 (< large1 c))
  ;(if cond2 (define large2 c))


  (+ (square large1) (square large2))

  )

(check-equal? (sum-squares-two-largest 2 3 4) 25)
