;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname move-dot-exercise-ch4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")))))
(define (place-dot-at x)
  (place-image (circle 10 "solid" "red") x 50 (place-image (line 200 0 "black") 0 50 (empty-scene 100 100))))

(define (key-handler ws ke)
  (cond
    [(string=? "left" ke)
     (cond
       [(> ws 0)
        (- ws 1)]
       [else ws])]
    [(string=? "right" ke)
     (cond
       [(> 100 ws)
        (+ ws 1)]
       [else ws])]
    [else ws]))
    
(big-bang 50
          [to-draw place-dot-at]
          [on-key key-handler])