;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname MT1-P3-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2021s1-mt1/mt1-p3)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)


(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 3)
#| 


This is a multiple choice problem on reference arrows.  It asks you to label
reference arrows and call arrows.


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

Consider the following type comments and templates.  You will notice that every 
reference to a type name, or call to a function is followed by a letter in
square brackets, e.g. [A], [B], etc. That label exists to give a name to the
arrow that starts at that point.

(define-struct bar (sim num))

;; Bar is one of:
;; - false
;; - (make-bar Goo[A] ListOfNatural[B])

(define-struct foo (nm whg ty))

;; Foo is (make-foo String Natural Bar[C])

;; ListOfFoo is one of
;; - empty
;; - (cons Foo[D] ListOfFoo[E])

(define-struct goo (size img))

;; Goo is (make-goo Natural Image)

;; ListOfNatural is one of:
;; - empty
;; - (cons Natural ListOfNatural[F])




(define (fn-for-bar b)
  (cond [(false? b) (...)]
        [else
         (... (fn-for-goo[G] (bar-sim b))
              (fn-for-lon[H] (bar-num b)))]))

(define (fn-for-foo f)
  (... (foo-nm f)
       (foo-whg f)
       (fn-for-bar[I] (foo-ty f))))

(define (fn-for-lof lof)
  (cond [(empty? lof) (...)]
        [else
         (... (fn-for-foo[J] (first lof))
              (fn-for-lof[K] (rest lof)))]))

(define (fn-for-goo g)
  (... (goo-size g)
       (goo-img g)))

(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon[L] (rest lon)))]))


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
(define ARROW-H "???")
(define ARROW-I "???")
(define ARROW-J "???")
(define ARROW-K "???")
(define ARROW-L "???")



;;============================================================================
;;============================================================================
;;============================================================================
;; You should ignore this code.  Do not read or edit below here.
;;
;; This code is here so that running the file will verify that your answer is
;; well-formed.

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
(check-satisfied ARROW-H is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-I is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-J is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-K is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-L is-string-R-SR-MR-NH-NR-OR-NMR)
