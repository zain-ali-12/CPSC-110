;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2020w1-mt2-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2020w1-mt2/mt2-p4)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;THIS IS REALLY PROBLEM 4.  DO NOT EDIT OR DELETE THIS LINE!

;; This problem concerns the following data definitions:

(@htdd Date)
;; Date is String
;; interp. a calendar date

(@htdd Person)
(define-struct person (name bdate marriages))
;; Person is (make-person String Date (listof Marriage))
;; interp. A person with their first name, birthdate and all their marriages

(@htdd Marriage)
(define-struct marriage (date spouse children))
;; Marriage is (make-marriage Date Person (listof Person))
;; interp. A marriage record with the date, the spouse, and the children

(define P0 (make-person "Ali" "1 Jul 1973" empty))
(define P1 (make-person "Sam" "11 Nov 1998" empty))
(define P2 (make-person "Alex" "11 Oct 2003" empty))

(define P3 (make-person "Avi" "1 Jan 1971"
                        (list (make-marriage "3 Aug 1996"
                                             P0 (list P1 P2)))))

(@template-origin
 Person Marriage Date (listof Person) (listof Marriage) encapsulated)

(define (fn-for-person p)
  (local [(define (fn-for-person p)
            (... (person-name p)
                 (fn-for-date (person-bdate p))
                 (fn-for-lom (person-marriages p))))

          (define (fn-for-marriage m)
            (... (fn-for-date (marriage-date m))
                 (fn-for-person (marriage-spouse m))
                 (fn-for-lop (marriage-children m))))

          (define (fn-for-date d)
            (... d))

          (define (fn-for-lop lop)
            (cond [(empty? lop) (...)]
                  [else
                   (... (fn-for-person (first lop))
                        (fn-for-lop (rest lop)))]))

          (define (fn-for-lom lom)
            (cond [(empty? lom) (...)]
                  [else
                   (... (fn-for-marriage (first lom))
                        (fn-for-lom (rest lom)))]))]
    (fn-for-person p)))

;; Complete the design of the the abstract fold function for Person. You
;; must add the following to the start we have provided below:
;; function fold-person, and provide:
;;   - one check-expect - that produces a copy of the consumed Person
;;   - a correct function definition
;;
;; A file that does check syntax will lose a significant number of marks.
;; Run your work often, so that you can check and fix errors as soon as they
;; creep in.  Also be sure to run every time before you submit.

(@htdf fold-person)
(@signature (String Z B -> X) (Z X A -> Y) (Date -> Z) 
            (X A -> A) (Y B -> B) A B Person -> X)
;; abstract fold for person

(check-expect (fold-person make-person make-marriage identity
                           cons cons empty empty P3) P3)

(@template-origin Person (listof Person) Date encapsulated)

(define (fold-person c1 c2 c3 c4 c5 b1 b2 p)
  (local [(define (fn-for-person p)
            (c1 (person-name p) 
                (fn-for-date (person-bdate p))
                (fn-for-lom (person-marriages p))))

          (define (fn-for-marriage m)
            (c2 (fn-for-date (marriage-date m))
                (fn-for-person (marriage-spouse m))
                (fn-for-lop (marriage-children m))))

          (define (fn-for-date d)
            (c3 d))

          (define (fn-for-lop lop)
            (cond [(empty? lop) b1]
                  [else
                   (c4 (fn-for-person (first lop))
                       (fn-for-lop (rest lop)))]))

          (define (fn-for-lom lom)
            (cond [(empty? lom) b2]
                  [else
                   (c5 (fn-for-marriage (first lom))
                       (fn-for-lom (rest lom)))]))]
    (fn-for-person p)))

