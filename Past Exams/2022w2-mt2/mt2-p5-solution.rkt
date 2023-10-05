;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w2-mt2/mt2-p5)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line


(@htdf largest)
(@signature (listof (listof Natural)) -> (listof Natural))
;; produce list of largest numbers in each sublist
;; CONSTRAINT:
;;   Every sublist will contain at least one number, and all
;;   numbers are >= 0.
(check-expect (largest empty) empty)
(check-expect (largest (list (list 1)
                             (list 2)))
              (list 1 2))
(check-expect (largest (list (list 1 3 7)
                             (list 5 2 4)
                             (list 4 2 5 9 1 5)))
              (list 7 5 9))

;; *** As a reminder, you must not edit anything above this line!!! ***
;; *** You may add tests below here.                                ***


(@template-origin fn-composition use-abstract-fn)

(define (largest lolon)
  (map (lambda (lon)
         (foldr max 0 lon))
       lolon))
