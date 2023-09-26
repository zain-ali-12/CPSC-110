;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname m02-grade-standing-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment lectures/m02-grade-standing)

(@cwl sali34)

;;
;; YOU MUST CONSULT THE m02-grade-standing-documents.rkt
;; starter file which has documents you will need.  But do all your
;; actual work in this starter file.
;;
;; We want to design a program to operate on submitted grades. For now 
;; JUST FOCUS ON THE % GRADE AND STANDING.  AFTER designing a representation
;; for this information, you must design two functions:
;;
;;  - A fn that consumes grade/standing and produces true if
;;    the grade/standing is >= 90.  Call this function excellent?
;;
;;  - A fn that consumes grade/standing and produces strings
;;    like  "90%"  "75%" "P" "F". Call this function grade->string


(@problem 1)
;; Data definition goes here:

(@htdd GradeStanding)
;; GradeStanding is one of;;
;; - Natural
;; - "H"
;; - "P"
;; - "F"
;; - "T"
;; interp. a percent grade OR standing
;; CONSTRAINT: if natural is in [0, 100]

(define GS1 10)
(define GS2 "H")

(@dd-template-rules one-of              ;5 cases
                    atomic-non-distinct ;Natural
                    atomic-distinct     ;"H"
                    atomic-distinct     ;"P"
                    atomic-distinct     ;"F"
                    atomic-distinct     ;"T"
                    )

;;Mixed data itemization

(define (fn-for-grade-standing gs)
  (cond [(number? gs) (... gs)]
        ;; with guarding 
        [(and( string? gs)(string=? gs "H")) (...)]
        [(string=? gs "P") (...)] ;; without guarding
        [(and (string? gs)(string=? gs "F")) (...)]
        [else (...)]))

(@htdf excellent?)
(@signature GradeStanding -> Boolean)
;;produce true if percentage mark is 90 or greater
(check-expect (excellent? 91) true)
(check-expect (excellent? 90) true)
(check-expect (excellent? 89) false)
(check-expect (excellent? 80) false)
(check-expect (excellent? 0) false)
(check-expect (excellent? "H") false)
(check-expect (excellent? "P") false)
(check-expect (excellent? "F") false)
(check-expect (excellent? "T") false)

;(define (excellent? gs) false) ;stub

(@template-origin GradeStanding)

(@template
 (define (excellent? gs)
  (cond [(number? gs) (... gs)]
        [(string=? gs "H") (...)]
        [(string=? gs "P") (...)]
        [(string=? gs "F") (...)]
        [else (...)])))

(define (excellent? gs)
  (cond [(number? gs) (>= gs 90)]
        [(string=? gs "H") false]
        [(string=? gs "P") false]
        [(string=? gs "F") false]
        [else false]))



(@problem 2)
;(@htdf grade->string)

(@htdf give-standing)
(@signature GradeStanding -> Boolean)
;;produce true if percentage mark is 90 or greater
(check-expect (give-standing 91) "H")
(check-expect (give-standing 90) "H")
(check-expect (give-standing 89) "P")
(check-expect (give-standing 80) "P")
(check-expect (give-standing 0) "F")

;(define (excellent? gs) false) ;stub

(@template-origin GradeStanding)

(@template
 (define (excellent? gs)
  (cond [(number? gs) (... gs)]
        [(string=? gs "H") (...)]
        [(string=? gs "P") (...)]
        [(string=? gs "F") (...)]
        [else (...)])))

(define (excellent? gs)
  (cond [(number? gs) (>= gs 90)]
        [(>= gs 90) "H"]
        [(>= gs 50) "P"]
        [else false]))


