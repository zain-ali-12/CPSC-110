;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2020w1-mt2-p2-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2020w1-mt2/mt2-p2)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 2)
;;
;; Consider the following definition.  Then answer the 5 multiple-choice
;; questions that follow.  Provide your answers by entering the appropriate
;; value for the constants my-answer-question-1 through my-answer-question-5.
;; For example:  (define my-answer-question-1 "e").
;;
;; As always, a file that does not run will lose a significant number of marks.
;; Run your work often, so that you can check and fix errors as soon as they
;; creep in.  Also be sure to run every time before you submit.
;;
;; We have added special tests at the end of the file that check whether your
;; answers are well-formed.  Any submission that fails any of those tests will
;; receive a grade of 0.
;;
(define (outer x n)
  (local [(define (two x) 2)
          (define (inner f) (build-list x f))
          (define l (inner two))
          (define f (foldr * 1 l))
          (define p? (< n f))]
    (cond [p? x]
          [else (outer (add1 x) n)])))

;; Question 1:
;; How many definitions are lifted each time the function outer is called?
;; [a] 1
;; [b] 2
;; [c] 3
;; [d] 5

(define my-answer-question-1 "d")

;; Question 2:
;; Is two a closure?
;; [a] Yes
;; [b] No

(define my-answer-question-2 "b")

;; Question 3:
;; Is inner a closure?
;; [a] Yes
;; [b] No

(define my-answer-question-3 "a")

;; Question 4:
;; Is p? a closure?
;; [a] Yes
;; [b] No

(define my-answer-question-4 "b")

;; Question 5:
;; In total, how many definitions are lifted when the expression
;; (outer 1 7) is evaluated?

(define my-answer-question-5 15)

;;============================================================================
;;============================================================================
;;============================================================================
;; You should ignore this code.  Do not read or edit below here.

;; This code is here so that running the file will verify that your answer is
;; well-formed.
(check-satisfied my-answer-question-1
		 (λ (a)
		   (member? a (list "a" "b" "c" "d"))))
(check-satisfied my-answer-question-2
		 (λ (a)
		   (member? a (list "a" "b"))))
(check-satisfied my-answer-question-3
		 (λ (a)
		   (member? a (list "a" "b"))))
(check-satisfied my-answer-question-4
		 (λ (a)
		   (member? a (list "a" "b"))))
(check-satisfied my-answer-question-5
		 integer?)
