;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname pset-03-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; DO NOT PUT ANYTHING PERSONALLY IDENTIFYING BEYOND YOUR CWL IN THIS FILE.
;; YOUR CWLs WILL BE SUFFICIENT TO IDENTIFY YOU AND, IF YOU HAVE ONE, YOUR
;; PARTNER.
;;

(require 2htdp/image)
(require 2htdp/universe)
(require spd/tags)

(@assignment psets/pset-03);Do not edit or remove this tag

;; If you are:
;;   - A 110 or 107 student replace the first set of '???'s with your cwl.
;;     For problem sets, If you have a partner, please replace the second
;;     set of '???'s with their cwl.  Remember this, it is what you will
;;     do with these @cwl annotations for the whole course.
;;   - A UBC Extended Learning student, replace the first set of ??? with
;;     your email address as confirmed in the email you received from
;;     extended learning.  The handin password is also in that email.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   
(@cwl sali34 ???)

;; Bounce a single ball around the screen.

;; IMPORTANT:
;;   This problem set will form the basis for problem sets 4 and 5 as well.
;;   You are strongly advised to put in the effort to do well on this
;;   problem set so that you then have an easier time with problem sets
;;   4 and 5.
;;

;; For this problem set you must complete the design of a world program.
;; The complete program must have the following behaviour:
;;   - there is a green background, with a single white ball
;;     bouncing around inside that box
;;   - when the ball hits the top/right/bottom/left of the box it
;;     bounces in the usual way a ball would bounce off of a wall
;;   - clicking the mouse replaces the ball with a new ball, at the
;;     current mouse position, and with a small random x,y velocity
;;
;; Note that we are giving you significant help in the starter file.
;; There is a complete data design, some complete helper functions, as
;; well as a some wish list entries.  You absolutely MUST
;;  - not edit any of the complete design elements we give you
;;  - complete the wish list entries we give you, and do so in a way
;;    that is consistent with the rest of the design we give you
;;  - must use the helpers we give you as part of your solution
;;
;; We recommend that you begin by first going through the entire file to
;; understand what is already complete and what you need to complete.
;;
(@problem 1)
(@htdw Ball)

;; Constants:
(define WIDTH  605)
(define HEIGHT 535)

(define BALL-RADIUS 10)

(define TOP (+ 0        BALL-RADIUS)) ;these constants define the "inner box"
(define BOT (- HEIGHT 1 BALL-RADIUS)) ;that constrains the center of the ball
(define LEF (+ 0        BALL-RADIUS)) ;
(define RIG (- WIDTH  1 BALL-RADIUS)) ;

(define BALL (circle BALL-RADIUS "solid" "white"))

(define MTS (rectangle WIDTH HEIGHT "solid" "green"))


;; ===========================================================================
;; ===========================================================================
;; Data definitions:

(@htdd Ball)

(define-struct ball (x y dx dy))
;; Ball is (make-ball Number Number Number Number)
;; interp. (make-ball x y dx dy) is ball
;;   - position x, y    in screen coordinates
;;   - velocity dx, dy  in pixels/tick
(define B1 (make-ball (/ WIDTH 2) (/ HEIGHT 2) 4 -3))

(@dd-template-rules compound)

(define (fn-for-ball b)
  (... (ball-x b) 
       (ball-y b) 
       (ball-dx b) 
       (ball-dy b)))



;; ===========================================================================
;; ===========================================================================
;; Functions:

(@htdf main)
(@signature Ball -> Ball)
;; start the game, call with (main B1)
;; <no tests for main functions>

(@template-origin htdw-main)

(define (main b)
  (big-bang b
    (on-draw   render-ball)   ;Ball -> Image
    (on-tick   next-ball)     ;Ball -> Ball
    (on-mouse  handle-mouse)));Ball Integer Integer MouseEvent -> Ball
            



(@htdf render-ball)
(@signature Ball -> Image)
;; place BALL on image at appropriate x, y coordinate
;; !!!

;Notes to help:
; - BALL is a constant
; - Ball object will have coords
; - For test cases, try
;   - top right, top left, bottom right, bottom left
;   - middle, middle top, left centre, middle bottom, right centre
;   - outside bounds, half in half out

(check-expect (render-ball (make-ball TOP LEF 0 0))
              (place-image BALL TOP LEF MTS))
(check-expect (render-ball (make-ball TOP RIG 0 0))
              (place-image BALL TOP RIG MTS))
(check-expect (render-ball (make-ball BOT RIG 0 0))
              (place-image BALL BOT RIG MTS))
(check-expect (render-ball (make-ball BOT LEF 0 0))
              (place-image BALL BOT LEF MTS))
(check-expect (render-ball (make-ball (/ TOP 2) (/ BOT 2) 0 0))
              (place-image BALL (/ TOP 2) (/ BOT 2) MTS))

; (define (render-ball b) MTS) ;stub

(@template-origin Ball)
(@template
 (define (render-ball b)
   (...b)))
  
(define (render-ball b)
  (place-image BALL (ball-x b) (ball-y b) MTS))


