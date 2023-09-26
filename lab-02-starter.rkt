;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname lab-02-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment labs/lab-02)

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

;; HtDF Lab, Problem 1

;; PROBLEM:
;;
;; Design a function called square? that consumes an image and determines 
;; whether the image's height is the same as the image's width.
(@problem 1)
(@htdf square?) ;!!!UNCOMMENT this line when you start on this function

(@signature Image -> Boolean)
;; produce true if image width is the same as image height
;; and false otherwise.

(check-expect (square? (square 50 "solid" "blue")) true)
(check-expect (square? (rectangle 20 50 "solid" "blue")) false)
(check-expect (square? (rectangle 50 20 "solid" "blue")) false)


;(define (square? img) false) ;stub

(@template-origin Image)

(@template
 (define (square? img)
   (...img)))

(define (square? img)
  (= (image-height img)(image-width img)))



;; HtDF Lab, Problem 2

;; PROBLEM:
;; 
;; Design a function named underline that consumes an image 
;; and produces that image underlined by a black line of the same width. 
;; 
;; 
;; For example, 
;; 
;;   (underline (circle 20 "solid" "green"))
;; 
;; should produce
;;
;;   (above (circle 20 "solid" "green")
;;          (rectangle 40 2 "solid" "black"))
(@problem 2)
(@htdf underline) ;!!!UNCOMMENT this line when you start on this function

(@signature Image -> Image)
;;produce a given image with an underline added underneath

(check-expect (underline (square 50 "solid" "blue"))
              (above (square 50 "solid" "blue")
                     (rectangle 50 2 "solid" "black")))
(check-expect (underline (circle 50 "solid" "blue"))
              (above (circle 50 "solid" "blue")
                     (rectangle 100 2 "solid" "black")))
(check-expect (underline (rectangle 100 50 "solid" "blue"))
              (above (rectangle 100 50 "solid" "blue")
                     (rectangle 100 2 "solid" "black")))

;(define (underline img) empty-image) ;stub

(@template-origin Image)
(@template
 (define (underline img)
   (... img)))

(define (underline img)
  (above img (rectangle (image-width img) 2 "solid" "black")))



;; HtDF Lab, Problem 3

;; PROBLEM:
;; 
;; A (much too) simple scheme for pluralizing words in English is to add an 
;; s at the end unless the word already ends in s.
;; 
;; Design a function that consumes a string, and adds s to the end unless 
;; the string already ends in s.
(@problem 3)
(@htdf pluralize) ;!!!UNCOMMENT this line when you start on this function

(@signature String -> String)
;; add s to a string if it doesnt end with s

(check-expect (pluralize "banana") "bananas")
(check-expect (pluralize "trees") "trees")
(check-expect (pluralize "") "")


;(define (pluralize s) empty-string) ;stub


(@template-origin String)

(@template
 (define (pluralize s)
   (...s)))

(define (pluralize s)
  (if (or (string=? s "")
          (char=? (string-ref s (- (string-length s) 1)) #\s))
      s
      (string-append s "s")))
 

;; HtDF Lab, Problem 4

;; PROBLEM:
;; 
;; Design a function called nth-char-equal? that consumes two strings 
;; and a natural and produces true if the strings both have length greater 
;; than n and have the same character at position n.
;; 
;; 
;; Note, the signature for such a function is:
;; 
;; (@signature String String Natural -> Boolean)
;; 
;; 
;; The tag and template for such a function are:
;; 
;; (@template-origin String)
;; 
;; (@template (define (nth-char-equal? s1 s2 n)
;;              (... s1 s2 n)))
(@problem 4)

(@htdf nth-char-equal?) ;!!!UNCOMMENT this line when you start on this function

(@signature String String Natural -> Boolean)
;;check if two given strings are longer than n characters
;;then check if the nth character of both strings is equal

(check-expect (nth-char-equal? "hello" "hello" 2) true)
(check-expect (nth-char-equal? "hot" "cold" 1) true)
(check-expect (nth-char-equal? "phonecharger" "bottle" 7) false)
(check-expect (nth-char-equal? "hello" "byebye" 2) false)
(check-expect (nth-char-equal? "hello" "hello" 5) false)


(@template-origin String)
 
(@template (define (nth-char-equal? s1 s2 n)
             (... s1 s2 n)))


(define (nth-char-equal? s1 s2 n)
  (if (and (> (string-length s1) n)(> (string-length s2) n))
      (char=? (string-ref s1 n)(string-ref s2 n))
      false)
  )
