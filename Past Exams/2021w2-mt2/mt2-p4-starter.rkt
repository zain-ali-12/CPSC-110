;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p4-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2021w2-mt2/mt2-p4)

(@cwl ???) ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 4) ;DO NOT EDIT OR DELETE THIS LINE!

#|

Complete the design of the following function by writing the template tag
and the function definition.  

This problem will be autograded.  NOTE that all of the following are required.
Violating one or more will cause your solution to receive 0 marks.

  - Files must not have any errors when the Check Syntax button is pressed.
    Press Check Syntax and Run often, and correct any errors early.

  - The function definition MUST call one or more built-in abstract functions.

  - For maximum credit the function definition should use the most clear
    and expressive combination of abstract functions.  In particular, while
    it is possible to just use foldr for these problems that is not always
    correct. If what is happening is a filter, then it is not correct to 
    just implement filtering with foldr.

  - The function definition MUST NOT be recursive.

  - The function definition MUST NOT use any part of the recursive Natural
    template or the (listof X) template.

      - it must not include (cond [(empty? ... anywhere
      - it must not include (cond [(zero? ... anywhere
      - it must not include (if (empty? ... anywhere
      - it must not include (if (zero? ... anywhere

  - The result of the function must directly be the result of one of the
    built-in abstract functions. So, for example, the following is not
    a valid function body:

       (define (foo x)
         (empty? (filter ...)))

  - You MUST NOT change or comment out any check-expects, but you are free
    to add new ones.

Note, the following BSL function may be useful to you:

(length lst) 

Produces the length of the list.

HINT: It may help to think of first making your function produce a list of
      number of occurrences. So if you called it with (list 1 3 4 2) and
      (list 3 2 1 3 4 2 3 4 3 3) it would produce (list 1 5 2 2).

|#

(@htdf most-occurrences)
(@signature (listof Number) (listof Number) -> Natural)
;; number of occurrences of number in l1 that has most occurrences in l2
;; CONSTRAINT: there are no duplicates within lst1 
(check-expect (most-occurrences empty (list 2 3 1)) 0)
(check-expect (most-occurrences (list 3 1 2) empty) 0)
(check-expect (most-occurrences (list 4) (list 1 4 2 4 3)) 2)
(check-expect (most-occurrences (list 1 3 4 2)
                                (list 3 2 1 3 4 2 3 4 3 3))
              5)

(define (most-occurrences l1 l2) 0)

