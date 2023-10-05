;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boxify-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require spd/tags)

(@assignment bank/htdf-p3)
(@cwl sali34)

(@problem 1)
;; Use the How to Design Functions (HtDF) recipe to design a function that
;; consumes an image, and appears to put a box around it. Note that you can do
;; this by creating an "outline" rectangle that is bigger than the image, and
;; then using overlay to put it on top of the image. 
;; For example:
;;
;; (boxify (ellipse 60 30 "solid" "red"))
;; should produce the image found in this link:
;; https://cs110.students.cs.ubc.ca/bank/boxify.png
;;
;; Remember, when we say DESIGN, we mean follow the recipe.
;;
;; Leave behind a commented out version of the stub.

(@htdf boxify)
(@signature Image -> Image)
;; Produce a box around a given image

(check-expect (boxify empty-image)
              (overlay (square 4 "outline" "black")
                       empty-image))

(check-expect (boxify (square 10 "solid" "red"))
              (overlay (square 14 "outline" "black")
                       (square 10 "solid" "red")))

(check-expect (boxify (rectangle 10 40 "solid" "purple"))
              (overlay (rectangle 14 44 "outline" "black")
                       (rectangle 10 40 "solid" "purple")))

(check-expect (boxify (ellipse 60 30 "solid" "red"))
              (overlay (rectangle 64 34 "outline" "black")
                       (ellipse 60 30 "solid" "red")))

;(define (boxify img) empty-image) ;stub

(@template-origin Image)

(@template
 (define (boxify img)
   (... img)))

(define (boxify img)
  (overlay
    (rectangle (+ (image-width img) 4)
               (+ (image-height img) 4)
               "outline"
               "black")
    img))

