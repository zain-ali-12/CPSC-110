;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname mt2-p3-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2021w2-mt2/mt2-p3)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!

#|
Consider the following data definitions, which are the same ones
used for problems 1, 2 and 3.  Remember that there is background
explanation of these data definitions in the problem 2 starter.
|#

(@htdd Employee ListOfEmployee ListOfGrant Grant)
(define-struct emp (name hired reports grants))
;; Employee is (make-emp String Natural ListOfEmployee ListOfGrant)
;; interp.
;;  An arbitrary-arity tree of employees. Each employee has:
;;    - their name.
;;    - the day number they were hired.  All dates in this very strange
;;      company are represented as the day number since the company was
;;      formed.
;;    - the employees that report directly to this employee.
;;    - the stock option grants that have been given to this employee.

;; ListOfEmployee is one of:
;;  - empty
;;  - (cons Employee ListOfEmployee)
;; interp. a list of employees

;; ListOfGrant is one of:
;;  - empty
;;  - (cons Grant ListOfGrant)
;; interp. a list of stock option grants

(define-struct grant (shares price vests))
;; Grant is (make-grant Natural Number Natural)
;; interp.
;;  A stock option grant. Each grant has:
;;   - number of shares granted.
;;   - exercise price.
;;   - the day number on which the grant vests. This is the first
;;     day on which the employee is allowed to "exercise" the option.
;;     Again, all dates in this very strange company are represented
;;     as the day number since the company was formed.


;;
;; NOTE: SEE THE HANDOUT FIGURE WHICH WILL HELP YOU UNDERSTAND THE OVERALL
;;       STRUCTURE OF THESE EXAMPLES.
;;       WE ARE INCLUDING MORE EXAMPLES HERE THAN WOULD OTHERWISE BE NECESSARY
;;       TO EXPLAIN THE DATA DEFINITION.  YOU MAY WANT TO USE THESE EXAMPLES TO
;;       MAKE IT EASIER TO WRITE YOUR CHECK-EXPECTS.
;;

(define G1  (make-grant 2000  40 1095))
(define G2  (make-grant 2000  50 1460))
(define G3  (make-grant 2000  60 1825))
(define G4  (make-grant 1000  40  730))
(define G5  (make-grant 1000  60 1095))
(define G6  (make-grant 1000  60 1460))
(define G7  (make-grant 1000  40 1095))
(define G8  (make-grant 1000  60 1460))
(define G9  (make-grant  500  60  365))
(define G10 (make-grant  500  60  730))
(define G11 (make-grant  500  40  365))
(define G12 (make-grant  500  60  730))
(define G13 (make-grant  500  60  365))
(define G14 (make-grant  500  60  730))
(define G15 (make-grant  500  40  365))
(define G16 (make-grant  500  40  730))
(define G17 (make-grant  500  40  365))
(define G18 (make-grant 1000  40  730)) ;more shares than others at this level
(define G19 (make-grant  500  40 1095))

(define LOGE empty)
(define LOG1 (list G1 G2))

(define E8 (make-emp "Ying" 1700 empty (list G17 G18 G19)))
(define E7 (make-emp "Alba" 1300 empty (list G15 G16)))
(define E6 (make-emp "Keri" 1200 empty (list G13 G14)))
(define E5 (make-emp "Chad"  900 empty (list G11 G12)))
(define E4 (make-emp "Moha" 1000 empty (list G9 G10)))
(define E3 (make-emp "Fred"    1 (list E7 E8)    (list G7 G8)))
(define E2 (make-emp "Elsa"    1 (list E4 E5 E6) (list G4 G5 G6)))
(define E1 (make-emp "Shin"    1 (list E2 E3)    (list G1 G2 G3)))

(define LORE empty)
(define LOR123 (list E1 E2 E3))

            
(@template-origin Employee ListOfEmployee ListOfGrant Grant encapsulated)

(define (fn-for-employee e)
  (local [(define (fn-for-employee e)
            (... (emp-name e)
                 (emp-hired e)
                 (fn-for-loe (emp-reports e))
                 (fn-for-log (emp-grants e))))

          (define (fn-for-loe loe)
            (cond [(empty? loe) (...)]
                  [else
                   (... (fn-for-employee (first loe))
                        (fn-for-loe (rest loe)))]))

          (define (fn-for-log log)
            (cond [(empty? log) (...)]
                  [else
                   (... (fn-for-grant (first log))
                        (fn-for-log (rest log)))]))

          (define (fn-for-grant g)
            (... (grant-shares g)
                 (grant-price g)
                 (grant-vests g)))]
    
    (fn-for-employee e)))



#|

In problem 3 we are also providing you with a fold function for Employee.

|#

(@htdf fold-employee)
(@signature (String Natural Y Z -> X)
            (X Y -> Y)
            (U Z -> Z)
            (Natural Number Natural -> U)
            Y
            Z
            Employee
            -> X)
;; abstract fold for employee

(check-expect (fold-employee make-emp cons      ;Employee and (listof Employee) 
                             cons make-grant    ;(listof Grant) and Grant
                             empty empty
                             E8)
              E8)

(@template-origin Employee ListOfEmployee ListOfGrant Grant encapsulated)

(define (fold-employee c1 c2 c3 c4 b1 b2 e)
  (local [(define (fn-for-employee e)   ; --> X
            (c1 (emp-name e)
                (emp-hired e)
                (fn-for-loe (emp-reports e))
                (fn-for-log (emp-grants e))))

          (define (fn-for-loe loe)      ; --> Y
            (cond [(empty? loe) b1]
                  [else
                   (c2 (fn-for-employee (first loe))
                       (fn-for-loe (rest loe)))]))

          (define (fn-for-log log)      ; --> Z
            (cond [(empty? log) b2]
                  [else
                   (c3 (fn-for-grant (first log))
                       (fn-for-log (rest log)))]))

          (define (fn-for-grant g)      ; --> U
            (c4 (grant-shares g)
                (grant-price g)
                (grant-vests g)))]
    
    (fn-for-employee e)))

#|

   >>> PLEASE READ THESE DIRECTIONS CAREFULLY. THREE TIMES OR MORE. <<<

Design a function that consumes an Employee and a day number and produces
the total number of grant shares in that tree that vest on or before that day.
For example:

(total-vested-by (make-emp "Azi" 1
                           empty
                           (list (make-grant 50 25 100)
                                 (make-grant 75 50 200)))
                 100)

would be 50, because there is only one employee in the tree, that employee
has two grants, the first one vests on day 100, but the second one does
not vest until day 200.

Also, using the constants defined above:

(total-vested-by E7    7) should produce 0
(total-vested-by E1 1825) should produce 17000


Your function definition must call the fold-employee abstract function.
Any anwser that uses the templates instead of calling fold-employee will
receive 0 marks.


NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - the function you design must be called total-vested-by
 - you must include ALL relevant @ metadata tags
 - you must not comment out any @ metadata tags
 - your submission must pass the Check Syntax button
 - the function you design MUST NOT use the templates
 - the function you design MUST call the fold-employee abstract function

|#

;(@htdf total-vested-by) ;uncomment when you start

