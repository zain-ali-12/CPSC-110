;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname MT1-P1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2021s1-mt1/mt1-p1)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!

;; Given the following definitions:

(define FOO 7)
(define BAR 6)

(define (zeta x y z)
  (cond [(string=? x "gamma") (chi (- FOO z))]
        [(or (> y 2) (= (string-length x) y)) (+ z BAR)]
        [else (chi y)]))

(define (chi x)
  (* x FOO))

;;
;; Show the step by step evaluation of the following expression.
;;
;; None of your steps should be commented out. Put another way, 
;; do not use any comments of any kind below.  Also your program
;; must run without errors.
;;
;; NOTE: This question is entirely autograded, submitting a file
;; that does not run without errors will result in a score of 0.


(zeta "omicron" 4 (/ 10 2))
