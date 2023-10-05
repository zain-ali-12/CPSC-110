;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w2-mt1/mt1-p1)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line

;; Given the following definitions:

(define BRAVO 2)
(define CHARLIE 4)

(define (foo x y z)
  (cond [(and (< x z) (< y z)) (* x y)]
        [else
         (if (> (sqr x) 10)
             (sqr y)
             (sqr z))]))

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

(foo BRAVO CHARLIE 3)


