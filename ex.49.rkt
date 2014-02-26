;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex.49) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")))))
(define (traffic-light-next curclr)
   (cond
     [(string=? "red" curclr) "green"]
     [(string=? "green" curclr) "yellow"]
     [(string=? "yellow" curclr) "red"]))

(define (clrchanger curclr)
  (place-image (circle 50 "solid" (traffic-light-next curclr)) 50 50 (empty-scene 100 100)))

(big-bang "red"
          [to-draw clrchanger]
          [on-tick traffic-light-next 2])