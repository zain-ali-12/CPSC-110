;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p3-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2022w1-mt2/mt2-p3)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line

(define P3-PART-1 "D")

(define P3-PART-2 "B")

(define P3-PART-3 "D")

(define P3-PART-4 6)

(define P3-PART-5 3)



;;============================================================================
;;============================================================================
;;============================================================================
;; You should ignore this code.  Do not read or edit below here.
;;
;; This code is here so that running the file will verify that your answer is
;; well formed.

(check-satisfied P3-PART-1 one-of-A-B-C-D)
(check-satisfied P3-PART-2 one-of-A-B-C-D-E)
(check-satisfied P3-PART-3 one-of-A-B-C-D)
(check-satisfied P3-PART-4 one-of-3-4-5-6-7-8)
(check-satisfied P3-PART-5 one-of-1-2-3-4-5)


(define (one-of choices) (lambda (x) (member x choices)))

(define one-of-A-B-C-D     (one-of (list "A" "B" "C" "D")))
(define one-of-A-B-C-D-E   (one-of (list "A" "B" "C" "D" "E")))
(define one-of-3-4-5-6-7-8 (one-of (list 3 4 5 6 7 8)))
(define one-of-1-2-3-4-5   (one-of (list 1 2 3 4 5)))
          
