;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p5-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)
(require 2htdp/universe)

(@assignment exams/2022w2-mt1/mt1-p5)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line

#|
Falling Capsule

In this world program a capsule falls straight downwards with it's own y
velocity.  When it crosses the middle of the screen its speeds instantly slows
to 1/2 of its previous velocity.  At the bottom of the screen it stops.  When
it is above the middle it displays as red, >= the middle it is green.

This is a partly complete world program.  Two of the big-bang handler functions
are incomplete.

The render function is MISSING ONLY A COMPLETE FUNCTION DEFINITION.

The tock function is MISSING ONLY CHECK-EXEPCTS.

You must complete each function definition.

Note that this problem will be autograded.  Be sure to comply with the
following:

- You must not edit any parts of the file other than the function
  definition for render and the check-expects for tock.  Any edits
  to any other part of the file will result in 0 marks for both
  functions.

- Your solution must be compatible with the rest of the file.  

- To be eligible for full credit your file MUST RUN AND PASS ALL TESTS.

- To receive substantial credit your file must pass the Check Syntax button.

- Files with red errors will receive 0 marks.

|#


(@htdw Capsule)

;; =================
;; Constants:

(define WIDTH 200)
(define HEIGHT 600)

(define CAPSULE-WIDTH  10)
(define CAPSULE-HEIGHT 30)

(define CTR-X (/ WIDTH 2))


(define TOP (+ 0      0 (/ CAPSULE-HEIGHT 2)))
(define BOT (- HEIGHT 1 (/ CAPSULE-HEIGHT 2)))

(define MID (/ HEIGHT 2)) ;capsule slows instantly at this height

(define MTS (empty-scene WIDTH HEIGHT))

(define HI-CAPSULE-IMAGE                                   ;when y < MID
  (rectangle CAPSULE-WIDTH CAPSULE-HEIGHT "solid" "red"))

(define LO-CAPSULE-IMAGE                                   ;when y >= MID
  (rectangle CAPSULE-WIDTH CAPSULE-HEIGHT "solid" "green"))


;; =================
;; Data definitions:

(@htdd Capsule)

(define-struct capsule (y dy))
;; Capsule is (make-capsule Number Number)
;;
;; interp. y is the y coordinate of the center of the capsule.
;;         dy is the y velocity
;;
;; CONSTRAINT: y  must be within [TOP, BOT]
;;             dy must be non-negative

(@dd-template-rules compound)

(define (fn-for-capsule c)
  (... (capsule-y c)
       (capsule-dy c)))


;; =================
;; Functions:

(@htdf main)
(@signature Capsule -> Capsule)
;; start the world with (main (make-capsule TOP 10))

(@template-origin htdw-main)

(define (main c)
  (big-bang c
    (on-tick   tock)
    (to-draw   render)))



(@htdf render)

(@signature Capsule -> Image)
;; put correct image at CTR-X, y. HI image when y < MID, LO image when y >= MID
(check-expect (render (make-capsule (- MID 1) 3))
              (place-image HI-CAPSULE-IMAGE CTR-X  (- MID 1) MTS))
(check-expect (render (make-capsule (+ MID 0) 4))
              (place-image LO-CAPSULE-IMAGE CTR-X  (+ MID 0) MTS))
(check-expect (render (make-capsule (+ MID 1) 5))
              (place-image LO-CAPSULE-IMAGE CTR-X  (+ MID 1) MTS))

;(define (render c) empty-image) ;stub

(@template-origin Capsule)

(@template
 (define (render c)
   (... (capsule-y c)
        (capsule-dy c))))

;;
;; **** PART A ****
;;
;; Complete the design of the render function by commenting out the stub
;; and then adding a complete and correct render function definition.
;; The provided function check-expects are valid. Again, you MUST NOT edit any
;; part of this function design except to add a complete function definition.
;;

(define (render c)
  (place-image (if (< (capsule-y c) MID)
                   HI-CAPSULE-IMAGE
                   LO-CAPSULE-IMAGE)
               CTR-X
               (capsule-y c)
               MTS))




(@htdf tock)
(@signature Capsule -> Capsule)
;; add dy to y. When crossing MID half dy, at STOP at BOT.

;;
;; **** PART B ****
;;
;; Complete the design of the tock function by adding check-expects.
;; ALL your tests must be valid.
;; Taken together your tests should be thorough.
;; The provided function definition is correct. Again, you MUST NOT edit any
;; part of this function design except to add check-expects.
;;

(check-expect (tock (make-capsule (- MID  1 3) 3)) (make-capsule (- MID  1) 3))
(check-expect (tock (make-capsule (- MID  0 4) 4)) (make-capsule (- MID  0) 2))
(check-expect (tock (make-capsule (- MID -1 6) 6)) (make-capsule (- MID -1) 3))

(check-expect (tock (make-capsule (- BOT  1 3) 3)) (make-capsule (- BOT  1) 3))
(check-expect (tock (make-capsule (- BOT  0 2) 2)) (make-capsule    BOT     0))
(check-expect (tock (make-capsule (- BOT -1 4) 4)) (make-capsule    BOT     0))

;(define (tock c) c) ;stub

(@template-origin Capsule)

(@template
 (define (tock c)
   (... (capsule-y c)
        (capsule-dy c))))

(define (tock c)
  (cond [(>= (+ (capsule-y c) (capsule-dy c)) BOT) (make-capsule BOT 0)]
        [(and (<  (capsule-y c)                    MID)  ;does c cross MID
              (>= (+ (capsule-y c) (capsule-dy c)) MID)) ;on this tick?
         (make-capsule (+ (capsule-y c) (capsule-dy c))
                       (/ (capsule-dy c) 2))]
        [else
         (make-capsule (+ (capsule-y c) (capsule-dy c))
                       (capsule-dy c))]))
