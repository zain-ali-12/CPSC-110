;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname f-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2019w2-f/f-p2)

(@cwl ???)

(@problem 1) ;ignore, but DO NOT DELETE this line
(@problem 2)

#|

Complete the design of the following three functions by writing the template tag
and the function definition.  

This problem will be autograded.  NOTE that all of the following are required.
Violating one or more will cause your solution to receive 0 marks.

  - Files must not have any errors when the Check Syntax button is pressed.
    Press Check Syntax and Run often, and correct any errors early.

  - The function definitions MUST call one or more built-in abstract functions.

  - For maximum credit the function definitions should use the most clear
    and expressive combination of abstract functions.  In particular, do
    not use foldr for everything just because you can use foldr for
    everything.

  - The function definitions MUST NOT be recursive.

  - The function definitions MUST NOT use any part of the recursive Natural
    template or the (listof X) template.

      - it must not include (cond [(empty? ... anywhere
      - it must not include (cond [(zero? ... anywhere

  - The result of the functions must directly be the result of one of the
    built-in abstract functions. So, for example, the following is not
    a valid function body:

       (define (foo x)
         (empty? (filter ...)))

  - You MUST NOT change or comment out any check-expects, but you are free
    to add new ones.

|#


(@htdf largest-num)
(@signature (listof Natural) -> Natural)
;; produce largest number in list
;; CONSTRAINT: List has at least one element
(check-expect (largest-num (list 4)) 4)
(check-expect (largest-num (list 4 3 1 9 87 22 100)) 100)
(check-expect (largest-num (list 9 23 10 11)) 23)

(define (largest-num lon) 0) ; stub








(@htdf at-least-as-long?)
(@signature (listof String) Natural -> Boolean)
;; produce true if every string in list has length >= given number
(check-expect (at-least-as-long? empty 2) true)
(check-expect (at-least-as-long? (list "good" "luck" "on" "finals") 2) true)
(check-expect (at-least-as-long? (list "enjoy" "the" "summer") 6) false)

(define (at-least-as-long? los n) false) ; stub









(@htdf any-positive-odd?)
(@signature (listof Integer) -> Boolean)
;; produce true if the list contains a positive number that is odd
(check-expect (any-positive-odd? empty) false)
(check-expect (any-positive-odd? (list 1 3 2)) true)
(check-expect (any-positive-odd? (list -11 -3 2)) false)
(check-expect (any-positive-odd? (list -11 -3 2 13 4)) true)

(define (any-positive-odd? lon) false) ; stub








