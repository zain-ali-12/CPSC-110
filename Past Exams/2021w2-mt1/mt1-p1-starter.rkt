;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require 2htdp/universe)
(require spd/tags)

(@assignment exams/2021w2-mt1/mt1-p1)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE! 
#|
This file contains a simple world program. A user has reported a problem with
the program and you have been assigned to fix that problem.  When fixing the
problem you must comply with the company policy on bug fixing which says:

  When fixing a reported bug you should fix the bug as simply as possible,
  and without changing more of the program that is necessary. A bug fix is
  not the time to make other improvements to the program. 

  But, when fixing a bug, if you identify tests or missing tests that could
  have identified the bug then you should also improve the weak test and/or
  add one or more new tests. The goal of fixing the tests is to make sure
  the bug does not accidentally come back one day.


Here is the complaint received from a customer:

  I tried running the mouse tracker as specified in the instructions by first
  pressing the Dr Racket run button, and then typing (main MS1) <enter>, in
  the interactions window. The program runs and displays information, but
  the displayed information does not seem to follow the mouse properly.

Note that:
 - this problem will be autograded
 - you must not comment out any @ metadata tags
 - any submission for which Check Syntax fails will receive 0 marks
|#


;; A simple mouse tracker

(@htdw MouseState)

;; =================
;; Constants:

(define WIDTH 400)
(define HEIGHT 600)

(define TEXT-SIZE 20)
(define TEXT-COLOR "black")

(define SPACER (square 50 "outline" "white")) ;goes under text display to
;                                             ;leave space for mouse pointer

(define MTS (empty-scene WIDTH HEIGHT))


;; =================
;; Data definitions:

(@htdd MouseState)
(define-struct mstate (x y me))
;; MouseState is (make-mstate Integer Integer MouseEvent)
;; interp. the last known state of the mouse
;;         x, y are Integer positions
;;         me    is MouseEvent
(define MS1 (make-mstate 100 200 "button-down")) 
(define MS2 (make-mstate 300 400 "move"))

(@dd-template-rules compound);3 fields

(define (fn-for-mouse-state ms)
  (... (mstate-x ms)
       (mstate-y ms)
       (mstate-me ms)))


;; =================
;; Functions:

(@htdf main)
(@signature MouseState -> MouseState) 
;; start the world with (main MS1)

(@template-origin htdw-main)

(define (main s)
  (big-bang s                  
    (to-draw   handle-draw)    ; MouseState -> Image
    (on-mouse  handle-mouse))) ; MouseState Integer Integer MouseEvent
;;                             ;      -> MouseState

(@htdf handle-draw)
(@signature MouseState -> Image) 
;; display mouse state at its x,y 
(check-expect (handle-draw (make-mstate 300 200 "button-down"))
              (place-image (above (text "x: 300  y: 200" TEXT-SIZE TEXT-COLOR)
                                  (text "button-down" TEXT-SIZE TEXT-COLOR)
                                  SPACER)
                           300 200
                           MTS))
(check-expect (handle-draw (make-mstate 310 220 "move"))
              (place-image (above (text "x: 310  y: 220" TEXT-SIZE TEXT-COLOR)
                                  (text "move" TEXT-SIZE TEXT-COLOR)
                                  SPACER)
                           310 220
                           MTS))

;(define (handle-draw s) MTS)

(@template-origin MouseState)

(@template
 (define (handle-draw ms)
   (... (mstate-x ms)
        (mstate-y ms)
        (mstate-me ms))))
  
(define (handle-draw ms)
  (place-image (above (text (string-append "x: "
                                           (number->string (mstate-x ms))
                                           "  y: "
                                           (number->string (mstate-y ms)))
                            TEXT-SIZE
                            TEXT-COLOR)
                      (text (mstate-me ms) TEXT-SIZE TEXT-COLOR)
                      SPACER)
               (mstate-x ms)
               (mstate-y ms)
               MTS))


(@htdf handle-mouse)
(@signature MouseState Integer Integer MouseEvent -> MouseState)
;; produce new mouse state recording this mouse event
(check-expect (handle-mouse MS1 10 10 "move") (make-mstate 10 10 "move"))

;(define (handle-mouse ms x y me) ms)


;; *** NOTE: This function is templated correctly. The cond is correctly ***
;; ***       NOT part of the function definition.  So that is NOT THE    ***
;; ***       problem, do NOT put a cond back into this function and do   ***
;; ***       NOT change the template tag.                                ***


(@template-origin MouseEvent) ;using large enumeration rule, except all mouse events
;                             ;have same behaviour, so cond is eliminated entirely

(@template
 (define (handle-mouse ms x y me)
   (cond [(mouse=? me "button-down") (... ms x y)]
         [else
          (... ms x y)])))

(define (handle-mouse ms x y me)
  (make-mstate x x me))
