#lang sicp

(define (check-equal? x y) (= x y))
;

(define (reverse l)
  (display "reverse ")(display l) (newline)
  (define (store-rev old-list new-list)
    (if (null? old-list) new-list
        (store-rev (cdr old-list) (cons (car old-list) new-list))))

  (store-rev l nil))

; TODO: fix me
(define (deep-reverse l)
  (define (store-deep-rev old-list new-list)
    (display old-list) (display new-list) (newline)

    (cond
      ((null? old-list) (display "null") new-list)
      ((pair? old-list) (display "pair") (newline) (cons (reverse (car old-list)) (list (reverse (cdr old-list)))))
      ;(else (append (deep-reverse (car old-list)) (deep-reverse (cdr old-list))))))
      (else (display "else") (newline) (cons(reverse (car old-list)) (reverse (cdr old-list))))))

  (store-deep-rev l '())
  )

(define (deep-reverse-harry t)
  (cond
    ((null? t) t)
    ((pair? (car t)) (append
                      (deep-reverse-harry (cdr t))
                      (list (deep-reverse-harry (car t)))))
    (else (append (deep-reverse-harry (cdr t)) (list (car t))))))

(define (deep-reverse-mushida t)
  (cond
    ((pair? t) (append
               (deep-reverse-mushida (cdr t))
               (list (deep-reverse-mushida (car t)))))
    (else t)))




(define x
  (list (list 1 2) (list 3 4)))

x
;((1 2) (3 4))

(reverse x)
;((3 4) (1 2))

;(deep-reverse x) ; TODO: fix me
;((4 3) (2 1))

(deep-reverse-harry x)
;((4 3) (2 1))

(deep-reverse-mushida x)
;((4 3) (2 1))
