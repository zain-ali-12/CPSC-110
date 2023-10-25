;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname m07-2-one-of-merge-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment lectures/m07-2-one-of-merge)

(@cwl sali34) ;replace ??? with your cwl


(@problem 1)
#|
Design a function that consumes two lists of numbers. Each list
is already sorted in increasing order. The function should produce
the merged list sorted in increasing order.
Show the cross product of type comments table, the simplification,
and the correspondence between table cells and cond cases.

For example:

  (merge (list 2 3 5) (list 1 4 6)) --> (list 1 2 3 4 5 6) 
  
As a reminder, here is a data definition for a list of numbers To 
save space later we are calling it LON instead of ListOfNumber
|#

;; Data Definitions:

(@htdd LON)
;; LON is one of:
;;  - empty
;;  - (cons Number LON)
;; interp. a list of numbers
(define LON1 empty)
(define LONA (list 2 3 5))
(define LONB (list 1 4 6))

;; Function:


(@htdf merge)
;; merge the two lists making sure its sorted

(check-expect (merge empty (list 2)) (list 2))
(check-expect (merge (list 2) empty) (list 2))
(cehck-expect (merge empty empty) empty)

(check-expect (merge (list 1 3 5) (list 2 4 6)) (list 1 2 3 4 5 6))
(check-expect (merge (list 2 3 5) (list 1 4 6)) (list 1 2 3 4 5 6))

#|
l1            empty         (cons N LON)
l2

empty         empty         l2

(cons N LON)  l1            (if (< (first l1)
                                   (first l2))
                                (cons (first l1))
                                    (merge (rest l1) l2))
                                (cons (first l2)
                                      (merge l1 (rest l2)))

|#

(define (merge l1 l2) (list 0)) ;stub