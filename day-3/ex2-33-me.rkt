#lang sicp

(define (check-equal? x y) (= x y))
;

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op
                      initial
                      (cdr sequence)))))

;(accumulate + 0 '(1 2 3 4))  ; -> 10

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y))
              nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

; TODO
;(define (length sequence)
;  (accumulate ⟨??⟩ 0 sequence))

;(define (filter? proc sequence)
;  (accumulate ⟨??⟩ ⟨??⟩ sequence))

(map (lambda (x) (* x x)) '(1 2 3 4))  ;-> (1 4 9 16)
(append '(1 2) '(3 4))                 ;-> (1 2 3 4)
;(length '(1 2 3 4))                    ;-> 4
;(filter? even? '(1 2 3 4))             ;-> (2 4)

