;; The first three lines of this file were inserted by DrRacket. They record metadata
4;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p4-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w1-mt2/mt2-p4)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line



(@htdf colorbar)
(@signature Natural Natural (listof String) -> Image)
;; produce bar of squares of size s, of colors w/ name length < l
(check-expect (colorbar 100 5  (list "red" "blue" "yellow" "grey"))
              (beside (square 100 "solid" "red")
                      (square 100 "solid" "blue")
                      (square 100 "solid" "grey")))
(check-expect (colorbar 80 6  (list "orange" "turquoise" "grey" "brown"))
              (beside (square 80 "solid" "grey")
                      (square 80 "solid" "brown")))

(@template-origin fn-composition use-abstract-fn)
              
(define (colorbar s l loc)
  (foldr beside empty-image
         (map (lambda (n) (square s "solid" n))
              (filter (lambda (c) (< (string-length c) l))
                      loc))))


