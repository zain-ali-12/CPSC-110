;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname mt2-p1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; DO NOT PUT ANYTHING PERSONALLY IDENTIFYING BEYOND YOUR CWL IN THIS FILE.

(require spd/tags)

(@assignment exams/2022w2-mt2/mt2-p1);Do not edit or remove this tag

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line

#|

Consider the following data definitions:

|#

(@htdd Unit ListOfString ListOfUnit)

(define-struct unit (name budget tasks subs))
;; Unit is (make-unit String Integer ListOfString ListOfUnit)
;; interp. an organizational unit, with
;;          budget in CAD $
;;          tasks performed, such as "sales" "QA" "research"...
;;          subs is the sub-organizations within this unit
;;
;; ListOfString is one of:
;; - empty
;; - (cons String ListOfString)
;; interp. a list of strings
;;
;; ListOfUnit is one of:
;; - empty
;; - (cons Unit ListOfUnit)
;; interp. a list of units

(define CS (make-unit "CS" 10000000 (list "teach" "research") empty))
(define MA (make-unit "MA" 12000000 (list "teach" "research") empty))
(define CW (make-unit "CW"   190000 (list "teach" "research") empty))
(define SC (make-unit "SC" 30000000 (list "admin") (list CS MA)))
(define AR (make-unit "AR"   230000 (list "admin") (list CW)))
(define PR (make-unit "PR" 50000000 (list "admin" "fundraise") (list SC AR)))

(@template-origin encapsulated Unit ListOfString ListOfUnit)

(define (fn-for-unit u0)
  (local [(define (fn-for-unit u)
            (... (unit-budget u)
                 (fn-for-los (unit-tasks u))
                 (fn-for-lou (unit-subs u))))

          (define (fn-for-los los)
            (cond [(empty? los) (...)]
                  [else
                   (... (first los)
                        (fn-for-los (rest los)))]))

          (define (fn-for-lou lou)
            (cond [(empty? lou) (...)]
                  [else
                   (... (fn-for-unit (first lou))
                        (fn-for-lou (rest lou)))]))]

    (fn-for-unit u0)))

#|
Complete the design of a function that consumes a Unit, an Integer and a String
in that order.

TO BE CLEAR, the arguments are Unit Integer String IN THAT ORDER.

And produces a list of all units in the given unit tree that BOTH:
  - have a budget >= the given integer
  - include the given string in their direct tasks

For example, (get-units PR 10000000 "teach") should produce  (list CS MA).


NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - the function you design MUST BE CALLED get-units
 - you MUST use the encapsulated templates above
 - you MUST NOT RENAME any of the local functions within those templates
 - you MUST NOT RENAME any of the parameters of those local functions
 - you MUST USE ALL of the local functions within those templates
 - you MUST NOT EDIT the data definitions in any way
 - you MUST NOT EDIT the provided @htdf tag, @signature tag, or purpose
 - you MUST NOT USE the member, member?, memq, memq? or memv functions
 - you MUST NOT COMMENT out any @ metadata tags
 - your submission MUST PASS the Check Syntax button
 - you MUST FOLLOW all applicable design rules

|#

(@htdf get-units)

(@signature Unit Integer String -> ListOfUnit)
;; produce units with budget >= the given budget and that perform task

;; *** As a reminder, you must not edit anything above this line!!! ***


(define (get-units u budget task) empty) ;stub
