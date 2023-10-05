;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
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


(@htdf fund-projects)
(@signature ListOfProject Natural -> ListOfProject)
;; produce projects in lop with funding increased by f ($), not exceeding target
(check-expect (fund-projects empty 100) empty)
(check-expect (fund-projects
               (cons (make-project "PA" 2000 1500)
                     (cons (make-project "PB" 5000 200) empty))
               500)
              (cons (make-project "PA" 2000 2000)
                    (cons (make-project "PB" 5000 700) empty)))
(check-expect (fund-projects
               (cons (make-project "PA" 2000 1999)
                     (cons (make-project "PB" 2000 1000) empty))
               100)
              (cons (make-project "PA" 2000 2000)
                    (cons (make-project "PB" 2000 1100) empty)))

;(define (fund-projects lop) lop) ; stub

(@template-origin ListOfProject)

(@template
 (define (fund-projects lop f)
   (cond [(empty? lop) (...)]
         [else
          (... (fn-for-project (first lop))
               (fund-projects (rest lop))
               f)])))

(define (fund-projects lop f)
  (cond [(empty? lop) empty]
        [else
         (cons (fund-one-project (first lop) f)
               ; doing this does not follow the reference rule!
               ;(make-project (project-name (first lop))
               ;              (project-target (first lop))
               ;              (min (project-target (first lop)) (+ (project-funded (first lop)) f)))
               (fund-projects (rest lop) f))]))


(@htdf fund-one-project)
(@signature Project Natural -> Project)
;; increases funding by f ($), not exceeding target amount
(check-expect (fund-one-project (make-project "PA" 180 180) 100)
              (make-project "PA" 180 180))
(check-expect (fund-one-project (make-project "PA" 180 80) 100)
              (make-project "PA" 180 180))
(check-expect (fund-one-project (make-project "PA" 180 79) 100)
              (make-project "PA" 180 179))
(check-expect (fund-one-project (make-project "PA" 180 81) 100)
              (make-project "PA" 180 180))
(check-expect (fund-one-project (make-project "PB" 2000 500) 200)
              (make-project "PB" 2000 700))
 
;(define (fund-one-project p f) p)  ; stub

(@template-origin Project)

(@template
 (define (fund-one-project p n)
   (... (project-name p)
        (project-target p)
        (project-funded p)
        n)))

(define (fund-one-project p f)
  (make-project (project-name p)
                (project-target p)
                (min (project-target p) (+ (project-funded p) f))))
