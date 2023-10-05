;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p1-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2023s-mt1/mt1-p1);Do not edit or remove this tag

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line


(define BOX-A "data example")
(define BOX-B "constant name")
(define BOX-C "function name")
(define BOX-D "question expression")
(define BOX-E "parameter")
(define BOX-F "function call expression")


;; ==========================================================================
;; >>>>>>>>   You should not read and you MUST NOT EDIT BELOW HERE   <<<<<<<<
;; ==========================================================================
;;
;; The code below here exists so that running the file will verify that your
;; answers are well-formed.
;;


;; these are named to work well with check-satisfied failures

(define (is-term-string x)
  (member x TERMS))

; PART 1
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
