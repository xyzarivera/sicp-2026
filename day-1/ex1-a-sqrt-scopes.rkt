#lang sicp

; 1. hide private functions
; 2. make (sqrt x) ie one argument
; 3. remove unnecessary args from "private" functions

;(define (square x) (* x x))
;(define (check-equal? x y) (= x y))
;(define (average a b) (/ (+ a b) 2.0))
;(define (good-enough? guess target)
;  (< (abs (- target (square guess)))
;     0.000001)
;  )
;(define (improve guess target)
;  average guess (/target guess)))
;(define (sqrt target guess)
;  (if (good-enough? guess target) guess
;      (sqrt target
;            (improve guess target))))

; TODO: fix me

(define (check-equal? x y) (= x y))


(define (sqrt x)
  (define (square x) (* x x))
  (define (check-equal? x y) (= x y))
  (define (average a b) (/ (+ a b) 2.0))

  (define target 1)

  (define (good-enough? guess target)
    (< (abs (- target (square guess)))
       0.000001)
    )

  (define (improve guess target)
    average guess (/ target guess))

  (define (sqrt-with-guess target guess)
    (if (good-enough? guess target) guess
        (sqrt-with-guess target guess)
        )
    improve(guess target)
    ))

  (sqrt-with-guess 9 1)

(check-equal? (sqrt 9) 3)
