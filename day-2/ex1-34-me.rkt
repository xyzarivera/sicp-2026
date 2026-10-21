#lang sicp

(define (f g) (g 2))

(define (square x) (* x x))

(f square)
;4

(f (lambda (z) (* z (+ z 1))))
;6

; (f f)
; application: not a procedure;
; expected a procedure that can be applied to arguments
;  given: 2
