;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab-03-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)
(require 2htdp/universe)

(@assignment labs/lab-03)

;; If you are:
;;   - A 110 or 107 student replace the first set of '???'s with your cwl.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   - A UBC Extended Learning student, replace the first set of ??? with
;;     the your email address as confirmed in the email you received from
;;     extended learning.  The handin password is also in that email.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   
(@cwl sali34 ???)

; Balloon popping

(@htdw Balloon)
;; CONSTANTS ==========================

(define WIDTH 500)
(define HEIGHT 500)
(define MTS (empty-scene WIDTH HEIGHT))

(define BALLOON-COLOR "red")
(define POP-IMAGE
  (overlay (text "POP!" 80 "black")
           (radial-star 30 (/ WIDTH 10) (/ WIDTH 2) "solid" "yellow")))

(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))

(define SPEED 2)

(define MAX-SIZE (/ WIDTH 2))





;; DATA DEFINITIONS ============================
 
(@problem 1)

(@htdd Balloon)
;; Balloon is one of:
;; -Natural
;; -Boolean
;; interp. balloon is either a radius [0, MAX] or is popped

(define B0 false)
(define B1 0)
(define B2 MAX-SIZE)
(define B3 1)


(@dd-template-rules one-of
                    atomic-non-distinct  
                    atomic-distinct) 

(define (fn-for-balloon b)
  (cond [(number? b) (... b)]
        [else(...)]))


;; FUNCTIONS ====================================
(@problem 2)
(@htdf main)
(@signature Balloon -> Balloon)  ;!!! UNCOMMENT once WS is replaced with
;;world state type
;; starts the world program with !!!
; no examples for main function

(@template-origin htdw-main)
(define (main Balloon)
  (big-bang Balloon               ; Balloon
    (on-tick tick)   ; Balloon -> Balloon
    (to-draw render) ; Balloon -> Image
    ;           (stop-when ...)  ; Balloon -> Boolean
    ;           (on-mouse ...)   ; Balloon Integer Integer MouseEvent -> Balloon
    ;           (on-key ...)     ; Balloon KeyEvent -> Balloon
    ))

(@problem 3)
(@htdf tick)
(@signature Balloon -> Balloon) ;!!! UNCOMMENT when WS i state type
;; produce the balloon grow by SPEED on each tick being less than MAX_SIZE
;; !!!
(check-expect (tick B1) (+ 0 SPEED))
(check-expect (tick B3) (+ 1 SPEED))
(check-expect (tick B0) false)
(check-expect (tick MAX-SIZE) false)
(check-expect (tick (- MAX-SIZE SPEED)) MAX-SIZE)
(check-expect (tick (- MAX-SIZE SPEED 1)) (- MAX-SIZE 1))
(check-expect (tick (- MAX-SIZE 1)) false)
(check-expect (tick SPEED) (+ SPEED SPEED))
(check-expect (tick 40) (+ 40 SPEED))
(check-expect (tick (+ MAX-SIZE 10)) false)


;(define (tick b) 0) ; stub

(@template-origin Balloon)

(@template
 (define (tick b)
   (cond [(number? b) (... b)]
         [else(...)])))

(define (tick b)
  (cond [(number? b)
         (if (> (+ b SPEED) MAX-SIZE)
             false
             (+ b SPEED))]
        [else false]))



(@problem 4)
(@htdf render)
(@signature Balloon -> Image) ;!!! UNCOMMENT whby world state type
;; render the balloon based on the inputs like radius
;; !!!


(check-expect (render 1) (place-image (circle 1 "solid" BALLOON-COLOR)
                                      CTR-X
                                      CTR-Y
                                      MTS))
(check-expect (render 0) (place-image (circle 0 "solid" BALLOON-COLOR)
                                      CTR-X
                                      CTR-Y
                                      MTS))
(check-expect (render MAX-SIZE) (place-image
                                 (circle MAX-SIZE "solid" BALLOON-COLOR)
                                 CTR-X
                                 CTR-Y
                                 MTS))
(check-expect (render false) (place-image POP-IMAGE
                                          CTR-X
                                          CTR-Y
                                          MTS))


;(define (render b) ...) ;stub

(@template-origin Balloon)
(@template
 (define (render b)
   (cond [(number? b) (... b)]
         [else(...)])))

(define (render b)
  (cond [(number? b)
         (place-image (circle b "solid" BALLOON-COLOR)
                      CTR-X
                      CTR-Y
                      MTS)]
        [else
         (place-image POP-IMAGE
                      CTR-X
                      CTR-Y
                      MTS)]))
