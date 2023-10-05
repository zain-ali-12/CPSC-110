;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2020W1-MT1-P2-P3-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2020w1-mt1/mt1-p2-3)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT DELETE OR EDIT THIS LINE!

(@problem 2)
;; 
;; For the following type comment, complete the @dd-template-rules tag and
;; template function definition.  Ensure that you include all required guards,
;; you may simplify cond questions or not at your choice.

(@htdd DeliveryStatus)
;; DeliveryStatus is one of:
;; - "not shipped"
;; - Natural
;; - "delivered"
;; - "lost"
;; interp. The status of a package delivery. If Natural is the remaining
;;         days till delivery. 0 means to be delivered today.

(@dd-template-rules  <edit here> )

(define (fn-for-delivery-status ds)
  <edit here>)




(@problem 3)
;;
;; Given the data definition for DeliveryStatus from problem 2, design a
;; function called delivered-before-tomorrow? that consumes a DeliveryStatus
;; and returns true if the package has been delivered or is expected to be
;; delivered before the end of day tomorrow.  Be sure to include all HtDF
;; design elements.
;;
