#lang racket

(require plot)

; stick jpl horizons ephemeris data into /tmp/data
(define data
  (for/list ([l (in-port read-line (open-input-file "/tmp/data"))])
    (match-let
        ([(list jd distance _)
          (map string->number (string-split l))])
      (vector (* 86400.0 (- jd 2440587.5)) distance)))
  )

(plot-x-ticks (date-ticks))
(plot-file
 (lines data)
 "venus.png"
 #:title "Earth-Venus Distance")


