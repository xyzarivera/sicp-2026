#lang sicp

(define (check-equal? x y) (= x y))
;

; O(n)
; this is an iterative
(define (reverse l)
  (define (store-rev old-list new-list)
    (if (null? old-list) new-list
        (store-rev (cdr old-list) (cons (car old-list) new-list))))

  (store-rev l nil))


(reverse (list 1 4 9 16 25))
; (25 16 9 4 1)

; lecture: recursive
; O(n^2)
(define (reverse-r l)
  (if (null? l) l
      (append (reverse-r (cdr l)) (list (car l))))) ; append iterates also O(n)

(reverse-r (list 1 4 9 16 25))

; iterative recursion general strucutre
;(define (iterative-recursion l)
;  (define (inner ... ...)
;    (if (base-case) ...
;        (inner ...)))
;    inner)

; lecture
(define (reverse-i l)
  (define (inner remaining-list result-so-far)
    (if (...) ...
        (inner ...)))
    inner)

