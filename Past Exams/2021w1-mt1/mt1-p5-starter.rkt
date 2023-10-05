;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)
(require 2htdp/universe)

(@assignment exams/2021w1-mt1/mt1-p5)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE! (This is actually problem 5)

#|
Moody Cat

An unhappy cat walks across the screen, left to right and then right to left.
When it gets to the edge it turns around and walks back. On and on. But when
it is happy is does not move. Clicking the mouse on the cat changes it from
happy to unhappy, or unhappy to happy.


**** PROBLEMS ****

This is a partly complete world program.  There are two wish list entries, one
for tock-cat and one for render-cat.  You must complete those function designs.
Your designs must include all applicable HtDF recipe elements.

Your solution must be compatible with the rest of the file.  We want you to
design an appropriate tock-cat and render-cat FOR THIS PROGRAM.  It is not OK
to simply design tock-cat and render-cat functions that pass their tests!

NOTE ALSO THAT YOU MUST NOT CHANGE ANY OTHER PARTS OF THE FILE AT ALL. Any file
with changes outside the designs of tock-cat and render-cat will receive a
score of 0.  

To receive full credit your file MUST RUN AND PASS ALL TESTS.  To receive
substantial credit your file must pass the Check Syntax button.

|#


(@htdw Cat)

;; =================
;; Constants:

(define WIDTH 500)
(define HEIGHT 500)

(define MTS (empty-scene WIDTH HEIGHT))

(define EAR (triangle 17 "solid" "grey"))
(define HAPPY-EYE (text "^" 15 "black"))
(define UNHAPPY-EYE (circle 3 "solid" "black"))

;;
;; If you want, for **AFTER** the exam is done, cuter cats are at:
;;  (scale .25 (bitmap/url "https://docs.racket-lang.org/pict/pict_182.png"))
;;  (scale .25 (bitmap/url "https://docs.racket-lang.org/pict/pict_181.png"))
;;
(define HAPPY-CAT-IMAGE
  (overlay/offset
   (rotate 35 EAR) 15 18
   (overlay/offset
    (rotate -35 EAR) -15 18
    (overlay/offset
     (rotate -90 (text "3" 10 "black")) 0 -7
     (overlay/offset HAPPY-EYE -7 5
                     (overlay/offset HAPPY-EYE 7 5
                                     (circle 25 "solid" "grey")))))))

(define UNHAPPY-CAT-IMAGE 
  (overlay/offset
   (rotate 35 EAR) 15 18
   (overlay/offset
    (rotate -35 EAR) -15 18
    (overlay/offset
     (rotate -90 (text "3" 10 "black")) 0 -7
     (overlay/offset UNHAPPY-EYE -7 5
                     (overlay/offset UNHAPPY-EYE 7 5
                                     (circle 25 "solid" "grey")))))))

(define CAT-WIDTH  (image-width  HAPPY-CAT-IMAGE))
(define CAT-HEIGHT (image-height HAPPY-CAT-IMAGE))

;; Distance from the center of the cat to it's left/right top/bottom edges.
(define CAT-CTR-TO-L/R (/ CAT-WIDTH 2))
(define CAT-CTR-TO-T/B (/ CAT-HEIGHT 2))

;; Y coordinate of the center of the cat, to walk along the floor.
(define CAT-Y (- HEIGHT CAT-CTR-TO-T/B))

;; The furthest x coordinate the cat can reach without walking through walls.
;; Cats cannot walk through walls.
(define LEFT  CAT-CTR-TO-L/R)
(define RIGHT (- WIDTH CAT-CTR-TO-L/R))

(define MID (/ WIDTH 2)) ;just for convenience in tests

;; =================
;; Data definitions:

(@htdd Cat)
(define-struct cat (x unhappy-vel happy?))
;; Cat is (make-cat Number Number Boolean)
;;
;; interp. x is the x coordinate of the center of the cat.
;;         unhappy-vel is the velocity of the cat when unhappy.
;;         happy? is true cat does not move, false does move
;;
;; CONSTRAINT: x must be within [LEFT, RIGHT]

(define HAPPY-LEFT-CAT   (make-cat LEFT  2 true))
(define UNHAPPY-LEFT-CAT (make-cat LEFT -3 false))

(@dd-template-rules compound) ; 3 fields

(define (fn-for-cat c)
  (... (cat-x c)
       (cat-unhappy-vel c)
       (cat-happy? c)))


;; =================
;; Functions:

(@htdf main)
(@signature Cat -> Cat)
;; start the world with (main HAPPY-LEFT-CAT)

(@template-origin htdw-main)

(define (main c)
  (big-bang c
    (on-tick   tock-cat)
    (to-draw   render-cat)
    (on-mouse  handle-mouse)))


;;
;; **** PART A ****
;;
;; Complete the design of the render-cat function.
;; Your design must include all applicable HtDF recipe elements including
;; @signature and @template-origin tags.
;;
(@htdf render-cat)

(@signature Cat -> Image)
;; place happy/unhappy image of cat onto the MTS at correct position
;; !!!
(define (render-cat c) empty-image) ;stub



