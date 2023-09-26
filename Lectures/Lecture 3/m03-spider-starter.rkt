;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m03-spider-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require 2htdp/universe)
(require spd/tags)

(@assignment lectures/m03-spider)

(@cwl sali34) ;replace ??? with your cwl


(@problem 1)
#|
PROBLEM:

Design a world program in which a spider starts at the top of the screen
and slowly drops down it. The spider should stop when it reaches the bottom
of the screen.

You can improve your spider by re-running the HtDW recipe to add these
features. 


  - Draw a line from the top of the screen to the spider, this is the thread 
    it is hanging from. You will need to use add-line for this. Look in the
    DrRacket help desk to see how add-line works.  [NOTE that adding this
    functionality will cause the autograder to complain, the autograder is
    just designed to grade the original problem.]
    
  - Arrange for pressing the space key to reset the spider to the top of 
    the screen.
|#



;; My world program  (make this more specific)

(@htdw Spider)

;; =================
;; Constants:
(define WIDTH 400) ;pixels
(define HEIGHT 600)
(define CTR-X (/ WIDTH 2)) ;WIDTH is the single point of control
(define SPEED 2) ;pixels per tick
(define SPIDER-RADIUS 10)
(define SPIDER-IMAGE (circle SPIDER-RADIUS "solid" "black"))
(define MTS (empty-scene WIDTH HEIGHT))
(define TOP (+ 0 SPIDER-RADIUS))
(define BOT (- HEIGHT 1 SPIDER-RADIUS))


;; =================
;; Data definitions:

(@htdd Spider)
;; Spider is Number (give WS a better name)
;; interp. y coordinate of the spider
;; distance of centre of spider from top of screen
;; CONSTRAINT: to be entirely visible, must be in [TOP,BOT]
(define MID (/ HEIGHT 2))

(@dd-template-rules atomic-non-distinct)

(define (fn-for-spider s)
  (... s))

;; =================
;; Functions:

(@htdf main)
(@signature Spider -> Spider)
;; start the world with (main TOP)
;;

(@template-origin htdw-main)

(define (main s)
  (big-bang s                    ; Spider
            (on-tick   tock)     ; Spider -> Spider
            (to-draw   render)   ; Spider -> Image
            (on-mouse  ...)      ; Spider Integer Integer MouseEvent -> Spider
            (on-key    ...)))    ; Spider KeyEvent -> Spider


;; WISH LIST ENTRY (TODO ITEM)
(@htdf tock)
(@signature Spider -> Spider)
;; produce the next by adding SPEED, stopping at BOT
;; !!!

(check-expect (tock TOP) (+ TOP SPEED))
(check-expect (tock (- BOT SPEED 1)) (- BOT 1))
(check-expect (tock (- BOT SPEED 0)) BOT)
(check-expect (tock (- BOT SPEED -1)) BOT)

;(define (tock s) ...);stub

(@template-origin Spider)
(@template
 (define (tock s)
   (... s)))

(define (tock s)
  (if (>= (+ s SPEED) BOT)
      BOT
      (+ s SPEED)))


(@htdf render)
(@signature Spider -> Image)
;; render SPIDER-IMAGE on MTS at its proper x and y

(check-expect (render TOP)
              (place-image SPIDER-IMAGE CTR-X TOP MTS))
(check-expect (render (/ HEIGHT 2))
              (place-image SPIDER-IMAGE CTR-X (/ HEIGHT 2) MTS))

;; !!!
;;(define (render s) ...) ;stub

(@template-origin Spider)

(@template
 (define (render s)
   (... s)))

(define (render s)
  (place-image))
