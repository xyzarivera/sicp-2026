#lang sicp

(define (check-equal? x y) (= x y))

; symbols
; it's a sqecial form (does not follow scheme's default substitution methond
; it doesnt evaulate the argument

(quote 43)
(quote ())
(quote '(1 2 3 4))
(quote (1 2 3 4))
(quote that)
(quote (+ 4 4))

;syntactic sugar
'43
'()
'(1 2 3 4)
''(1 2 3 4)
'(+ 2 2)

(+ '43 3) ; 46

(length `(1 2 4 5)) ; 4
(length `(+ 2 2)) ; 3 -- a list with + 2 and 2

(pair? `(1 2 3)) ; #t
(pair? (list 1 2 3)) ; #t
(equal? (list 1 2 3) '(1 2 3)); #t

; why is this useful?
; symbolic differentiation ???
; treat code as data -> turn it into data
; AST
; string foo
;

'foo

(define (fact n)
  (if (- n 1) 1
      (* n (fact (- n 1)))))
(fact 6) ;720  # ?? Why is it not printinggg

(define fact-code '(define (fact n) (if (- n 1) 1 (* n (fact (- n 1))))))
(length fact-code) ; 3
(caadr fact-code) ; fact
; usable for eval

(define (cons a b)
  (lambda (request)
    (cond
      ((= request 1) a)
      ((= request 2) b)
      (else (error "bad request")))))

(define (car c)
  (c 'car))

; function in (error) messages

;(= 'car 'car) ; DOESNT WORK
(equal? 'car 'car)
(eq? 'car 'car)
