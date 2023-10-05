;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2022w2-mt2/mt2-p5)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line


#|

YOU ARE NOT PERMITTED TO USE THE STEPPER AT ANY POINT IN THIS EXAM.

In this problem you must complete the design of the function below with an
appropriate @template-origin and function definition.  

This problem will be autograded.  NOTE that all of the following are required.
Violating one or more will cause your solution to receive 0 marks.

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

  - HINT: There is a built-in function called max, that consumes two 
    numbers and produces the larger of the two. We found that function
    useful in our solution.

|#

(@htdf largest)
(@signature (listof (listof Natural)) -> (listof Natural))
;; produce list of largest numbers in each sublist, in same order as lolon
;; CONSTRAINT:
;;   Every sublist will contain at least one number, and all
;;   numbers are >= 0.
(check-expect (largest empty) empty)
(check-expect (largest (list (list 1)
                             (list 2)))
              (list 1 2))
(check-expect (largest (list (list 1 3 7)
                             (list 5 2 4)
                             (list 4 2 5 9 1 5)))
              (list 7 5 9))

;; *** As a reminder, you must not edit anything above this line!!! ***
;; *** You may add tests below here.                                ***

(define (largest lolon) empty) ;stub
