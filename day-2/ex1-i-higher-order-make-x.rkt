#lang sicp

(define (check-equal? x y) (= x y))


; 1.3.4 procudures as returned values
; ----
; (given)
(define (add1 x) (+ 1 x))
(define (identity x) x)

 (define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(accumulate * 1 identity 1 add1 5)

; ---
;simpler procedures that hide the use of accumulate as an implementation detail
; (given)

(define (sum term a next b)
    (accumulate + 0 term a next b))

(define (product term a next b)
    (accumulate * 1 term a next b))

(check-equal? (sum identity 1 add1 10) 55)
(check-equal? (product identity 1 add1 5) 120)

; ---
; accumulate could be reformulated as a code generator instead
; (given)
(define (make-accumulator op null-value)
    (define (accumulate term a next b)
        (if (> a b)
            null-value
            (op (term a)
            (accumulate term (next a) next b))))
    accumulate)

; --
; (special exercise 1)
(define sum2 (make-accumulator + 0))
(check-equal? (sum2 identity 1 add1 10) 55)

; --
(define product2 (make-accumulator * 1))
(check-equal? (product2 identity 1 add1 5) 120)

; --
; (special exercise 2)
; sum
(define (make-sum term next)
  (define sum (make-accumulator + 0))

  (define (summer x)
    (sum term 1 next x))

  summer)

(define sum-first-n-integers (make-sum identity add1))
(sum-first-n-integers 10)
(check-equal? (sum-first-n-integers 10) 55)

; product
(define (make-product term next)
  (define multiply (make-accumulator * 1))

  (define (mulitplier x)
    (multiply term 1 next x))

  mulitplier)

(define factorial (make-product identity add1))
(factorial 5)
(check-equal? (factorial 5) 120)
