;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname mt2-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2021w2-mt2/mt2-p2)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!


#|

NOTE: THIS MAY BE THE MOST TIME CONSUMING PROBLEM ON THE MIDTERM.
      IT APPEARS AS PROBLEM 2 BECAUSE OF HOW 1, 2, AND 3 FIT
      TOGETHER.  SO YOU SHOULD AT LEAST READ THROUGH THE BACKGROUND
      CAREFULLY, AFTER THAT YOU CAN GO ON TO PROBLEM 3 AND COME 
      BACK IF YOU WANT.

THIS PROBLEM USES THE SAME TYPE COMMENTS AS IN PROBLEM 1.

BACKGROUND ON THIS PROBLEM:

Many tech companies compensate their employees partly through stock
options. Stock options are granted (meaning given) when the employee
is hired, with the stock price at that date. Options can also be
granted at later times.

But employees cannot buy the options right away.  They have to wait
until the "vesting" date for the option. 

A key thing to focus on for this problem is that the date an option
"vests" refers to the first date at which an employee has the option
to buy the shares.

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
;;   - number of shares granted. This is how many shares the employee
;;     can buy.
;;   - price. This is the price the employee will pay for each share.
;;   - the day number on which the grant vests. This is the first
;;     day on which the employee is allowed to purchase the shares.
;;     Again, all dates in this very strange company are represented
;;     as the day number since the company was formed.


;;
;; NOTE: SEE THE HANDOUT FIGURE WHICH WILL HELP YOU UNDERSTAND THE OVERALL
;;       STRUCTURE OF THESE EXAMPLES.
;;       WE ARE INCLUDING MORE EXAMPLES HERE THAN WOULD OTHERWISE BE NECESSARY
;;       TO EXPLAIN THE DATA DEFINITION.  PLEASE USE THESE EXAMPLES WHEN WRITING
;;       YOUR CHECK-EXPECTS.
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

   >>> PLEASE READ THESE DIRECTIONS CAREFULLY. THREE TIMES OR MORE. <<<

Design a function that consumes four arguments:
  - an Employee
  - a share price
  - a day number
  - a dollar amount

The function should search the tree to find the first grant with a
value >= the given amount, based on the given day number and share
price on that day.  If there is no such grant it should signal failure
producing false.

In general, before a grant has vested it has value 0, for any day
after it has vested it has value:

  (<price-that-day> - grant-price) * grant-shares

For example (make-grant 50 20 10)

 - at share price 30 on day  9 has value 0 because it has not vested
 - at share price 30 on day 10 or after, it has value (30 - 20) * 50 = 500

So, for example:

 (find-grant-with-value E8 50 500 4000) should produce G17

NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - the function you design must be called find-grant-with-value
 - you must include ALL relevant @ metadata tags
 - you must not comment out any @ metadata tags
 - your submission must pass the Check Syntax button
 - you must use the encapsulated template below in your solution
 - you must NOT rename any of the local functions inside the template
 - you must follow all design rules related to templates

|#

;(@htdf find-grant-with-value) ;uncomment when you start


(@template-origin Employee ListOfEmployee ListOfGrant Grant
           encapsulated)

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