(@htdf next-ball)
(@signature Ball -> Ball)
;; produce ball at next x,y; checks bounces off top/right/bottom/left wall
(check-expect (next-ball     (make-ball (+ LEF 1) TOP  3 -4))
              (bounce-top    (make-ball (+ LEF 1) TOP  3 -4)))
(check-expect (next-ball     (make-ball (+ LEF 1) BOT  3  4))
              (bounce-bottom (make-ball (+ LEF 1) BOT  3  4)))
(check-expect (next-ball     (make-ball LEF (+ TOP 1) -3 4))
              (bounce-left   (make-ball LEF (+ TOP 1) -3 4)))
(check-expect (next-ball     (make-ball RIG (+ TOP 1)  3 4))
              (bounce-right  (make-ball RIG (+ TOP 1)  3 4)))
(check-expect (next-ball     (make-ball (/ WIDTH 2) (/ HEIGHT 2) 3 4))
              (glide         (make-ball (/ WIDTH 2) (/ HEIGHT 2) 3 4)))
#;
(define (next-ball b) b)

(@template-origin Number) ; Number because b is treated as atomic

(@template
 (define (next-ball b)
   (... b)))

(define (next-ball b)
  (cond [(touch-top?    b) (bounce-top b)]
        [(touch-bottom? b) (bounce-bottom b)]
        [(touch-right?  b) (bounce-right b)]
        [(touch-left?   b) (bounce-left b)]
        [else
         (glide b)]))


(@htdf handle-mouse)
(@signature Ball Integer Integer MouseEvent -> Ball)
;; replace ball with new ball on mouse click
;; NOTE: uses random, so testing has to use check-random
(check-random (handle-mouse (make-ball 1 2 3 4) 100 200 "button-down")
              (make-ball 100 200 (- 5 (random 11)) (- 5 (random 11))))
(check-random (handle-mouse (make-ball 1 2 3 4) 100 200 "button-up")
              (make-ball 1 2 3 4))
#;
(define (handle-mouse b x y me) b)

(@template-origin MouseEvent)

(@template
 (define (handle-mouse b x y me)
   (cond [(mouse=? me "button-down") (... b x y)]
         [else
          (... b x y)])))

(define (handle-mouse b x y me)
  (cond [(mouse=? me "button-down")
         (make-ball x y (- 5 (random 11)) (- 5 (random 11)))]
        [else b]))
        

(@htdf touch-top?)
(@signature Ball -> Boolean)
;; true if ball is going up and edge will hit or pass top edge of box
(check-expect (touch-top?    (make-ball LEF (+ TOP  5) 3 -4)) false)
(check-expect (touch-top?    (make-ball LEF (+ TOP  4) 3 -4)) true)
(check-expect (touch-top?    (make-ball LEF (+ TOP  1) 3 -2)) true)
(check-expect (touch-top?    (make-ball LEF (+ TOP  0) 3  2)) false)
#;
(define (touch-top? b) false)

(@template-origin Ball)

(@template
 (define (touch-top? b)
   (... (ball-x b) 
        (ball-y b) 
        (ball-dx b) 
        (ball-dy b))))

(define (touch-top? b)
  (<= (+ (ball-y b) (ball-dy b)) TOP))


(@htdf touch-bottom?)
(@signature Ball -> Boolean)
;; true if ball going down and edge will touch or pass bottom edge of box
;; !!!
(check-expect (touch-bottom?    (make-ball LEF (- BOT  5) 3 4)) false)
(check-expect (touch-bottom?    (make-ball LEF (- BOT  4) 3 4)) true)
(check-expect (touch-bottom?    (make-ball LEF (- BOT  1) 3 2)) true)
(check-expect (touch-bottom?    (make-ball LEF (- BOT  0) 3 -2)) false)

#;
(define (touch-bottom? b) false)

(@template-origin Ball)

(@template
 (define (touch-bottom? b)
   (... (ball-x b) 
        (ball-y b) 
        (ball-dx b) 
        (ball-dy b))))

(define (touch-bottom? b)
  (>= (+ (ball-y b) (ball-dy b)) BOT))


(@htdf touch-left?)
(@signature Ball -> Boolean)
;; true if ball going left and edge will touch or pass left edge of box
;; !!!

(check-expect (touch-left?    (make-ball (+ LEF 5) TOP -4 3)) false)
(check-expect (touch-left?    (make-ball (+ LEF 4) TOP -4 3)) true)
(check-expect (touch-left?    (make-ball (+ LEF 1) TOP -2 3)) true)
(check-expect (touch-left?    (make-ball (+ LEF 0) TOP  2 3)) false)
#;
(define (touch-left? b) false)

(@template-origin Ball)

(@template
 (define (touch-left? b)
   (... (ball-x b)
        (ball-y b)
        (ball-dx b)
        (ball-dy b))))

(define (touch-left? b)
  (<= (+ (ball-x b) (ball-dx b)) LEF))



(@htdf touch-right?)
(@signature Ball -> Boolean)
;; true if ball going right and edge will touch or pass right edge of box
;; !!!

