;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p1-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2021w2-mt2/mt2-p1)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!

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


(define ARROW-A "MR")
(define ARROW-B "R")
(define ARROW-C "MR")
(define ARROW-D "SR")
(define ARROW-E "R")
(define ARROW-F "SR")



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


