;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w2-mt1/mt1-p4)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line


(@htdd ListOfNumber)
;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
(define LON1 empty)
(define LON2 (cons 2 (cons 5 empty)))

(@dd-template-rules one-of             ;2 cases
                    atomic-distinct    ;empty
                    compound           ;(cons Number ListOfNumber)
                    self-ref)          ;(rest loi) is ListOfNumber

(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))


#|

Design a function that consumes a list of numbers lon, and a number n, in that
order.  The function should compute the product of the numbers in the list
as long as the numbers are < n.  So, for example:

(product-while (cons 3 (cons 1 (cons 2 (cons 4 (cons 6 empty))))) 
               4)

should produce 6, which is 3 * 1 * 2

Note that it keeps going until the first element of the list that is not < n,
so (product-while (cons 5 (cons 2 empty)) 9) produces 10.

Your function design must include a @signature, purpose, commented out stub,
appropriate tests, a @template-origin tag, a @template tag, and a function
definition.

This problem will be autograded.  NOTE that all of the following are required.
Violating one or more will cause your solution to receive 0 marks.

  - Files must not have any errors when the Check Syntax button is pressed.
    Press Check Syntax and Run often, and correct any errors early.

  - You must define a function with the same name as in the @htdf tag below.

|#

(@htdf product-while)
