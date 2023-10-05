;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p5-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2023s-mt2/mt2-p6);Do not edit or remove this tag

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line
(@problem 6) ;do not edit or delete this line

(@htdf explode-pyramid)
(@signature String -> (listof (listof 1String)))
;; produce given string exploded into increasingly long lists of 1strings
(check-expect (explode-pyramid "") empty)
(check-expect (explode-pyramid "apple")
              (list (list "a")
                    (list "a" "p")
                    (list "a" "p" "p")
                    (list "a" "p" "p" "l")
                    (list "a" "p" "p" "l" "e")))

;(define (explode-pyramid s) empty)

(@template-origin fn-composition use-abstract-fn)

(define (explode-pyramid s)
  (build-list (string-length s)
              (lambda (x)
                (build-list (add1 x)
                            (lambda (x) (substring s x (add1 x)))))))
