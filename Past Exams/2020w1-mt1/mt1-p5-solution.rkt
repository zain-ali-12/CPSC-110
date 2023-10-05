;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2020W1-MT1-P5-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2020w1-mt1/mt1-p5)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 4) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 5)

;; Given the following definitions:

(define X 7)
(define Y 6)

(define (harmony a b)
  (or (< (+ a Y) b)
      (> (+ a Y) b)))


;; Show the step by step evaluation of the following expression.
;; To make it clear how we want you to write the steps we are showing
;; the first TWO of them.  The others should all follow.

(harmony (+ 2 6) (* X 2))

(harmony 8 (* X 2))

(harmony 8 (* 7 2))

(harmony 8 14)

(or (< (+ 8 Y) 14)
    (> (+ 8 Y) 14))

(or (< (+ 8 6) 14)
    (> (+ 8 Y) 14))

(or (< 14 14)
    (> (+ 8 Y) 14))

(or false
    (> (+ 8 Y) 14))

(or false
    (> (+ 8 6) 14))

(or false
    (> 14 14))

(or false
    false)

false



