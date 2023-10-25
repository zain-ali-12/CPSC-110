;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname m07-2-one-of-prefixes-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment lectures/m07-2-one-of-prefixes)

(@cwl sali34) ;replace ??? with your cwl

(@problem 1)
#|
Design a function that consumes two lists of strings and produces
true if the first list is a prefix of the second, meaning that 
the first list matches, 1 for 1, the beginning of the second list.

For example:

  (prefix=? (list "a" "b") (list "a" "b" "c")) --> true
  (prefix=? (list "a" "b") (list "b" "c"))     --> false
  (prefix=? (list "a" "b") (list "a" "b"))     --> true
  (prefix=? (list "a" "b") (list "a"))         --> false

  
As a reminder, here is a data definition for a list of strings. To 
save space later we are calling it LOS instead of ListOfString.
|#

;; Data Definitions:

(@htdd LOS)
;; LOS is one of:
;;  - empty
;;  - (cons String LOS)
;; interp. a list of strings
(define LOS1 empty)
(define LOS2 (cons "a" (cons "b" empty)))

;; Function:

(@htdf prefix=?)
(@signature LOS LOS -> Boolean)
;; produce true if the first list is a prefix of the second

(check-expect (prefix=? empty empty) true)
(check-expect (prefix=? empty (list "a" "b")) true)
(check-expect (prefix=? (list "a" "b") empty) false)
(check-expect (prefix=? (list "a" "b") (list "a" "b" "c")) true)
(check-expect (prefix=? (list "a" "b") (list "b" "c"))false)
(check-expect (prefix=? (list "a" "b") (list "a" "b"))true)
(check-expect (prefix=? (list "a" "b") (list "a"))false)

;(define (prefix=? list1 list2) false)

(@template-origin 2-one-of) ;because were are going into both data

#|

list1   list2       empty          (Cons string LOS)              
empty               true[1]                 true[1]
(cons String LOS)   false[2]                (and (first list1)  [3]
                                                 (first list2)
                          (prefix=? (rest list1) (rest list2))))

|#

(define (prefix=? lst1 lst2)
  (cond [(empty? lst1) true]    ;[1]
        [(empty? lst2) false]   ;[2]
        [else
         (and (string=? (first lst1)      ;[3]
              (first lst2))
              (prefix=? (rest lst1) (rest lst2)))]))
