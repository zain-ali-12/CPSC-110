;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2022w1-mt1/mt1-p4)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line

#|
 
Given the following data definitions:

|#

(@htdd Package)
(define-struct pkg (vol wei des fra?))
;; Package is (make-pkg Number Natural String Boolean)

;; interp. A package, with (vol)ume in centimeters,
;;         (wei)ght of the package in grams
;;         code of (des)tination airport
;;         (fra)gile? is true if the package contains fragile items

(define P1 (make-pkg 20  100 "YYZ" false))
(define P2 (make-pkg 50  200 "YVR" false))
(define P3 (make-pkg 100 200 "YVR" true))
(define P4 (make-pkg 35  300 "YUL" true))

(@dd-template-rules compound)

(define (fn-for-pkg p)
  (... (pkg-vol p)
       (pkg-wei p)
       (pkg-des p)
       (pkg-fra? p)))

(@htdd ListOfPackage)
;; ListOfPackage is one of:
;; - empty
;; - (cons Package ListOfPackage)
;; interp. a list of packages

(define LOP1 empty)
(define LOP2 (cons P2 (cons P3 empty)))

(@dd-template-rules one-of
                    atomic-distinct
                    compound
                    ref
                    self-ref)

(define (fn-for-lop lop)
  (cond [(empty? lop) (...)]
        [else
         (... (fn-for-pkg (first lop))
              (fn-for-lop (rest lop)))]))

#|

Design a function that produces the total weight of all the packages in the list
that both contain fragile items and have a volume less than given.  For example:

  (delivery-weight 40 (cons P1 (cons P3 (cons P2 (cons P4 empty)))))

should produce 300 since P4 is the only package in the list that contains
fragile items and has a volume less than 40.  

  (delivery-weight 150 (cons P3 (cons P1 (cons P4 empty))))

should produce 500 since both P3 and P4 contain fragile items and have a volume 
less that 150; their combined weights is 300 + 200.

This problem with be autograded. Failure to comply with any of the following
will result in a significantly reduced score, or in many cases 0.

 - The function must be called delivery-weight. 
 - It must accept its arguments in the order shown above.
 - You must not in any way edit, add to, or otherwise modify any of the
   data definition above.
 - You must not comment out any of the supplied @ metadata tags.
 - You must include @htdf tag, @signature tag, purpose, sufficient tests, a
   a commented out stub, a @template-origin tag, a @template tag, and a working
   function definition.
 - You must follow all applicable design rules, including helper rules. 
 - There must be no errors when pressing Check Syntax.

|#

(@htdf delivery-weight)
