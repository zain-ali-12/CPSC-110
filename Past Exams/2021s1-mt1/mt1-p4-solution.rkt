;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2021s1-mt1/mt1-p4)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 4)

#|

 The following function design has one or more errors and/or other
 design flaws.  Please fix the error(s) and/or flaw(s) that you find.
 PLEASE NOTE THAT:

   - Any changes you make should preserve the existing design intent.

   - Don't change things that do not need to change.  Do not entirely
     rewrite the function to fix a small problem or small problems.
 
|#

(@htdf wider-than?)
(@signature Image Image Natural -> Boolean) ; result (1) 
;; produce true if the difference between the widths is at most n
;; CONSTRAINT: the first image is always wider than the second

(check-expect (wider-than? (rectangle 80 30 "solid" "blue")
                           (rectangle 20 30 "solid" "blue")
                           50)
              false)

; changed to = case (2) boundary case
(check-expect (wider-than? (rectangle 110 20 "solid" "blue")
                           (rectangle 50  40 "solid" "blue")
                           60)
              true)

(check-expect (wider-than? (rectangle 150 60 "solid" "blue")
                           (rectangle 100 10 "solid" "blue")
                           120)
              true)


;(define (wider-than? img1 img2 n) true)

(@template-origin Image)       ; added (3)

(@template
 (define (wider-than? img1 img2 n)
   (... img1 img2 n)))

(define (wider-than? img1 img2 n)
  (<= (- (image-width img1)    ; changed from < to <= (4)
         (image-width img2))
      n))
