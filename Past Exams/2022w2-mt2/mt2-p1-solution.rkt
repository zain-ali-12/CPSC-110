;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname mt2-p1-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
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


(@htdf get-units)
(@signature Unit Integer String -> ListOfUnit) ;provide!!!
;; produce units with budget >= budget and that perform task
(check-expect (get-units CS 10000001 "research") (list))
(check-expect (get-units CS 10000000 "research") (list CS))
(check-expect (get-units CS  9999999 "research") (list CS))
(check-expect (get-units MA 10000000 "teach") (list MA))
(check-expect (get-units PR 10000000 "teach") (list CS MA))
(check-expect (get-units PR 30000000 "admin") (list PR SC))

;(define (get-units u budget task) empty)

(@template-origin encapsulated Unit ListOfString ListOfUnit)

(define (get-units u0 budget task)
  (local [(define (fn-for-unit u)
            (if (and (>= (unit-budget u) budget)
                     (fn-for-los (unit-tasks u)))
                (cons u (fn-for-lou (unit-subs u)))
                (fn-for-lou (unit-subs u))))

          (define (fn-for-los los)
            (cond [(empty? los) #f]
                  [else
                   (or (string=? (first los) task)
                       (fn-for-los (rest los)))]))

          (define (fn-for-lou lou)
            (cond [(empty? lou) empty]
                  [else
                   (append (fn-for-unit (first lou))
                           (fn-for-lou (rest lou)))]))]

    (fn-for-unit u0)))

