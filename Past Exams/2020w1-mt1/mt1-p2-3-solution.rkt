;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p2-3-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

(@dd-template-rules one-of              ; 4 cases
                    atomic-distinct     ; "not shipped"
                    atomic-non-distinct ; Natural
                    atomic-distinct     ; "delivered"
                    atomic-distinct)    ; "lost"

(define (fn-for-delivery-status ds)
  (cond [(and (string? ds) (string=? ds "not shipped"))
         (...)]
        [(number? ds)
         (... ds)]
        [(and (string? ds) (string=? ds "delivered"))
         (...)]
        [else
         (...)]))

;;
;; Given the data definition for DeliveryStatus from problem 2, design a
;; function called delivered-before-tomorrow? that consumes a DeliveryStatus
;; and returns true if the package has been delivered or is expected to be
;; delivered before the end of day tomorrow.  Be sure to include all HtDF
;; design elements.
;;

(@problem 3)

(@htdf delivered-before-tomorrow?)
(@signature DeliveryStatus -> Boolean)
;; produce true if the package is delivered or will be before eod tomorrow

(check-expect (delivered-before-tomorrow? "delivered") true)
(check-expect (delivered-before-tomorrow? 0) true)
(check-expect (delivered-before-tomorrow? 1) true)
(check-expect (delivered-before-tomorrow? 2) false)
(check-expect (delivered-before-tomorrow? "not shipped") false)
(check-expect (delivered-before-tomorrow? "lost") false)

; (define (delivered-before-tomorrow? ds) false) ; stub

(@template-origin DeliveryStatus)

(@template
 (define (delivered-before-tomorrow? ds)
   (cond [(and (string? ds) (string=? ds "not shipped"))
          (...)]
         [(number? ds)
          (... ds)]
         [(and (string? ds) (string=? ds "delivered"))
          (...)]
         [else
          (...)])))

(define (delivered-before-tomorrow? ds)
  (cond [(and (string? ds) (string=? ds "not shipped"))
         false]
        [(number? ds)
         (<= ds 1)]
        [(and (string? ds) (string=? ds "delivered"))
         true]
        [else
         false]))
