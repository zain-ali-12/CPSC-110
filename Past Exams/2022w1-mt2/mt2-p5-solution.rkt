;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p4-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))

(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w1-mt2/mt2-p5)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line


(@htdf in-this-not-that)
(@signature Number (listof Number) (listof Number) -> Boolean)
;; produce true if a given number is in the first list, but not in the second
(check-expect (in-this-not-that 3 (list 1 3 5) (list 2 4 6)) true)
(check-expect (in-this-not-that 3 (list 1 3 5) (list 3))     false)
(check-expect (in-this-not-that 6 (list 1 5)   (list 2 4 6)) false)

(@template-origin fn-composition use-abstract-fn)
              
(define (in-this-not-that x this that)
  ;; There are numerous ways ways to write this. probably the simplest
  ;; is the following:
  ;;  two things have to be true -> and
  ;;    one of the elements of this must be x -> ormap
  ;;    every element of that must not be x   -> andmap
  (and (ormap (lambda (t) (= x t)) this)
       (andmap (lambda (t) (not (= x t))) that))
  #;
  (and (ormap (lambda (t) (= x t)) this)
       (not (ormap (lambda (t) (= x t)) that))))
