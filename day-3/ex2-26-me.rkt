#lang sicp

(define (check-equal? x y) (= x y))

;

(define x (list 1 2 3))
(define y (list 4 5 6))

(append x y)
(append (list 1) 2)
; (append 1 (list 2)) <-error
; mcar: contract violation
;  expected: mpair?
;  given: 1
(display "error for appending a list") (newline)
(append (list 1) (list 2))

; append unwraps both arg
; append expects the 2nd arg as a list

(newline)

(cons x y)
(cons (list 1) 2)
(cons 1 (list 2))
(cons (list 1) (list 2))

; cons does not unwrap the 1st arg
; cons unwraps the 2nd arg to a list

(newline)

(list x y)
(list (list 1) 2)
(list 1 (list 2))
(list (list 1) (list 2))

; list does not unwraps both args
