#lang sicp

(define (check-equal? x y) (= x y))
;

(define l (cons 1 (cons 2 (cons 3 (cons 4 nil)))))

(define (only-one? l)(null? (cdr l)))
;(define (empty? l)(null? l))
(define empty? null?)

;(define (nth-element l n)
;  (if (only-one? l) (car l)
;      (nth-element (cdr l) (- n 1))))

; TODO FIX THIS
(define (nth-element l n)
  (display "n: ")(display n) (newline)
  (cond ((empty? l) (error "empty list or n too large"))
        ((- n 1) (car l))
        (else (nth-element (cdr l) (- n 1)))))

; SOMTHING IS WRONG IN COPYING FROM THE LECTURE LOL
(nth-element l 2)
;(check-equal? (nth-element l 2) 2)
;(check-equal? (nth-element l 4) 4)
;(nth-element l 5) ; error

(define (length l)
  (if (null? l) 0
      (+ 1 (length (cdr 1)))))

(define (append front back)
  ; (if (null? back) front - theoretically lol
  (if (empty? front) back
      (cons (car front)
            (append (cdr front) back))))

; (append (cons 1 nil) 2) ; ok!
(append (cons 1 (cons 2 nil)) 2)
(append (list 1 2 3) (list 4 5 6))
