#lang sicp

; factorial
; 5! = 5 * 4 * 3 * 2 * 1
; n! = [if n > 0]: n * (n-1)!
; n! = [if n = 1]: 1
; n! = [if n < 1]: error

(define (check-equal? x y) (= x y))


(define (fact n)
  (if (= n 1) 1
      (* n (fact (- n 1)))))

(check-equal? (fact 5) 120)

; evaluation expands
; recursive procedure, expanding


; -------------

; factorial
; 5! = 1 * 2 * 3 * 4 * 5

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

(check-equal? (fact-upwards 5) 120)

; evaluation is shorter
; iterative procedures
