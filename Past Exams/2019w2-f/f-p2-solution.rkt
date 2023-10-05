;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname f-p2-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2019w2-f/f-p2)

(@cwl ???)

(@problem 1) ;ignore, but DO NOT DELETE this line
(@problem 2)

(@htdf largest-num)
(@signature (listof Natural) -> Natural)
;; produce largest number in list
;; CONSTRAINT: List has at least one element
(check-expect (largest-num (list 4)) 4)
(check-expect (largest-num (list 4 3 1 9 87 22 100)) 100)
(check-expect (largest-num (list 9 23 10 11)) 23)

;; SOLUTION
(@template-origin use-abstract-fn)

(define (largest-num lon)
  (foldr max (first lon) (rest lon)))

(@htdf at-least-as-long?)
(@signature (listof String) Natural -> Boolean)
;; produce true if every string in list has length >= given number
(check-expect (at-least-as-long? empty 2) true)
(check-expect (at-least-as-long? (list "good" "luck" "on" "finals") 2) true)
(check-expect (at-least-as-long? (list "enjoy" "the" "summer") 6) false)

;; SOLUTIONS
(@template-origin use-abstract-fn)

(define (at-least-as-long? los n)
  (andmap (lambda (s) (>= (string-length s) n)) los))

(@htdf any-positive-odd?)
(@signature (listof Integer) -> Boolean)
;; produce true if list contains a positive number that is odd
(check-expect (any-positive-odd? empty) false)
(check-expect (any-positive-odd? (list 1 3 2)) true)
(check-expect (any-positive-odd? (list -11 -3 2)) false)
(check-expect (any-positive-odd? (list -11 -3 2 13 4)) true)

;; SOLUTIONS
(@template-origin use-abstract-fn)

(define (any-positive-odd? lon)
  (ormap (lambda (n) (and (positive? n) (odd? n))) lon))
