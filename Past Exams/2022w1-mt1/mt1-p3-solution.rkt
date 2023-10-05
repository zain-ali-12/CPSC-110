;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname f-p1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2022w1-mt1/mt1-p3)



(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line

#|

Given the following data definition:

|#

(@htdd ListOfNatural)
;; ListOfNatural is one of:
;;  - empty
;;  - (cons Natural ListOfNatural)
;; interp. a list of natural numbers

(define LON1 empty)
(define LON2 (cons 1 (cons 0 (cons 4 empty))))

(@dd-template-rules one-of
                    atomic-distinct
                    compound
                    self-ref)

(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))



;; Functions

(@htdf drop-until-odd)


(@signature ListOfNatural -> ListOfNatural)
;; drop numbers from front of lon up to but not including first one that is odd
(check-expect (drop-until-odd empty) empty)
(check-expect (drop-until-odd (cons 3 empty)) (cons 3 empty))
(check-expect (drop-until-odd (cons 2 empty)) empty)
(check-expect (drop-until-odd (cons 2 (cons 3 (cons 4 empty))))
              (cons 3 (cons 4 empty)))

;(define (drop-until-odd lon) lon) ;stub

(@template-origin ListOfNatural)

(@template
 (define (drop-until-odd lon)
   (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (drop-until-odd (rest lon)))])))


(define (drop-until-odd lon)
  (cond [(empty? lon) empty]
        [else
         (if (odd? (first lon))
             lon
             (drop-until-odd (rest lon)))]))
