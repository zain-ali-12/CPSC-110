;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p7-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2020w1-mt2/mt2-p7)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

;; Complete the design of the following functions by writing the template tag
;; and the function definition.  
;;
;; This problem will be autograded.  NOTE that all of the following are required.
;; Violating one or more will cause your solution to receive 0 marks.
;;
;;   - Files must not have any errors when the Check Syntax button is pressed.
;;     Press Check Syntax and Run often, and correct any errors early.
;;
;;   - The function definition MUST call one or more built-in abstract functions.
;;
;;   - For maximum credit the function definition should use the most clear
;;     and expressive combination of abstract functions.  In particular, while
;;     it is possible to just use foldr for these problems that is not always
;;     correct. If what is happening is a filter, then it is not correct to 
;;     just implement filtering with foldr.
;;
;;   - The function definition MUST NOT be recursive.
;;
;;   - The function definition MUST NOT use any part of the recursive Natural
;;     template or the (listof X) template.
;;
;;       - it must not include (cond [(empty? ... anywhere
;;       - it must not include (cond [(zero? ... anywhere
;;       - it must not include (if (empty? ... anywhere
;;       - it must not include (if (zero? ... anywhere
;;
;;   - For problems 1 and 2, the result of the function must directly be the
;;     result of one of the built-in abstract functions. So, for example, the
;;     following is not a valid function body:
;;
;;        (define (foo x)
;;          (empty? (filter ...)))
;;
;;   - You MUST NOT change or comment out any check-expects, but you are free
;;     to add new ones.
;;
;;   - Your solution MUST NOT call any of the built-in functions length,
;;     member, or member?.
;;

(@problem 1) ;this is actually problem 7(a) - DO NOT EDIT OR DELETE THIS LINE!

(@htdf without)
(@signature Number (listof Number) -> (listof Number))
;; produce a list that has every element of lon, except n

(check-expect (without 2 empty) empty)
(check-expect (without 3 (list 1 3 8 3 9 8 2 3)) (list 1 8 9 8 2))
(check-expect (without 3 (list 4 2 5 1)) (list 4 2 5 1))

(define (without n lon) empty) ; stub






(@problem 2) ;this is actually problem 7(b) - DO NOT EDIT OR DELETE THIS LINE!

;; Complete the design of count-larger, based on the following data definition
;; for Solid

(@htdd Solid)
(define-struct solid (w h d))
;; Solid is (make-solid Number Number Number)
;; interp. the width, height, and depth of a 3 dimensional rectangular solid
(define SLD1 (make-solid 2 3 4))
(define SLD2 (make-solid 2.3 6 1.1))

(define (fn-for-solid s)
  (... (solid-w s)
       (solid-h s)
       (solid-d s)))

(@htdf count-larger)
(@signature (listof Solid) Number -> Natural)
;; produce the number of solids in s whose volume is >= the given volume

(check-expect (count-larger empty 10) 0)
(check-expect (count-larger (cons (make-solid 2 3 4) empty) 20) 1)
(check-expect (count-larger (cons (make-solid 2 3 4)
                                  (cons (make-solid 2 25 2)
                                        (cons (make-solid 2 25 3)
                                              empty)))
                            100)
              2)

(define (count-larger los n) 0) ; stub









;; You may call the following helper in your solution if you wish.

(@htdf volume)
(@signature Solid -> Number)
;; produce the volume of a rectangular solid
(check-expect (volume (make-solid 2 3 4)) 24)
(check-expect (volume (make-solid 1.1 1.2 1.3)) (* 1.1 1.2 1.3))

(@template-origin Solid)
(define (volume s) (* (solid-w s) (solid-h s) (solid-d s)))







(@problem 3) ;this is actually problem 7(c) - DO NOT EDIT OR DELETE THIS LINE!

(@htdf set=?)
(@signature (listof Number) (listof Number) -> Boolean)
;; true if each number in lon1 is in lon2 and each number in lon2 is in lon1

(check-expect (set=? (list 1 2 3 4) (list 4 2 3 1)) true)
(check-expect (set=? (list 1 3 2 4) (list 4 3 1 2)) true)
(check-expect (set=? (list 1 2 3 4) (list 4 4 2 3 1)) true)
(check-expect (set=? (list 1 2 3 4) (list 4 2 3 6 1)) false)

(define (set=? lon1 lon2) false) ; stub





