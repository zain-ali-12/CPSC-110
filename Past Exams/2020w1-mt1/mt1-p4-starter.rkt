;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2020W1-MT1-P4-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2020w1-mt1/mt1-p4)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE this line
(@problem 2) ;DO NOT EDIT OR DELETE this line
(@problem 3) ;DO NOT EDIT OR DELETE this line

(@problem 4) 
;; You are given the following data definitions for Solid and ListOfSolid:

(@htdd Solid)
(define-struct solid (w h d))
;; Solid is (make-solid Number Number Number)
;; interp. the width, height, and depth of a 3 dimensional rectangular solid
(define SLD1 (make-solid 2 3 4))
(define SLD2 (make-solid 2.3 6 1.1))

(@dd-template-rules compound)

(define (fn-for-solid s)
  (... (solid-w s)
       (solid-h s)
       (solid-d s)))

(@htdd ListOfSolid)
;; ListOfSolid is one of:
;; - empty
;; - (cons Solid ListOfSolid)
;; interp. a list of 3 dimensional rectangular solids

(define LOS0 empty)
(define LOS1 (cons (make-solid 2 3 4) empty))
(define LOS2 (cons (make-solid 1 1 1)
                   (cons (make-solid 1.1 1.2 1.3)
                         (cons (make-solid 10 20 30) empty))))

(@dd-template-rules one-of          ; 2 cases
                    atomic-distinct ; empty
                    compound        ; cons
                    ref             ; Solid
                    self-ref)       ; ListOfSolid

(define (fn-for-los l)
  (cond [(empty? l) (...)]
        [else
         (... (fn-for-solid (first l))
              (fn-for-los (rest l)))]))


;;
;; Design a function called count-larger that takes a ListOfSolid and a
;; number and produces the number of solids in the list whose volume
;; is >= the given number.
;; Reminder:  the volume of a rectangular solid is given by:
;;    volume = width * height * depth
;; 

