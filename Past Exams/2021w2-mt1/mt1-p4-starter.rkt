;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p4-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2021w2-mt1/mt1-p4)

(@cwl ???) ;fill in your CWL here (same as for problem sets)


;;
;; Consider the following data definitions:
;;

;; DATA DEFINITIONS

(@htdd Project)
(define-struct project (name target funded))
;; Project is (make-project String Natural Natural)
;; interp. a project with a name n, target funding in CAD dollars,
;;         and amount funded so far in CAD dollars
(define P1 (make-project "P123" 1000000     50))
(define P2 (make-project "P456"  500000 250000))
(define P3 (make-project "P789"   10000      0))

(@dd-template-rules compound) ;3 fields

(define (fn-for-project p)
  (... (project-name p)
       (project-target p)
       (project-funded p)))


(@htdd ListOfProject)
;; ListOfProject is one of
;; - empty
;; - (cons Project ListOfProject)
;; interp. a list of projects
(define LOP1 empty)
(define LOP2 (cons P1 (cons P2 empty)))

(@dd-template-rules one-of           ; 2 cases
                    atomic-distinct  ; empty
                    compound         ; (cons Project ListOfProject)
                    ref              ; (first lop) is Project
                    self-ref)        ; (rest lop) is ListOfProject

(define (fn-for-lop lop)
  (cond [(empty? lop) (...)]
        [else
         (... (fn-for-project (first lop))
              (fn-for-lop (rest lop)))]))


;; FUNCTIONS

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE! (This is actually problem 4)

#|
 Design a function fund-projects that consumes a list of projects and an
 amount of new funding (in $) to be added to each project.

 The function must produce a list of projects with funding increased
 by the specified amount, except that no project should go over its own
 target amount. So, if the function tries to add $100 in funding to a project
 with a target funding amount of $500 that currently has $450 in funding,
 the funding will be increased to $500 (the target amount), not $550.

 NOTE *ALL* OF THE FOLLOWING IMPORTANT POINTS. IF YOU FAIL TO FOLLOW *ANY* OF
 THESE THE SUBMISSION WILL LOSE SIGNIFICANT MARKS.

  - This file will be autograded.
  - Every function design must include all htdf recipe elements and tags.
    In particular a function design without an @htdf tag will not be graded.
  - You must follow all applicable design rules.
  - You must not comment out any metadata tags.
  - The function must be called fund-projects and it must have
    a signature of ListOfProject Natural -> ListOfProject.
  - If you design a helper, that helper must consume the Natural as its
    second argument.
  - Any file for which Check Syntax fails may receive as little as 0 marks.

|#

(@htdf fund-projects)

