;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2021w1-mt1/mt1-p2)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE! (This is actually problem 2)
;;
;; Design a function that consumes 3 numbers, and produces true if they are in
;; ascending order.  For example:
;;
;;  (in-order? 3 10 21)   should produce true
;;  (in order? 20 18 19)  should produce false
;;
;; Numbers that are equal are not in ascending order.
;;
;; The function must be called in-order?  You must include @htdf tag, @signature
;; tag, purpose, sufficient tests, a commented out stub, a template tag, and a
;; working function definition. We have provided you with the proper template
;; tag and template for a function like this.
;;
;; Any file for which Check Syntax fails will receive 0 marks.  
;;
(@htdf in-order?)

(@template-origin Number)

(@template
 (define (in-order? x y z)
   (... x y z)))

