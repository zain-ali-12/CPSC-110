;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2023s-mt1/mt1-p5)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line


#|

Given the following data definitions:

|#

(@htdd Flight)
(define-struct flight (ori des cap loa))
;; Flight is (make-flight String String Natural Natural)

;; interp. A flight, with (ori)gin country,
;;         (des)tination country,
;;         (cap)acity or max number of passengers,
;;         and (loa)d or number of passengers on the flight.

(define F1 (make-flight "Canada" "Denmark" 90 70))
(define F2 (make-flight "Canada" "Canada"  120 100))
(define F3 (make-flight "Brazil" "Canada"  250 180))

(@dd-template-rules compound)

(define (fn-for-flight f)
  (... (flight-ori f)
       (flight-des f)
       (flight-cap f)
       (flight-loa f)))

(@htdd ListOfFlight)
;; ListOfFlight is one of:
;; - empty
;; - (cons Flight ListOfFlight)
;; interp. a list of flights

(define LOF1 empty)
(define LOF2 (cons F2 (cons F3 empty)))

(@dd-template-rules one-of
                    atomic-distinct
                    compound
                    ref
                    self-ref)

(define (fn-for-lof lof)
  (cond [(empty? lof) (...)]
        [else
         (... (fn-for-flight (first lof))
              (fn-for-lof (rest lof)))]))

#|

Design a function that produces the total number of low load factor 
international flights. In other words, find the number of flights where
the origin and destination countries are different and load/capacity is
less than 0.8.

  (unprofitable-flights (cons F1 (cons F2 empty)))

should produce 1 since F1 is the only flight with different origin and
destination countries AND has load/capacity < 0.8.

  (unprofitable-flights (cons F3 (cons F1 (cons F2 empty))))

should produce 2 since both F3 and F1 both have different origin and
destination countries AND have load/capacity < 0.8.

This problem with be autograded. Failure to comply with any of the following
will result in a significantly reduced score, or in many cases 0.

 - The function must be called unprofitable-flights. 
 - It must accept its arguments in the order shown above.
 - You must not in any way edit, add to, or otherwise modify any of the
   data definition above.
 - You must not comment out any of the supplied @ metadata tags.
 - You must include @htdf tag, @signature tag, purpose, sufficient tests, a
   a commented out stub, a @template-origin tag, a @template tag, and a working
   function definition. 
 - There must be no errors when pressing Check Syntax.

|#

(@htdf unprofitable-flights)
