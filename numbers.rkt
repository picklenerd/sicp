#lang racket

(require "common.rkt")

; Rational number

(define (make-rat n d)
  (let ((g (gcd n d))
        (s (* (sign n) (sign d))))
    (cons (* s (/ n g)) (abs (/ d g)))))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat(* (numer x) (numer y))
           (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (numer y) (denom x))))
(define (rat-eq? x y)
  (equal? (* (numer x) (denom y))
          (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(provide (all-defined-out))