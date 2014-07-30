#lang racket

; Produces some plots based on the LMSR, to help with understanding why
; certain trades are good, or bad, and exactly how good, or bad they are.

(require plot)

; Robin Hanson's LMSR formula, but with the probability
; division done in log-space, so things don't go horribly
; wrong.
(define log2 (log 2.0))
(define (lmsr-outcome start stop)
  (* -100.0
       (- (/ (log start) log2)
          (/ (log stop) log2))))

(define (mean x y)
  (/ (+ x y) 2))

; we'll produce our ticks manually, later
(plot-x-ticks no-ticks)

; Plots the gain and loss for "Yes" and "No" from a given
; start to all other positions. Note that the "Yes" and "No"
; lines will always cross at start.
(define (plot-from start belief)
  (plot
   (list
    (function (lambda (x) (lmsr-outcome start x)) 0.0 1.0
              #:color "green")
    (function (lambda (x) (lmsr-outcome (- 1.0 start) (- 1.0 x))) 0.0 1.0
              #:color "red")
    (point-label (vector (mean 0.0 belief) (lmsr-outcome start (mean 0.0 belief))) "Yes")
    (point-label (vector (mean 1.0 belief) (lmsr-outcome (- 1.0 start) (- 1 (mean 1.0 belief)))) "No")
    (x-ticks (list (tick belief #t "B")
                   (tick start #t "C")
                   (tick 0.0 #t "0%")
                   (tick 0.1 #t "10%")
                   (tick 0.25 #t "25%")
                   (tick 0.5 #t "50%")
                   (tick 0.75 #t "75%")
                   (tick 0.9 #t "90%")
                   (tick 1.0 #t "100%")
                   ))
    (x-tick-lines)
    (y-tick-lines)
    )
   #:x-label ""
   #:y-min (max -450
                (min (lmsr-outcome start 0.01)
                     (lmsr-outcome start 0.99)
                     (lmsr-outcome (- 1 start) 0.01)
                     (lmsr-outcome (- 1 start) 0.99)))
   #:y-max (+ 50 (max (lmsr-outcome start 0.01)
                      (lmsr-outcome start 0.999)
                      (lmsr-outcome (- 1 start) 0.01)
                      (lmsr-outcome (- 1 start) 0.999)))
   ))

; Given the current position, and a belief, plot the
; expected value of all trades
(define (plot-expected-outcome start belief)
  (plot
   (list
    (function (lambda (x)
                (+ (* belief (lmsr-outcome start x))
                      (* (- 1.0 belief)
                         (lmsr-outcome (- 1.0 start) (- 1.0 x)))))
              0.0 1.0)
    (x-ticks (list (tick belief #t "B")
                   (tick start #t "C")
                   (tick 0.0 #t "0%")
                   (tick 0.1 #t "10%")
                   (tick 0.25 #t "25%")
                   (tick 0.5 #t "50%")
                   (tick 0.75 #t "75%")
                   (tick 0.9 #t "90%")
                   (tick 1.0 #t "100%")
                   ))
    (x-tick-lines)
    (y-tick-lines)
    )
   #:x-label ""
   #:y-min -200))

; Given the current position, and a belief, plot the
; expected value of all trades, relative to their cost.
(define (plot-expected-outcome/cost start belief)
  (plot
   (list
    (function (lambda (x)
                (/ (+ (* belief (lmsr-outcome start x))
                      (* (- 1.0 belief)
                         (lmsr-outcome (- 1.0 start) (- 1.0 x))))
                   (abs (min (lmsr-outcome start x)
                             (lmsr-outcome (- 1.0 start) (- 1.0 x))))))
              0.0 1.0)
    (x-ticks (list (tick belief #t "B")
                   (tick start #t "C")
                   (tick 0.0 #t "0%")
                   (tick 0.1 #t "10%")
                   (tick 0.25 #t "25%")
                   (tick 0.5 #t "50%")
                   (tick 0.75 #t "75%")
                   (tick 0.9 #t "90%")
                   (tick 1.0 #t "100%")
                   ))
    (x-tick-lines)
    )
   #:x-label ""
   ))

; Plot Kelly-style odds
(define (odds start stop)
  (let ([gain (lmsr-outcome start stop)]
        [loss (lmsr-outcome (- 1 start) (- 1 stop))])
    (if (>= gain 0 loss)
        (/ (+ gain (- loss)) (- loss))
        (void))))

(define (plot-odds start)
  (plot
   (list
    (function
     (lambda (x) (odds start x))
     start 1.0
     #:label "Yes" #:color "green")
    (function
     (lambda (x) (odds (- 1 start) (- 1 x)))
     0.0 start
     #:label "No" #:color "red")
    (x-ticks (list (tick start #t "C")
                   (tick 0.0 #t "0%")
                   (tick 0.1 #t "10%")
                   (tick 0.25 #t "25%")
                   (tick 0.5 #t "50%")
                   (tick 0.75 #t "75%")
                   (tick 0.9 #t "90%")
                   (tick 1.0 #t "100%")
                   ))
    (x-tick-lines)
    )
   #:x-label ""
   ))

(plot-from 0.036 0.17)
(plot-expected-outcome 0.036 0.17)
(plot-expected-outcome/cost 0.036 0.17)
(plot-y-transform log-transform)
(plot-odds 0.036)