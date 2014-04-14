;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |ex. 57|) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")))))
(define (tl-render light-state)
  (cond
    [(string=? "green" light-state)
     (place-image (circle 40 "solid" "green") 50 50 
               (place-image (circle 40 "outline" "black") 50 150 
                            (place-image (circle 40 "outline" "black") 50 250 (rectangle 100 300 "outline" "black"))))]
    [(string=? "yellow" light-state)
     (place-image (circle 40 "outline" "black") 50 50 
               (place-image (circle 40 "solid" "yellow") 50 150 
                            (place-image (circle 40 "outline" "black") 50 250 (rectangle 100 300 "outline" "black"))))]
    [(string=? "red" light-state)
     (place-image (circle 40 "outline" "black") 50 50 
               (place-image (circle 40 "outline" "black") 50 150 
                            (place-image (circle 40 "solid" "red") 50 250 (rectangle 100 300 "outline" "black"))))]))

(define (tl-next light-state)
  (cond
    [(string=? "green" light-state) "yellow"]
    [(string=? "yellow" light-state) "red"]
    [(string=? "red" light-state) "green"]))

(define (traffic-light-simulation initial-state)
  (big-bang initial-state
            [to-draw tl-render]
            [on-tick tl-next 1]))