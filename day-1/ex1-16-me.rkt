#lang sicp

(define (check-equal? x y) (= x y))

; design iterative version
; hint: iteration involves carrying the result and all other information forward from the previous step

(define (fast-expt-recurs b n)
    (cond ((= n 0) 1)
          ((even? n) (fast-expt-recurs (* b b) (/ n 2)))
	  (else (* b (fast-expt-recurs b (- n 1))))))

;(check-equal? (fast-expt-recurs 2 8) 256)

(define (fast-expt-iter b n)
    (define (iter b n result)
        (cond ((= n 0) result)
	      ((even? n) (fast-expt-iter (* b b) (/ n 2)))
	      (else (* b (fast-expt-iter b (- n 1))))
	)
    )
    (iter b n 1)
 )

;(check-equal? (fast-expt-iter 2 8) 256)

