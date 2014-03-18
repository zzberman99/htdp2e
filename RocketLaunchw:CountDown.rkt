;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname RocketLaunchw:CountDown) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")))))
(define height 300)
(define width 100)
(define ychange 10)
(define xrocket 50)
(define background (empty-scene width height))
(define rocket (rectangle 5 30 "solid" "red"))

(define (curpos rs)
  (cond
    [(string? rs)
     (place-image rocket xrocket height background)]
    [(<= rs 0)
     (place-image (text (number->string (abs rs)) 36 "red") xrocket xrocket (place-image rocket xrocket height background))]
    [(>= rs 0)
     (place-image rocket xrocket (- height (* rs ychange)) background)]))

(define (launch rs ke)
  (cond
    [(string? rs)
     (cond
       [(string=? " " ke) -10]
       [else rs])]
    [else rs]))

(define (move rs)
  (cond
    [(string? rs) rs]
    [else (+ rs 1)]))

(define (end rs)
  (cond
    [(string? rs) false]
    [else (> rs 33)]))

(define (main1 rs)
  (big-bang rs
            (to-draw curpos)
            (on-key launch)
            (on-tick move 1)
            (stop-when end)))