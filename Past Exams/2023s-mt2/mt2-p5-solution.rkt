;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2023s-mt2/mt2-p5);Do not edit or remove this tag

(@cwl ???)   ;fill in your CWL here (same as for problem sets)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line

(@htdf max-width)
(@signature (listof Image) -> Natural)
;; produce width of widest image in list; 0 if list is empty
(check-expect (max-width empty) 0)
(check-expect (max-width (list (rectangle 20 10 "solid" "blue")
                               (rectangle 30 40 "solid" "blue")
                               (rectangle 10 20 "solid" "blue")))
              30)

;; *** Must not edit any line above here. ***

(@template-origin fn-composition use-abstract-fn)

(define (max-width loi)
  (foldr max 0 (map image-width loi)))