(check-expect (touch-right?    (make-ball (- RIG 5) TOP  4 3)) false)
(check-expect (touch-right?    (make-ball (- RIG 4) TOP  4 3)) true)
(check-expect (touch-right?    (make-ball (- RIG 1) TOP  2 3)) true)
(check-expect (touch-right?    (make-ball (- RIG 0) TOP -2 3)) false)
#;
(define (touch-right? b) false)

(@template-origin Ball)

(@template
 (define (touch-right? b)
   (... (ball-x b)
        (ball-y b)
        (ball-dx b)
        (ball-dy b))))

(define (touch-right? b)
  (>= (+ (ball-x b) (ball-dx b)) RIG))


(@htdf bounce-top)
(@signature Ball -> Ball)
;; produce a ball with top edge 1 pixel off top of box, moving down
;; CONSTRAINT: assume ball is close to top edge and moving up
(check-expect (bounce-top (make-ball (+ LEF 1) (+ TOP 3) 2 -4))
              (make-ball (+ LEF 1) (+ TOP 1) 2  4))
(check-expect (bounce-top (make-ball (+ LEF 2) (+ TOP 6) 3 -7))
              (make-ball (+ LEF 2) (+ TOP 1) 3 7))
#;
(define (bounce-top b) b)

(@template-origin Ball)

(@template
 (define (bounce-top b)
   (... (ball-x b) 
        (ball-y b) 
        (ball-dx b) 
        (ball-dy b))))

(define (bounce-top b)
  (make-ball (ball-x b) (+ TOP 1) (ball-dx b) (- (ball-dy b))))


(@htdf bounce-bottom)
(@signature Ball -> Ball)
;; produce a ball that has bounced 1 pixel off of bottom edge of the box
;; CONSTRAINT: assume ball is close to bottom edge and moving down
;; !!!
(check-expect (bounce-bottom (make-ball (+ LEF 1) (- BOT 3) 2 4))
              (make-ball (+ LEF 1) (- BOT 1) 2 -4))
(check-expect (bounce-bottom (make-ball (+ LEF 2) (- BOT 6) 3 7))
              (make-ball (+ LEF 2) (- BOT 1) 3 -7))

#;
(define (bounce-bottom b) b)

(@template-origin Ball)

(@template
 (define (bounce-bottom b)
   (... (ball-x b) 
        (ball-y b) 
        (ball-dx b) 
        (ball-dy b))))

(define (bounce-bottom b)
  (make-ball (ball-x b) (- BOT 1) (ball-dx b) (- (ball-dy b))))


(@htdf bounce-left)
(@signature Ball -> Ball)
;; produce a ball that has bounced 1 pixel off of left edge of the box
;; CONSTRAINT: assume ball is close to left edge and moving left
;; !!!
(check-expect (bounce-left (make-ball (+ LEF 3) (- BOT 3) -2 4))
              (make-ball (+ LEF 1) (- BOT 3) 2 4))
(check-expect (bounce-left (make-ball (+ LEF 2) (- BOT 2) -3 7))
              (make-ball (+ LEF 1) (- BOT 2) 3 7))

#;
(define (bounce-left b) b)

(@template-origin Ball)

(@template
 (define (bounce-left b)
   (... (ball-x b) 
        (ball-y b) 
        (ball-dx b) 
        (ball-dy b))))

(define (bounce-left b)
  (make-ball (+ LEF 1) (ball-y b) (- (ball-dx b)) (ball-dy b)))


(@htdf bounce-right)
(@signature Ball -> Ball)
;; produce a ball that has bounced 1 pixel off of right edge of the box
;; CONSTRAINT: assume ball is close to right edge and moving right
;; !!!
(check-expect (bounce-right (make-ball (- RIG 3) (- BOT 3) 2 4))
              (make-ball (- RIG 1) (- BOT 3) -2 4))
(check-expect (bounce-right (make-ball (- RIG 2) (- BOT 2) 3 7))
              (make-ball (- RIG 1) (- BOT 2) -3 7))

#;
(define (bounce-right b) b)

(@template-origin Ball)

(@template
 (define (bounce-right b)
   (... (ball-x b) 
        (ball-y b) 
        (ball-dx b) 
        (ball-dy b))))

(define (bounce-right b)
  (make-ball (- RIG 1) (ball-y b) (- (ball-dx b)) (ball-dy b)))



(@htdf glide)
(@signature Ball -> Ball)
;; move ball by dx dy
;; CONSTRAINT: ball is not touching or about to touch any edge of the box
;; !!!

(check-expect (glide (make-ball (+ LEF 4)(- BOT 2) 2 -6))
              (make-ball (+ LEF 6)(- BOT 8) 2 -6))
(check-expect (glide (make-ball (- RIG 2)(+ TOP 4) 1 -2))
              (make-ball (- RIG 1)(+ TOP 2) 1 -2))

;(define (glide b) b)

(@template-origin Ball)
(@template
 (define (glide b)
   (... (ball-x b)
        (ball-y b)
        (ball-dx b)
        (ball-dy b))))

(define (glide b)
  (make-ball (+ (ball-x b)(ball-dx b))
             (+ (ball-y b)(ball-dy b))
             (ball-dx b)
             (ball-dy b)))