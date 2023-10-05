;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p5-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2021w2-mt2/mt2-p5)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 4) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 5) ;DO NOT EDIT OR DELETE THIS LINE!


(@htdf euclid)
(@signature Natural Natural -> Natural)
;; produce greatest common divisor of a and b using Euclid's method
;; CONSTRAINT: a and b both > 0 
(check-expect (euclid 1 1) 1)
(check-expect (euclid 1 3) 1)
(check-expect (euclid 3 1) 1)
(check-expect (euclid 25 15) 5)
(check-expect (euclid 252 105) 21)
(check-expect (euclid 105 252) 21)

(@template-origin genrec)

(define (euclid a b)
  ;; Trivial: a = b
  ;; reduction: if a > b, then a becomes a - b, b remains b
  ;;            if a < b, then a remains a, b becomes b - a
  ;; argument: repeated subtraction of larger - smaller will
  ;;           close the gap between the numbers until they
  ;;           are the same
  (if (= a b)
      a
      (if (> a b)
          (euclid (- a b) b)
          (euclid a (- b a)))))

