;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname f-p3-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(require racket/function);only to support the 3rd FYI solution
;                        ;a student would NOT have been allowed 
;                        ;to add a require to the file

(@assignment exams/2019w2-f/f-p3)

(@cwl ???)

(@problem 1) ;ignore, but DO NOT DELETE this line
(@problem 2) ;ignore, but DO NOT DELETE this line
(@problem 3)

;; Consider the following data definitions:

(@htdd Course)
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


(@htdf messages) ;; START YOUR FUNCTION DESIGN BELOW HERE.
(@signature String String (listof Student) -> (listof String))
;; produce messages for students enrolled in at least 1 department course
(check-expect (messages "PHYS" "are you free for brunch on 4/26?" empty) empty)
(check-expect (messages "CPSC" "are you free for brunch on 4/26?" LOS1)
              (list "Simon are you free for brunch on 4/26?"
                    "Ziyou are you free for brunch on 4/26?"))
(check-expect (messages "GERM" "have you submitted the problem set?" LOS1) empty)
(check-expect (messages "ANTH" "are you ready for your final?" LOS2)
              (list "Ahmed are you ready for your final?"
                    "Ziyou are you ready for your final?"
                    "Beth are you ready for your final?"
                    "Ally are you ready for your final?"))


(@template-origin use-abstract-fn fn-composition) ;can include Student
(define (messages dept msg los)
  ;; there are a number of ways to do it, all are basically a map filter
  ;; composition
  #;
  (map (lambda (s)
         (string-append (student-name s) " " msg))
       (filter (lambda (s)
                 (member? dept (map course-dept (student-courses s))))
               los))
  #;
  (local [(define (message s)
            (string-append (student-name s) " " msg))
          (define (has-dept-course? s)
            (member? dept (map course-dept (student-courses s))))]
    (map message (filter crit? los)))
  
  (map (compose (curryr string-append " " msg) student-name)
       (filter (compose (curry member? dept)
                        (curry map course-dept)
                        student-courses)
               los)))

