#lang racket/base

; (c) 2014 Jay Kominek
; ISC License: http://opensource.org/licenses/ISC

; Interactive visualization of what happens when you make trades with
; market maker using Robin Hanson's Logarithmic Market Scoring Rule
;   http://hanson.gmu.edu/mktscore.pdf

(require racket/gui/base
         racket/class
         plot)

(define f
  (new frame% [label "LMSR Visualization"] [width 1280] [height 720]))

(define vp (new vertical-pane% [parent f]))

(define initial-value (box 0.5))
(define belief-value (box 0.5))
(define refresher (box #f))

; Do the probability division in log space, so we get fewer horrifying answers
(define log2 (log 2.0))
(define (lmsr-outcome start stop)
  (* -100.0 (- (/ (log start) log2)
               (/ (log stop) log2))))

(define (safety v)
  (if (void? v)
      0.0
      v))
(define (mean x y)
  (/ (+ x y) 2))

; bit of plot styling
(plot-x-ticks no-ticks)
(plot-font-size 12)
(line-width 2.5)

(define basic-x-ticks
  (list (tick 0.0 #t "0%")
        (tick 0.1 #t "10%")
        (tick 0.25 #t "25%")
        (tick 0.5 #t "50%")
        (tick 0.75 #t "75%")
        (tick 0.9 #t "90%")
        (tick 1.0 #t "100%")))
(define basic-lines
  (list (y-tick-lines) (x-tick-lines)))

(define (odds start stop)
  (let ([gain (lmsr-outcome start stop)]
        [loss (lmsr-outcome (- 1 start) (- 1 stop))])
    (if (>= (- gain 0.00001) 0 (+ loss 0.00001))
        (/ (+ gain (- loss)) (- loss))
        (void))))

(define (drawer c dc)
  (define start (unbox initial-value))
  (define belief (unbox belief-value))
  (define x-ticks/initial (cons (tick start #t "i") basic-x-ticks))
  (define x-ticks/belief (cons (tick belief #t "B") x-ticks/initial))
  
  ; Top left
  (plot/dc
   (list*
    (function (lambda (x) (lmsr-outcome start x)) 0.001 0.999
              #:color "green")
    (function (lambda (x) (lmsr-outcome (- 1.0 start) (- 1.0 x))) 0.001 0.999
              #:color "red")
    (point-label (vector 0.25 (lmsr-outcome start 0.25)) "Yes")
    (point-label (vector 0.75 (lmsr-outcome (- 1.0 start) 0.25)) "No")
    (x-ticks x-ticks/belief)
    basic-lines
    )
   dc 5 5 (- (/ 1280 2) 50) (- (/ 720 2) 50)
   #:x-min 0.0
   #:x-max 1.0
   #:x-label ""
   #:y-label "-Cost"
   #:y-min -500
   #:y-max (+ 50 (max (lmsr-outcome start 0.999)
                      (lmsr-outcome (- 1 start) 0.999))))

  ; Top Right
  (plot/dc
   (list*
    (function
     (lambda (x)
       (+ (* belief (lmsr-outcome start x))
                   (* (- 1.0 belief)
                      (lmsr-outcome (- 1.0 start) (- 1.0 x)))))
     0.001 0.999)
    (x-ticks x-ticks/belief)
    basic-lines
    )
   dc (/ 1280 2) 5 (- (/ 1280 2) 50) (- (/ 720 2) 50)
   #:x-min 0.0
   #:x-max 1.0
   #:x-label ""
   #:y-label "Expected Earnings"
   #:y-min -250
   #:y-max (+ 50
              (* belief (lmsr-outcome start belief))
              (* (- 1.0 belief)
                 (lmsr-outcome (- 1.0 start) (- 1.0 belief)))))

  ; Bottom Left
  (plot/dc
   (list*
    (function
     (lambda (x) (odds start x))
     start 0.999
     #:label "Yes" #:color "green")
    (function
     (lambda (x) (odds (- 1 start) (- 1 x)))
     0.001 start
     #:label "No" #:color "red")
    (x-ticks x-ticks/belief)
    (cdr basic-lines))
   dc 5 (- (/ 720 2) 50) (- (/ 1280 2) 50) (- (/ 720 2) 50)
   #:x-min 0.0
   #:x-max 1.0
   #:y-min 1.0
   #:x-label ""
   #:y-label "Odds")
  
  ; Bottom Right
  (plot/dc
   (list*
    (function
     (lambda (x) (* (+ (* belief (lmsr-outcome start x))
                       (* (- 1.0 belief)
                          (lmsr-outcome (- 1.0 start) (- 1.0 x))))
                    (odds start x)))
     start 0.999 #:label "Yes" #:color "green")
    (function
     (lambda (x) (* (+ (* belief (lmsr-outcome start x))
                       (* (- 1.0 belief)
                          (lmsr-outcome (- 1.0 start) (- 1.0 x))))
                    (odds (- 1 start) (- 1 x))))
     0.001 start #:label "No" #:color "red")
    (x-ticks x-ticks/belief)
    (cdr basic-lines))
   dc (/ 1280 2) (- (/ 720 2) 50) (- (/ 1280 2) 50) (- (/ 720 2) 50)
   #:x-min 0.0
   #:x-max 1.0
   #:y-min -0.001
   #:x-label ""
   #:y-label "Odds*Expected Earnings")

  )

(define initial-value-slider
  (new slider% [parent vp]
       [label "initial"]
       [min-value 1]
       [max-value 99]
       [init-value 50]
       [style '(horizontal horizontal-label plain)]
       [callback (lambda (s e)
                   (set-box! initial-value (/ (send s get-value) 100.0))
                   ((unbox refresher)))]))
(define belief-value-slider
  (new slider% [parent vp]
       [label "belief"]
       [min-value 1]
       [max-value 99]
       [init-value 50]
       [style '(horizontal horizontal-label plain)]
       [callback (lambda (s e)
                   (set-box! belief-value (/ (send s get-value) 100.0))
                   ((unbox refresher)))]))

(define c
  (new canvas% [parent vp]
       [paint-callback drawer]))
(set-box! refresher (lambda () (send c refresh-now)))
(send f show #t)

