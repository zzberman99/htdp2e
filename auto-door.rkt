;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname auto-door) (read-case-sensitive #t) (teachpacks ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "image.rkt" "teachpack" "2htdp")))))
;Explanation:
;Door-State -> Door-State
;There are 3 Door-States; open, closed and locked
;If the door is open the blue and yellow doors will be seperated and there will be a green light above the door frame
;If the door is closed the blue and yellow doors will be together and there will be a green light above the door frame
;If the door is locked the blue and yellow doors will be together and there will be a red light above the door frame
;If the door is open it will close in a matter of seconds
;If the door is closed it can be opened by hitting the "s" key (sensed), or locked by hitting the "l" key (lock)
;If the door is locked it can be unlocked by hitting the "u" key (unlock)



;Door-State -> Image
;Draws the picture of the given Door-State
(define (door-render ds)
  (cond
    [(string=? "locked" ds)
     (place-image (rectangle 200 50 "outline" "black") 250 100 
                  (place-image (rectangle 20 10 "solid" "red") 250 70 
                               (place-image (rectangle 100 50 "solid" "yellow") 200 100 
                                            (place-image (rectangle 100 50 "solid" "blue") 300 100 (empty-scene 500 100)))))]
    [(string=? "closed" ds)
     (place-image (rectangle 200 50 "outline" "black") 250 100 
                  (place-image (rectangle 20 10 "solid" "green") 250 70 
                               (place-image (rectangle 100 50 "solid" "yellow") 200 100 
                                            (place-image (rectangle 100 50 "solid" "blue") 300 100 (empty-scene 500 100)))))]
    [(string=? "open" ds)
     (place-image (rectangle 200 50 "outline" "black") 250 100 
                  (place-image (rectangle 20 10 "solid" "green") 250 70 
                               (place-image (rectangle 100 50 "solid" "yellow") 100 100 
                                            (place-image (rectangle 100 50 "solid" "blue") 400 100 (empty-scene 500 100)))))]))

;Door-State -> Door-State
;If the door is open it will be closed
(define (door-close ds)
  (cond
    [(string=? "open" ds) "closed"]
    [else ds]))

;Door-State -> Door-State
;All user interactions mentioned above are coded in this function
(define (door-action ds ke)
  (cond
    [(string=? "locked" ds)
     (cond
       [(string=? "u" ke) "closed"]
       [else "locked"])]
    [(string=? "closed" ds)
     (cond
       [(string=? "l" ke) "locked"]
       [(string=? "s" ke) "open"]
       [else "closed"])]
    [(string=? "open" ds) "open"]))

;Door-State -> Door-State
;Main function
(define (AutomaticDoor ds)
  (big-bang ds
            [to-draw door-render]
            [on-tick door-close 3]
            [on-key door-action]))