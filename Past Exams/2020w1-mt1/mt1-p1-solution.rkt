;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p1-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2020w1-mt1/mt1-p1)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT DELETE this line
;;
;; Design a function called stack that takes two strings and returns an image
;; with the image of the shorter of the two strings displayed above the
;; image of the longer of the two strings.  If the two strings have the same
;; length, the image of the first should be above the image of the second.
;; Use the provided constants as values for the text size and text colour.
;; Ensure that you follow the complete htdf recipe and include every required
;; element.  Also include a commented out copy of your function template.
;;

(define TEXT-SIZE 30)
(define TEXT-COLOUR "red")

(@htdf stack)
(@signature String String -> Image)
;; produce an image with shorter string above longer one; first on top if =
(check-expect (stack "" "")
              (above (text "" TEXT-SIZE TEXT-COLOUR) 
                     (text "" TEXT-SIZE TEXT-COLOUR)))
(check-expect (stack "a" "b")
              (above (text "a" TEXT-SIZE TEXT-COLOUR) 
                     (text "b" TEXT-SIZE TEXT-COLOUR)))
(check-expect (stack "a" "abc")
              (above (text "a" TEXT-SIZE TEXT-COLOUR) 
                     (text "abc" TEXT-SIZE TEXT-COLOUR)))
(check-expect (stack "abc" "b")
              (above (text "b" TEXT-SIZE TEXT-COLOUR) 
                     (text "abc" TEXT-SIZE TEXT-COLOUR)))

;(define (stack s1 s2) empty-image) ; stub

(@template-origin String)

(@template
 (define (stack s1 s2)
   (... s1 s2)))

(define (stack s1 s2)
  (if (<= (string-length s1) (string-length s2))
      (above (text s1 TEXT-SIZE TEXT-COLOUR)
             (text s2 TEXT-SIZE TEXT-COLOUR))
      (above (text s2 TEXT-SIZE TEXT-COLOUR)
             (text s1 TEXT-SIZE TEXT-COLOUR))))

