;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w2-mt2/mt2-p6)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line
(@problem 6) ;do not edit or delete this line


#|

YOU ARE NOT PERMITTED TO USE THE STEPPER AT ANY POINT IN THIS EXAM.

In this problem you must complete the design of the function with an
appropriate @template-origin and function definition.  You should consult
the mt2-p6-figure.pdf file which provides some additional help designing
the function.

NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

  - The file MUST NOT have any errors when the Check Syntax button is pressed.
    Press Check Syntax and Run often, and correct any errors early.

  - The function definition MUST call one or more built-in abstract functions.

  - The function definition and any helper functions you design MUST NOT be
    recursive.

  - The function definition and helper functions you design MUST NOT use any
    part of the recursive Natural template or the (listof X) template. For
    instance,

      - it must not include (cond [(empty? ... anywhere
      - it must not include (cond [(zero? ... anywhere
      - it must not include (first lon) anywhere

  - You MUST NOT edit any part of the file above the lines marked with ***.
    But you should definitely ADD NEW check-expects after those lines.

  - The result of the function must directly be the result of one of the
    built-in abstract functions. So, for example, the following would not
    be a valid function body:

       (define (foo x)
         (empty? (filter ...)))

 - For maximum credit your answer should be a composition of just one call
   to foldr and one call to build-list.


|#

(define SIZE 10)
(define COLOR "blue")
(define PEN "solid")

(@htdf pyramid)
(@signature Natural -> Image)
;; produce a pyramid with n-1 visible steps on each side (steps are 10x10)
(check-expect (pyramid 0) empty-image)
(check-expect (pyramid 1) 
              (beside/align "bottom"
                            (rectangle SIZE (* SIZE 1) PEN COLOR)
                            empty-image
                            (rectangle SIZE (* SIZE 1) PEN COLOR)))
(check-expect (pyramid 2) 
              (beside/align "bottom"
                            (rectangle SIZE (* SIZE 1) PEN COLOR)
                            (rectangle SIZE (* SIZE 2) PEN COLOR)
                            empty-image
                            (rectangle SIZE (* SIZE 2) PEN COLOR)
                            (rectangle SIZE (* SIZE 1) PEN COLOR)))
(check-expect (pyramid 3) 
              (beside/align "bottom"
                            (rectangle SIZE (* SIZE 1) PEN COLOR)
                            (rectangle SIZE (* SIZE 2) PEN COLOR)
                            (rectangle SIZE (* SIZE 3) PEN COLOR)
                            empty-image
                            (rectangle SIZE (* SIZE 3) PEN COLOR)
                            (rectangle SIZE (* SIZE 2) PEN COLOR)
                            (rectangle SIZE (* SIZE 1) PEN COLOR)))

;; *** As a reminder, you must not edit anything above this line!!! ***
;; *** You may add tests below here.                                ***

(define (pyramid n) empty-image) ;stub
