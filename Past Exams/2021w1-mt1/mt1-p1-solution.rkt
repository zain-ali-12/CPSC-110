;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p1-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2021w1-mt1/mt1-p1)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!

;; Given the following definitions:

(define ALPHA 5)
(define BETA 7)


(define (foo x y)
  (bar ALPHA (+ y x)))

(define (bar a b)
  (if (or (< a b) (zero? b))
      (* a BETA)
      (+ b ALPHA)))


;;
;; Show the step by step evaluation of the following expression.
;; Leave the expression below as the first step, after it write
;; the step that follows it and so on.
;;
;; None of your steps should be commented out. Put another way, 
;; do not use any comments of any kind below.  
;;
;; NOTE: This question is entirely autograded, your file must run
;; without errors. Submitting a file that has errors when it runs
;; will result in a score of 0.
;;

(foo -3 3)

(bar ALPHA (+ 3 -3))

(bar 5 (+ 3 -3))

(bar 5 0)

(if (or (< 5 0) (zero? 0))
    (* 5 BETA)
    (+ 0 ALPHA))

(if (or false (zero? 0))
    (* 5 BETA)
    (+ 0 ALPHA))

(if (or false true)
    (* 5 BETA)
    (+ 0 ALPHA))

(if true
    (* 5 BETA)
    (+ 0 ALPHA))

(* 5 BETA)

(* 5 7)

35
