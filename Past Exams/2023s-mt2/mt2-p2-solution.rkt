;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname mt2-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2023s-mt2/mt2-p2);Do not edit or remove this tag

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line

(define BOX-A "type comment")
(define BOX-B "operand")
(define BOX-C "function example")
(define BOX-D "parameter")
(define BOX-E "expression")
(define BOX-F "function name")


;; ==========================================================================
;; >>>>>>>>   You should not read and you MUST NOT EDIT BELOW HERE   <<<<<<<<
;; ==========================================================================
;;
;; The code below here exists so that running the file will verify that your
;; answers are well-formed.
;;

(define (is-term-string x)
  (member x TERMS))

(check-satisfied BOX-A is-term-string)
(check-satisfied BOX-B is-term-string)
(check-satisfied BOX-C is-term-string)
(check-satisfied BOX-D is-term-string)
(check-satisfied BOX-E is-term-string)
(check-satisfied BOX-F is-term-string)


(define TERMS
  (list "answer expression"
        "argument"
        "atomic distinct"
        "constant definition"
        "constant name"
        "data example"
        "dd template rule"
        "expression"
        "function body"
        "function call expression"
        "function definition"
        "function example"
        "function name"
        "if statement"
        "metadata annotation"
        "operand"
        "parameter"
        "question expression"
        "structure definition"
        "template"
        "type comment"
        "type name"))
