;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname MT1-P2-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2021s1-mt1/mt1-p2)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)


(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 2)
;;
;; PROBLEM 2A
;;
;; Correctly complete the @dd-template-rules annotation for the
;; following partial data definition.
;;

(@htdd Status)
;; Status is one of:
;; - "packaging"
;; - "shipping"
;; - "delivery"
;; interp. the shipping status of a package

(@dd-template-rules one-of
                    atomic-distinct
                    atomic-distinct
                    atomic-distinct)


;;
;; PROBLEM 2B
;;
;; Correctly complete the @dd-template-rules annotation for the
;; following partial data definition.
;;
(@htdd Order)
(define-struct pkg (cost status size))
;; Order is one of:
;; - false
;; - (make-pkg Natural Status Natural)
;; interp. an order for a shipping company
;; false means the order has been cancelled

(@dd-template-rules one-of
                    atomic-distinct
                    compound
                    ref)
                    
