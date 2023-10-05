;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname mt2-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; DO NOT PUT ANYTHING PERSONALLY IDENTIFYING BEYOND YOUR CWL IN THIS FILE.

(require spd/tags)

(@assignment exams/2022w2-mt2/mt2-p2);Do not edit or remove this tag

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line

#|

This is a multiple choice problem on reference arrows.  It asks you to label
reference arrows and answer a question on whether the self/mutual-reference
is well-formed.


NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - You MUST NOT EDIT any part of this file other than the values for the
   constants ARROW-A through ARROW-G, and PART-2 below
 
 - This file includes special check-expects at the bottom that will check
   whether your answer is well-formed when you run the file. If one or more
   answers are not well-formed the test will fail with a message that
   describes what needs to be fixed.
 
 - Run the file EVERY time you edit an answer.
 
 - Note that initially the tests WILL FAIL, because you need to edit your
   answers in for the tests to pass.
 
 - Your submission WILL BE GRADED IF THERE ARE FAILING TESTS.  A failing test
   just means that specific answer is not well-formed.
 
 - Your submission WILL NOT BE GRADED if running it produces red errors.


Consider the following type comments.  You will notice that every reference to
a type name is followed by a letter in square brackets, e.g. [A], [B], etc. That
label exists to give a name to the reference arrow that starts at that point.  
So, the arrow from Bar in the first line of the type comments to the definition
of Bar is called A.

In this problem you must do two things:

  - for each arrow indicate what kind it is

  - indicate whether the self and mutual reference relationships
    in these types are all well-formed

|#


(define-struct foo (a b c))
(define-struct baz (a b c))
(define-struct bee (a b))
(define-struct bix (a b))
;;
;; Foo is (make-foo Bar[A] Foo[B] Bix[C])
;;
;; Bar is one of:
;;  - false
;;  - (cons Baz[D] Bar[E])
;;
;; Baz is (make-baz Number String Bee[F])
;;
;; Bee is one of:
;;  - false
;;  - (make-bee Number Foo[G])
;;
;; Bix is (make-bix String Number)
;;

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
(define ARROW-G "???")

;; Now answer the following question by editing the PART-2 constant:
;;
;; Are all the self-reference and mutual-reference relationships in these
;; type comments well-formed?

(define PART-2 "???") ;replace "???" with "yes" or "no"



;; ==========================================================================
;; >>>>>>>>   You should not read and you MUST NOT EDIT BELOW HERE   <<<<<<<<
;; ==========================================================================
;;
;; The code below here exists so that running the file will verify that your
;; answers are well-formed.
;;

;; these are named to work well with check-satisfied failures

(define (is-string-R-SR-MR-NH-NR-OR-NMR x)
  (member x '("R" "SR" "MR" "NH" "NR" "NMR")))

(define (is-string-yes-or-no x)
  (member x '("yes" "no")))


(check-satisfied ARROW-A is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-B is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-C is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-D is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-E is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-F is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-G is-string-R-SR-MR-NH-NR-OR-NMR)


(check-satisfied PART-2  is-string-yes-or-no)
