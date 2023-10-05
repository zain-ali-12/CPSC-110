;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p3-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2023s-mt2/mt2-p1);Do not edit or remove this tag

(@problem 1) ;do not edit or delete this line

(define ARROW-A "R")
(define ARROW-B "MR")
(define ARROW-C "MR")
(define ARROW-D "R")
(define ARROW-E "SR")

;; ==========================================================================
;; >>>>>>>>   You should not read and you MUST NOT EDIT BELOW HERE   <<<<<<<<
;; ==========================================================================
;;
;; The code below here exists so that running the file will verify that your
;; answers are well-formed.
;;

(define (is-string-R-SR-MR-NH-NR-OR-NMR x)
  (member x '("R" "SR" "MR" "NH" "NR" "NMR")))


(check-satisfied ARROW-A is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-B is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-C is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-D is-string-R-SR-MR-NH-NR-OR-NMR)
(check-satisfied ARROW-E is-string-R-SR-MR-NH-NR-OR-NMR)
