;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2020w1-mt2-p6-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2020w1-mt2/mt2-p6)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;THIS IS REALLY PROBLEM 6.  DO NOT EDIT OR DELETE THIS LINE!

;;
;; Design a function called tree that consumes a positive number and
;; produces a fractal image like the ones shown in the exam supplement
;;     http://cs110.students.cs.ubc.ca/exams/trees.pdf
;;
;; To save writing we are giving you a simple function called tr that consumes
;; a number and produces a black solid rectangle of width 1 and that height.
;; This will save you having to write "rectangle", "solid", and COLOR multiple
;; times.
;;
;; You must include all relevant design recipe elements, including a three part
;; termination argument.
;;

;; As always, a file that does not run will lose a significant number of marks.
;; Run your work often, so that you can check and fix errors as soon as they
;; creep in.  Also be sure to run every time before you submit.

(define COLOR "black")
(define SCALE 0.6)	; Each branch is this factor of the size of the trunk
(define CUTOFF 10)	; Minimum size for branching

(@htdf tree)
(@signature Number -> Image)
;; produce a fractal image of a tree of the given size
(check-expect (tree CUTOFF) (tr CUTOFF))
(check-expect (tree (/ CUTOFF SCALE))
              (above
               (beside (rotate 45 (tree CUTOFF)) (rotate -45 (tree CUTOFF)))
               (tr (/ CUTOFF SCALE))))
(check-expect (tree (/ CUTOFF SCALE SCALE))
              (above
               (beside (rotate 45 (tree (/ CUTOFF SCALE)))
                       (rotate -45 (tree (/ CUTOFF SCALE))))
               (tr (/ CUTOFF SCALE SCALE))))

(@template-origin genrec)
;; Termination argument
;; base case: n <= CUTOFF
;; reduction step: n * SCALE
;; argument: since CUTOFF > 0, repeatedly scaling by a value < 1 will
;;           eventually be <= CUTOFF

(define (tree n)
  (cond [(<= n CUTOFF) (tr n)]
        [else
         (local [(define branch (tree (* n SCALE)))]
           (above
            (beside (rotate 45 branch)
                    (rotate -45 branch))
            (tr n)))]))

(@htdf tr)
(@signature Number -> Image)
;; produce solid COLOR rectangle of given height and width 1

(check-expect (tr 10) (rectangle 1 10 "solid" COLOR))
(check-expect (tr 20) (rectangle 1 20 "solid" COLOR))

(@template-origin Number)

(define (tr h)
  (rectangle 1 h "solid" COLOR))
