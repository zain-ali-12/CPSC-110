;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p3-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2022w1-mt2/mt2-p3)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line

#|

YOU ARE NOT PERMITTED TO USE THE STEPPER AT ANY POINT IN THIS EXAM.

The description of this problem is entirely contained in the mt2-p3-figure.pdf
file.  Read that file for the problem description.  ALL of your answers go in
this file.

NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - This file includes special check-expects at the bottom that will check
   whether your answer is well formed when you run the file. If one or more
   answers are not well formed the test will fail with a message that
   describes what needs to be fixed.
 - Run the file EVERY time you edit an answer.
 - Note that initially the tests WILL FAIL for the starter, because they
   want you to edit your answers in before the tests pass.
 - Your submission will be graded if there are failing tests.  A failing test
   just means that specific answer is not well formed.
 - BUT your submission will not be graded if running it produces red errors.

|#

(define P3-PART-1 "?") ;replace "?" with one of "A" "B" "C" "D"

(define P3-PART-2 "?") ;replace "?" with one of "A" "B" "C" "D" "E"

(define P3-PART-3 "?") ;replace "?" with one of "A" "B" "C" "D"

(define P3-PART-4 0)   ;replace 0 with one of 3 4 5 6 7 8

(define P3-PART-5 0)   ;replace 0 with one of 1 2 3 4 5



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
          
