;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m01-htdf-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require spd/tags)

(@assignment lectures/m01-htdf)

(@cwl sali34) ;replace ??? by your CWL


;; *****************************************************************************
;; NOTE:
;;
;; Your AUTOGRADER RESULTS will be found at the following address:
;;
;;    https://cs110.students.cs.ubc.ca/handback/12345678/
;;
;; Where you must replace 12345678 with your UBC student number.  You will need
;; to login with your CWL and CWL password.
;;
;;  For lecture starters you can get some feedback from the autograder during
;;  lecture, provided you can submit a file that passes the Check Syntax button
;;  at the top right of the Dr Racket window.
;;
;;  Especially at first it can be hard to get all your ( ) and "  " properly
;;  balanced, and so you might not be able to pass the Check Syntax.  If that
;;  happens then first start by getting the gist of the problem right.  You
;;  can (and should) go back after lecture to work the problem until you
;;  get autograder feedback saying it is 100% correct.
;;
;;  But for problem sets, labs, and exams you should not submit your file if
;;  Check Syntax produces an error.  Fix the error first, then submit.
;; *****************************************************************************


(@problem 1)
;;
;; Design a function, called topple, that takes an image and rotates it 
;; by 90 degrees.
;;

(@htdf topple)
(@signature Image -> Image)
;;rotate a given image by 90 degrees
;;(define (topple img) (rectangle 20 30 "solid" "blue"))  ;this is the stub

(check-expect (topple (rectangle 20 30 "solid" "blue"))
              (rectangle 30 20 "solid" "blue"))
(check-expect (topple (triangle  30 "solid" "blue"))
              (rotate 90 (triangle 30 "solid" "blue")))

(@template-origin Image)
(@template (define (double img) ;this is the template
  (... img)))


(define (topple img)
  (rotate 90 img))


(@problem 2)
;;
;; Design a function that consumes the name of something and produces a
;; "checkbox line" image that allows someone to check off that item.  For 
;; example (checkbox-line "apples") would produce an image with a small
;; check box next to the word apples.
;;

(@htdf checkbox-line)
(@signature String -> Image)
;;add a checkbox at the end of the string

(check-expect (checkbox-line "")
              (beside(square 20 "outline" "black")
                      (text "" 20 "black")))
(check-expect (checkbox-line "apples")
              (beside(square 20 "outline" "black")
                      (text "apples" 20 "black")))
(check-expect (checkbox-line "banana")
              (beside(square 20 "outline" "black")
                      (text "banana" 20 "black")))

;(define (checkbox-line str) empty-image) ;stub
(@template-origin String)
(@template
 (define (checkbox-line str)
   (... str)))

(define (checkbox-line str)
  (beside(square 20 "outline" "black")
          (text str 20 "black")))



(@problem 3)
;;
;; Design a function, that consumes an image and determines whether it is tall.
;;

(@htdf tall?)

(@signature Image -> Boolean)
;;return true if an the height of image is greater than the width of the image

(check-expect (tall? (rectangle 20 30 "solid" "red")) true)
(check-expect (tall? (rectangle 30 20 "solid" "red")) false)
(check-expect (tall? (rectangle 30 30 "solid" "red")) false)

;(define (tall? img) false) ; stub

(@template-origin Image)
(@template (define (tall? img) ;template
  (...img)))

(define (tall? img)
  (> (image-height img)(image-width img)))


(@problem 4)
;;
;; Design a function, called image>, that takes two images and determines 
;; whether the first is larger than the second.
;; For this function we are giving you the htdf tag, signature, template-origin
;; and template below.
;;

(@htdf image>)
(@signature Image Image -> Boolean)

(@template-origin Image)

(check-expect (image>
              (rectangle 20 30 "solid" "green")
              (rectangle 30 30 "solid" "green"))
              false)
(check-expect (image>
              (rectangle 20 30 "solid" "green")
              (rectangle 25 25 "solid" "green"))
              false)
(check-expect (image>
              (rectangle 20 30 "solid" "green")
              (rectangle 20 30 "solid" "green"))
              false)
(check-expect (image>
              (rectangle 30 30 "solid" "green")
              (rectangle 20 30 "solid" "green"))
              true)

(@template
 (define (image> i1 i2)
   (... i1 i2)))

(define (image> i1 i2)
  (> (*(image-height i1)(image-width i1))(*(image-height i2)(image-width i2))))



