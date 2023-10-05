;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname MT1-P3-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2021s1-mt1/mt1-p3)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)


(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 3)

(define ARROW-A "R")
(define ARROW-B "R")
(define ARROW-C "R")
(define ARROW-D "R")
(define ARROW-E "SR")
(define ARROW-F "SR")

(define ARROW-G "NH")
(define ARROW-H "NH")
(define ARROW-I "NH")
(define ARROW-J "NH")
(define ARROW-K "NR")
(define ARROW-L "NR")



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

