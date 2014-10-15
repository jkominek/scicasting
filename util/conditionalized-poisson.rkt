#lang racket

; say you've got a thing like tropical storms. your belief about the number
; of them occuring this year is poisson distributed. you'd like to make
; a graphical model where each tropical storm existing is conditioned on
; the prior one existing. so you want to know the probability of storm n+1
; given that n has occurred. bam, here you go. ...pretty sure this is right.

(require math
         math/distributions
         plot)

(define d (poisson-dist 8))

(define (p-next d v)
  (/ (- 1 (cdf d (+ v 1)))
     (- 1 (cdf d v))))

(plot (list #;(function (lambda (v) (- 1 (cdf d v))) 0 20)
            (function (lambda (v) (p-next d v)) 0 20)))

(for ([x (in-range 0 20)])
  (printf "~a ~a~n" (+ 1 x) (p-next d x)))
