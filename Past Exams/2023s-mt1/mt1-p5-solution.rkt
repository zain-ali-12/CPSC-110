;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p5-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2023s-mt1/mt1-p5)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

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



(@htdf unprofitable-flights)
(@signature ListOfFlight -> Natural)
;; produce number of flights w/ origin =/= desination and load/capacity < 0.8

(check-expect (unprofitable-flights empty) 0)
(check-expect (unprofitable-flights (cons F1 (cons F2 empty))) 1)
(check-expect (unprofitable-flights (cons F3 (cons F1 (cons F2 empty)))) 2)

;(define (unprofitable-flights lof) 0) ; stub

(@template-origin ListOfFlight)

(@template
 (define (unprofitable-flights lof)
   (cond [(empty? lof) (...)]
         [else
          (... (fn-for-flight (first lof))
               (unprofitable-flights (rest lof)))])))

(define (unprofitable-flights lof)
  (cond [(empty? lof) 0]
        [else
         (if (unprofitable-flight? (first lof))
             (add1 (unprofitable-flights (rest lof)))
             (unprofitable-flights (rest lof)))]))

(@htdf unprofitable-flight?)
(@signature Flight -> Boolean)
;; produce true if flight has origin != desination and load/capacity < 0.8

(check-expect (unprofitable-flight?
               (make-flight "Canada" "Canada" 100 81))
              false)
(check-expect (unprofitable-flight?
               (make-flight "United States" "United States" 100 80))
              false)
(check-expect (unprofitable-flight?
               (make-flight "Austria" "Austria" 100 79))
              false)
(check-expect (unprofitable-flight?
               (make-flight "Finland" "Mexico" 200 162))
              false)
(check-expect (unprofitable-flight?
               (make-flight "Chile" "Argentina" 100 79))
              true)
(check-expect (unprofitable-flight?
               (make-flight "Chad" "Australia" 200 158))
              true)

;(define (unprofitable-flight? f) false) ; stub

(@template-origin Flight)

(@template
 (define (unprofitable-flight? f)
   (... (flight-ori f)
        (flight-des f)
        (flight-cap f)
        (flight-loa f))))

(define (unprofitable-flight? f)
  (and (not (string=? (flight-ori f) (flight-des f)))
       (< (/ (flight-loa f) (flight-cap f)) 0.8)))
