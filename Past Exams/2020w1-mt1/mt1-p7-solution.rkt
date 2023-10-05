;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2020W1-MT1-P7-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2020w1-mt1/mt1-p7)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;this is actually problem 7 - DO NOT EDIT OR DELETE this line

;; In each part of this problem you will be given a short description of
;; problem domain information.  You need to determine what form of data
;; definition is most appropriate to representing that information.
;;
;; In each part of the problem you must:
;;   - first select how many data definitions are required to represent the
;;     problem domain information
;;   - select the form of those data definitions
;;   - explain very consisely why you made that choice
;;
;; NOTE that if you select 1 data definition then you must only select one
;;      form of definition.  If you select more than one form when you mark 1
;;      you will lose all marks for that part of the problem

;; A:
;;
;; A driver's licence class in British Columbia.  BC defines the following
;; classes of drivers licence:
;;   - class 1
;;   - class 2
;;   - class 3
;;   - class 4 restricted
;;   - class 4 unrestricted
;;   - class 5
;;   - class 6
;;   - class 7L
;;   - class 7
;;   - class 8L
;;   - class 8
;;
;; 
;; How many data definitions?

(define NUMBER-OF-DDS-FOR-PART-A 1) ;<<<replace the 0 with 1 or 2

;;
;; Replace the ??? in the definition's value with the FIRST data definition
;; form in the list below that is correct
;;

(define FORM-OF-FIRST-DD-FOR-PART-A "enumeration")
;; "self-referential"
;; "compound"
;; "enumeration"
;; "itemization"
;; "simple atomic"


;; If you chose 1 data definition then skip to part B.
;; If you chose 2 data definition replace the ??? in the definition's
;; value with the FIRST data definition form in the list below that is
;; correct.

(define FORM-OF-SECOND-DD-FOR-PART-A "???")
;; "self-referential"
;; "compound"
;; "enumeration"
;; "itemization"
;; "simple atomic"

;; Explain in one comment line (not longer than 80 characters) why you
;; made your choice.
;; 
;;


;; Part B:
;;
;; A shopping list, with the name and number to buy of each item
;;
;; 

(define NUMBER-OF-DDS-FOR-PART-B 2) ;<<<replace the 0 with 1 or 2

;;
;; Replace the ??? in the definition's value with the FIRST data definition
;; form in the list below that is correct
;;

(define FORM-OF-FIRST-DD-FOR-PART-B "self-referential")
;; "self-referential"
;; "compound"
;; "enumeration"
;; "itemization"
;; "simple atomic"


;; If you chose 1 data definition then stop here
;; If you chose 2 data definition replace the ??? in the definition's
;; value with the FIRST data definition form in the list below that is
;; correct.

(define FORM-OF-SECOND-DD-FOR-PART-B "compound")
;; "self-referential"
;; "compound"
;; "enumeration"
;; "itemization"
;; "simple atomic"

;; Explain in one comment line (not longer than 80 characters) why you
;; made your choice.
;; 
;;

