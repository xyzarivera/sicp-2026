#lang sicp

(define (check-equal? x y) (= x y))
;

(define (double x) (* x 2))

(define (map fn l)
  (if (null? l) l
      (cons (fn (car l)) (map fn (cdr l)))))

(map double (list 1 2 3 4))
(list 2 4 6 8)

(define (filter fn l)
  (cond
    ((null? l) l)
    ((fn (car l)) (cons (car l) (filter fn (cdr l))))
    (else (filter fn (cdr l)))))

(define (no-odds x) (even? x))
(filter no-odds (list 1 2 3 4))
(list 2 4)

(define (reduce fn list acc)
  (if (null? list) acc
      (fn (car list) (reduce fn (cdr list) acc))))

(reduce
 (lambda (current-element result) (+ current-element result))
 (list 1 2 3 4)
 0 ) ; 10

(reduce
 +
 (list 1 2 3 4)
 0 ) ; 10

(reduce
 -
 (list 1 2 3 4)
 0 ) ; -2 ... so how is this computed?

(define (reduce-i fn list acc)
  (define (inner remaining result)
    (if (null? remaining) result
        (inner (cdr remaining) (fn (car remaining) result))))
  (inner list acc))

(reduce-i
 (lambda (current-element result) (+ current-element result))
 (list 1 2 3 4)
 0 ) ; 10

(reduce-i
 +
 (list 1 2 3 4)
 0 ) ; 10

(reduce-i
 -
 (list 1 2 3 4)
 0 ) ; 2 ... so how is this computed?

; see fold-left, fold-right = accumulate
