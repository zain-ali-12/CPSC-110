;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

(@htdf count-larger)
(@signature ListOfSolid Number -> Natural)
;; produce the number of solids in s whose volume is >= the given volume

(check-expect (count-larger empty 10) 0)
(check-expect (count-larger (cons (make-solid 2 3 4) empty) 20) 1)
(check-expect (count-larger (cons (make-solid 2 3 4)
                                  (cons (make-solid 2 25 2)
                                        (cons (make-solid 2 25 3)
                                              empty)))
                            100)
              2)
(check-expect (count-larger LOS2 10) 1)

;(define (count-larger los v) 0) ; stub

(@template-origin ListOfSolid)

(@template
 (define (count-larger l n)
   (cond [(empty? l) (...)]
         [else
          (... (fn-for-solid (first l))
               (count-larger (rest l))
               n)])))

(define (count-larger l v)
  (cond [(empty? l) 0]
        [else
         (+ (if (>= (volume (first l)) v) 1 0)
            (count-larger (rest l) v))]))


(@htdf volume)
(@signature Solid -> Number)
;; produce the volume of a rectangular solid

(check-expect (volume (make-solid 2 3 4)) 24)
(check-expect (volume (make-solid 1.1 1.2 1.3)) (* 1.1 1.2 1.3))

;(define (volume s) 0) ; stub

(@template-origin Solid)

(@template
 (define (volume s)
   (... (solid-w s)
        (solid-h s)
        (solid-d s))))

(define (volume s)
  (* (solid-w s)
     (solid-h s)
     (solid-d s)))

