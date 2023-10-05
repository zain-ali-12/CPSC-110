;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2021w2-mt2/mt2-p4)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 4) ;DO NOT EDIT OR DELETE THIS LINE!

(@htdf most-occurrences)
(@signature (listof Number) (listof Number) -> Natural)
;; number of occurrences of the number in l1 that the has most occurrences in l2
;; CONSTRAINT: there are no duplicates within lst1 
(check-expect (most-occurrences empty (list 2 3 1)) 0)
(check-expect (most-occurrences (list 3 1 2) empty) 0)
(check-expect (most-occurrences (list 4) (list 1 4 2 4 3)) 2)
(check-expect (most-occurrences (list 1 3 4 2)
                                (list 3 2 1 3 4 2 3 4 3 3))
              5)

;(define (most-occurrences l1 l2) 0)

(@template-origin fn-composition use-abstract-fn)

(define (most-occurrences l1 l2)
  (foldr max
         0
         (map (lambda (i1)
                (length (filter (lambda (i2) (= i2 i1)) l2)))
              l1))
  #;
  (local [(define (occurrences i1)
            (length (filter (lambda (i2) (= i2 i1)) l2)))]
    (foldr max
           0
           (map occurrences l1))))
