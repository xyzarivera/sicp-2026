#lang sicp
;(#require (only racket require))
;(require rackunit)

(define (check-equal? x y) (= x y))

; ------

(define (identity x) x)
(define (inc x) (+ x 1))
(define (square x) (* x x))
(define (addTwo x) (+ x 2))


; see Formulating Abstractions with Higher Order Procedures

(define (fact-upwards n)
  (define (helper current running-total)
    (if (> current n) running-total
        (helper
         (+ current 1)
         (* running-total current))
    )
  )
  (helper 1 1)
)


(define (fast-product term a next b)
  ;(display a) (display " ") (display b)
  ;(newline)

  (define (iter a result)
    (display a) (display " ") (display result)
    (newline)

    (if (> a b)
        result
        (iter (next a) (* result (term a)))
        ))
    (iter (next a) (term a))
  )

(check-equal? (fast-product identity 2 addTwo 10) 3840)

(define (product term a next b)
  (display a) (display " ") (display b)
  (newline)

  (define (iter a result)
    (display "result ")(display result)
    (newline)

    (if (> a b)
        result
        (iter (next a) (* result (term a)))
        ))
    (iter a 1)
  )

(check-equal? (product identity 2 addTwo 10) 3840)

