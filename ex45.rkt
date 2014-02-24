;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex45) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")))))
(define (hapnum curhap)
  (place-image (text (number->string (floor curhap)) 12 "black") 50 50 (empty-scene 100 100)))

(define (subtenth curhap)
  (cond
    [(> curhap 0)
     (- curhap 1)]
    [else curhap]))

(define (key-handler curhap ke)
  (cond
    [(> curhap 0)
     (cond
       [(string=? "up" ke)
        (+ curhap 10)]
       [(string=? "down" ke)
        (+ curhap 5)]
       [else curhap])]
    [else curhap]))

(big-bang 100
            [to-draw hapnum]
            [on-tick subtenth]
            [on-key key-handler])