;;
;; **** PART B ****
;;
;; Complete the design of the tock-cat function.
;; Your design must include all applicable HtDF recipe elements including
;; @signature and @template-origin tags.
;;

(@htdf tock-cat)
(@signature Cat -> Cat)
;; happy cat doesn't move; unhappy moves by vel and turns around at wall
;; !!!
(define (tock-cat c) c) ;stub




(@htdf handle-mouse)

(@signature Cat Integer Integer MouseEvent -> Cat)
;; on mouse left invert cat happiness if it is under mouse x y

;; click within the bounds of cat
(check-expect (handle-mouse (make-cat RIGHT -3 false)
                            (+ RIGHT CAT-CTR-TO-L/R -1)
                            (+ CAT-Y CAT-CTR-TO-T/B -1)
                            "button-down")
              (make-cat RIGHT -3 true))

;; click outside the bound of a cat
(check-expect (handle-mouse (make-cat RIGHT -3 false)
                            (+ RIGHT CAT-CTR-TO-L/R 1)
                            (+ CAT-Y CAT-CTR-TO-T/B)
                            "button-down")
              (make-cat RIGHT -3 false))

;; non button-down event within bounds of cat
(check-expect (handle-mouse (make-cat RIGHT -3 false)
                            (+ RIGHT CAT-CTR-TO-L/R -1)
                            (+ CAT-Y CAT-CTR-TO-T/B -1)
                            "move")
              (make-cat RIGHT -3 false))

(@template-origin MouseEvent)

(@template
 (define (handle-mouse c x y me)
   (cond [(mouse=? me "button-down") (... c x y)]
         [else
          (... c x y)])))

(define (handle-mouse c x y me)
  (cond [(mouse=? me "button-down")
         (maybe-invert-happiness c x y)]
        [else c]))


(@htdf maybe-invert-happiness)

(@signature Cat Number Number -> Cat)
;; if cat is under the mouse x y coordinates invert its happiness

;; x and y within the bound of a cat
(check-expect (maybe-invert-happiness (make-cat RIGHT -3 false)
                                      (+ RIGHT CAT-CTR-TO-L/R -1)
                                      (+ CAT-Y CAT-CTR-TO-T/B -1))
              (make-cat RIGHT -3 true))

;; x and y outside the bound of a cat
(check-expect (maybe-invert-happiness (make-cat RIGHT -3 false)
                                      (+ RIGHT CAT-CTR-TO-L/R 1)
                                      (+ CAT-Y CAT-CTR-TO-T/B))
              (make-cat RIGHT -3 false))

(@template-origin Cat)

(@template
 (define (maybe-invert-happiness c x y)
   (... (cat-x c)
        (cat-unhappy-vel c)
        (cat-happy? c)
        x
        y)))

(define (maybe-invert-happiness c x y)
  (if (is-cat-selected? c x y)
      (make-cat (cat-x c)
                (cat-unhappy-vel c)
                (not (cat-happy? c)))
      c))



(@htdf is-cat-selected?)

(@signature Cat Integer Integer -> Boolean)
;; produce true if x, y is within +/- CAT-X/Y-BOUND of the cat's center x, y

;; around left edge
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                (- MID CAT-CTR-TO-L/R  1)
                                CAT-Y)
              false)
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                (- MID CAT-CTR-TO-L/R  0)
                                CAT-Y)
              true)
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                (- MID CAT-CTR-TO-L/R -1)
                                CAT-Y)
              true)

;; right edge
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                (+ MID CAT-CTR-TO-L/R  1)
                                CAT-Y)
              false)
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                (- MID CAT-CTR-TO-L/R  0)
                                CAT-Y)
              true)
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                (- MID CAT-CTR-TO-L/R -1)
                                CAT-Y)
              true)

;; top edge
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                MID
                                (- CAT-Y CAT-CTR-TO-T/B  1))
              false)
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                MID
                                (- CAT-Y CAT-CTR-TO-T/B  0))
              true)
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                MID
                                (- CAT-Y CAT-CTR-TO-T/B -1))
              true)

;; bottom edge
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                MID
                                (+ CAT-Y CAT-CTR-TO-T/B  1))
              false)
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                MID
                                (+ CAT-Y CAT-CTR-TO-T/B  0))
              true)
(check-expect (is-cat-selected? (make-cat MID 3 false)
                                MID
                                (+ CAT-Y CAT-CTR-TO-T/B -1))
              true)

(@template-origin Cat)

(@template
 (define (is-cat-selected? c x y)
   (... (cat-x c)
        (cat-unhappy-vel c)
        (cat-happy? c)
        x
        y)))

(define (is-cat-selected? c x y)
  (and (<= (- (cat-x c) CAT-CTR-TO-L/R) x (+ (cat-x c) CAT-CTR-TO-L/R))
       (<= (-  CAT-Y    CAT-CTR-TO-T/B) y (+  CAT-Y    CAT-CTR-TO-T/B))))
