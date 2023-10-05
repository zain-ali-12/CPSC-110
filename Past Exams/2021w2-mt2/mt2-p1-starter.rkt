;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2021w2-mt2/mt2-p1)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!

#|

This is a multiple choice problem on reference arrows.  It asks you to label
reference arrows and answer a question on whether the self/mutual-reference
is well-formed.


NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - You MUST NOT EDIT the type comments.
 
 - You MUST NOT edit the code at the end of the file marked do not edit.
 
 - This file includes special check-expects at the bottom that will check
   whether your answer is well-formed when you run the file. If one or more
   answers are not well-formed the test will fail with a message that
   describes what needs to be fixed.
 
 - Run the file EVERY time you edit an answer.
 
 - Note that initially the tests WILL FAIL, because you need to edit your
   answers in for the tests to pass.
 
 - Your submission WILL BE GRADED IF THERE ARE FAILING TESTS.  A failing test
   just means that specific answer is not well-formed.
 
 - BUT your submission will not be graded if running it produces red errors.

Consider the following type comments.  You will notice that every reference to
a type name is followed by a letter in square brackets, e.g. [A], [B], etc. That
label exists to give a name to the reference arrow that starts at that point.  
So, the arrow from Bar in the first line of the type comments to the definition
of Bar in the third line of the type comments is called A.

|#

(define-struct emp (name hired reports grants))
;; Employee is (make-emp String Natural ListOfEmployee[A] ListOfGrant[B])
;; ListOfEmployee is one of:
;; - empty
;; - (cons Employee[C] ListOfEmployee[D])
;; ListOfGrant is one of:
;; - empty
;; - (cons Grant[E] ListOfGrant[F])
(define-struct grant (shares price vests))
;; Grant is (make-grant Natural Number Natural)


#|
 In the ARROW constants below you must replace every "???" string with
 one of the following strings to indicate what kind of arrow the label
 marks:
    "R"    for reference
    "SR"   for self-reference
    "MR"   for mutual-reference
    "NH"   for natural helper
    "NR"   for natural recursion
    "NMR"  for natural mutual recursion
|#

(define ARROW-A "???")
(define ARROW-B "???")
(define ARROW-C "???")
(define ARROW-D "???")
(define ARROW-E "???")
(define ARROW-F "???")



;;============================================================================
;;============================================================================
;;============================================================================
;; You should ignore this code.  Do not read or edit below here.
;;
;; This code is here so that running the file will verify that your answer is
;; well-formed.

(define (is-string-R-SR-MR-NH-NR-NMR x)
  (member x '("R" "SR" "MR" "NH" "NR" "NMR")))

(define (is-string-yes-or-no x)
  (member x '("yes" "no")))

(check-satisfied ARROW-A is-string-R-SR-MR-NH-NR-NMR)
(check-satisfied ARROW-B is-string-R-SR-MR-NH-NR-NMR)
(check-satisfied ARROW-C is-string-R-SR-MR-NH-NR-NMR)
(check-satisfied ARROW-D is-string-R-SR-MR-NH-NR-NMR)
(check-satisfied ARROW-E is-string-R-SR-MR-NH-NR-NMR)
(check-satisfied ARROW-F is-string-R-SR-MR-NH-NR-NMR)


