;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MT1-P5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
(require spd/tags)

(@assignment exams/2021s1-mt1/mt1-p5)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 4) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 5)
#|

In this problem you will complete the design of a world program.

The world is about a spinning star. The world can be started with the star WS1.
On tick, the star will spin counter-clock-wise. In other words the angle of
the star will change by SPEED degrees.

Clicking c on the keyboard will cause the color of the star to change to the
next color in the enumeration. For example the next color after red will be
white. 

To render the world star, use the star primitive in (2htdp/image)
(star side-length mode color)
Use the provided constants for the side-length and mode.

The domain analysis for this program is in mt1-p5-figure.pdf file.

To complete this program you must do the following
1. Complete the data definition for WorldStar
2. Work through the wish list until done

|#


;; Spinning Star

(@htdw WorldStar)

;; =================
;; Constants:

(define WIDTH  200)
(define HEIGHT 200)

(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))

(define LEN 20)        ;star side-length
(define MODE "solid")  ;the mode for the star
(define SPEED 5)       ;spin speed in degrees per tick

(define MTS (empty-scene WIDTH HEIGHT "black"))

;; =================
;; Data definitions:


(@htdd UniColor)
;; UniColor is one of:
;; - "white"
;; - "orange"
;; - "blue"
;; - "red"
;; interp. the color of an image 

(@dd-template-rules  one-of
                     atomic-distinct
                     atomic-distinct
                     atomic-distinct
                     atomic-distinct)

(define (fn-for-uni-color uc)
  (cond [(string=? uc "white")  (...)]
        [(string=? uc "orange") (...)]
        [(string=? uc "blue")   (...)]
        [(string=? uc "red")    (...)]))
        

(@htdd WorldStar)
(define-struct wstar (rot col))
;; Star is (make-wstar Integer UniColor)
;; interp. the state of a star, where
;;         rot is the angle of rotation in degrees
;;         col is the color of the star
(define WS1 (make-wstar 0   "white"))
(define WS2 (make-wstar 90  "orange"))

;; TASK 1: Complete the Data Definition for WorldStar







       

;; =================
;; Functions:

(@htdf main)
(@signature WorldStar -> WorldStar)
;; start the world with (main WS1)

(@template-origin htdw-main)

(define (main ws)
  (big-bang ws               ; WorldStar
    (on-tick  spin)          ; WorldStar -> WorldStar
    (to-draw  render)        ; WorldStar -> Image
    (on-key   handle-key)))  ; WorldStar KeyEvent -> WorldStar


;; TASK 2. Work through the wish list until done


(@htdf spin)
(@signature WorldStar -> WorldStar)
;; update ws by increasing rotation by SPEED degrees
; !!!

(define (spin ws) ws)


(@htdf render)
(@signature WorldStar -> Image)
;; place appropriate rotated and colored star at the center of MTS
; !!!
(define (render ws) MTS)


(@htdf handle-key)
(@signature WorldStar KeyEvent -> WorldStar)
;; on key "c" update ws by changing (wstar-col ws) to next color in enumeration
; !!!
(define (handle-key ws ke) ws)

