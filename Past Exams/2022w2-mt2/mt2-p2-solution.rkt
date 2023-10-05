;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname mt2-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; DO NOT PUT ANYTHING PERSONALLY IDENTIFYING BEYOND YOUR CWL IN THIS FILE.

(require spd/tags)

(@assignment exams/2022w2-mt2/mt2-p2);Do not edit or remove this tag

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line


(define ARROW-A "MR")
(define ARROW-B "SR")
(define ARROW-C "R")
(define ARROW-D "MR")
(define ARROW-E "SR")
(define ARROW-F "MR")
(define ARROW-G "MR")

(define PART-2 "no")




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
