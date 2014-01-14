;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname ex36) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")))))
;number -> image
;given the radius of the wheel of the car the bottom of the car is constructed
(define (car-bottom wheel-radius)
  (rectangle (* wheel-radius 8) (* wheel-radius 2) "solid" "blue"))
;number -> image
;given the radius of the wheel of the car the top of the car is constructed
(define (car-top wheel-radius)
  (rectangle (* wheel-radius 4) (* wheel-radius 2) "solid" "blue"))
;number -> image
;given the radius of the wheel of the car a wheel of the car is constructed
(define (car-wheels wheel-radius)
  (circle wheel-radius "solid" "black"))
;number -> image
;given the radius of the wheel of the car the car the entire car is assembled
(define (assemble-car wheel-radius)
  (overlay/xy
   (overlay/xy
    (overlay/xy (car-bottom wheel-radius) wheel-radius wheel-radius (car-wheels wheel-radius))
   (* wheel-radius 5) wheel-radius (car-wheels wheel-radius))
  (* wheel-radius 2) (- wheel-radius (* wheel-radius 2)) (car-top wheel-radius)))
; worldstate -> worldstate
; the clock ticked; move the car by three pixels
(define (tock ws)
  (+ ws 3))
; worldState -> image
; according to given world state place the car into the scene
(define (render ws wheel-radius)
  (place-image (assemble-car wheel-radius) ws (* wheel-radius 4) (empty-scene (* wheel-radius 90) (* wheel-radius 8))))