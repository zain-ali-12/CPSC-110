;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2019W2-F-P3-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags) 

(@assignment exams/2019w2-f/f-p3)

(@cwl ???)

(@problem 1) ;ignore, but DO NOT DELETE this line
(@problem 2) ;ignore, but DO NOT DELETE this line
(@problem 3)

;; Consider the following data definitions:

(@htdd Course)
(define-struct course (dept number))
;; Course is (make-course String Natural)
;; interp. a course with a department and a course number.
(define C1 (make-course "CPSC" 110))
(define C2 (make-course "MATH" 101))
(define C3 (make-course "ANTH" 201))
(define C4 (make-course "CPSC" 121))
(define C5 (make-course "PHIL" 154))
(define C6 (make-course "SPAN" 240))


(@htdd Student)
(define-struct student (name courses))
;; Student is (make-student String (listof Course))
;; interp. a student with a name and
;;         a list of courses they are enrolled in
(define S1 (make-student "Simon" (list C1 C2 C3))) 
(define S2 (make-student "Ahmed" (list C2 C3)))
(define S3 (make-student "Ziyou" (list C3 C4 C5))) 
(define S4 (make-student "Beth"  (list C2 C3 C5 C6)))
(define S5 (make-student "Ally"  (list C1 C2 C3 C4))) 
(define S6 (make-student "Jesse" (list C2 C3 C6)))

(define LOS1 (list S1 S2 S3 S4))
(define LOS2 (list S2 S3 S4 S5))
(define LOS3 (list S2 S4 S6))

#|

Complete the design of the following function by writing the template tag
and the function definition.  

As a reminder, ISL includes a function called odd? which should be useful
in this problem.  If you are unsure about how it works, try a few examples
in the interactions window.

This problem will be autograded.  NOTE that all of the following are required.
Violating one or more will cause your solution to receive 0 marks.

  - Files must not have any errors when the Check Syntax button is pressed.
    Press Check Syntax and Run often, and correct any errors early.

  - The function definition MUST call one or more built-in abstract functions.

  - For maximum credit the function definition should use the most clear
    and expressive combination of abstract functions.  In particular, do
    not use foldr for everything just because you can use foldr for
    everything.

  - The function definition MUST NOT be recursive.

  - The function definition MUST NOT use any part of the recursive Natural
    template or the (listof X) template.

      - it must not include (cond [(empty? ... anywhere
      - it must not include (cond [(zero? ... anywhere

  - The result of the function must directly be the result of one of the
    built-in abstract functions. So, for example, the following is not
    a valid function body:

       (define (foo x)
         (empty? (filter ...)))

  - You MUST NOT change or comment out any check-expects, but you are free
    to add new ones.

|#


(@htdf messages)
(@signature String String (listof Student) -> (listof String))
;; produce messages for students enrolled in at least 1 department course
(check-expect (messages "PHYS" "are you free for brunch on 4/26?" empty) empty)
(check-expect (messages "CPSC" "are you free for brunch on 4/26?" LOS1)
              (list "Simon are you free for brunch on 4/26?"
                    "Ziyou are you free for brunch on 4/26?"))
