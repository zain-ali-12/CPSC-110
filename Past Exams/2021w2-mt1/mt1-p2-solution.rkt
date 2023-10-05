;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p2-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)



(@assignment exams/2021w2-mt1/mt1-p2)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE! (This is actually problem 2)

(@htdf first-quadrant?)
(@signature Number Number -> Boolean)
;; true if (x, y) is in first quadrant
(check-expect (first-quadrant?  5 10) true)
(check-expect (first-quadrant?  5 -4) false)
(check-expect (first-quadrant? -3  6) false)
(check-expect (first-quadrant?  0  1) false)
(check-expect (first-quadrant?  0  2) false)
(check-expect (first-quadrant?  3  0) false)
(check-expect (first-quadrant?  4  0) false)

;(define (first-quadrant? x y) false) ;stub

(@template-origin Number)

(@template
 (define (first-quadrant? x y)
   (... x y)))

(define (first-quadrant? x y)
  (and (> x 0) (> y 0)))
      
