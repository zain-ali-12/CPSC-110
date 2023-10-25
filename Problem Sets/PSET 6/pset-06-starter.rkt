;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname pset-06-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; DO NOT PUT ANYTHING PERSONALLY IDENTIFYING BEYOND YOUR CWL IN THIS FILE.
;; YOUR CWLs WILL BE SUFFICIENT TO IDENTIFY YOU AND, IF YOU HAVE ONE, YOUR 
;; PARTNER.
;;
(require spd/tags)

(@assignment psets/pset-06); Do not edit or remove this tag

;; If you are:
;;   - A 110 or 107 student replace the first set of '???'s with your cwl.
;;     For problem sets, If you have a partner, please replace the second
;;     set of '???'s with their cwl.  Remember this, it is what you will
;;     do with these @cwl annotations for the whole course.
;;   - A UBC Extended Learning student, replace the first set of ??? with
;;     your email address as confirmed in the email you received from
;;     extended learning.  The handin password is also in that email.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   
(@cwl sali34 ???)


(@problem 1)
;; Below is the start of a data definition called Course that represents limited
;; information about UBC courses.  Below there are only two example data.  
;; Please complete this definition by adding constants C110, C213, C313 and C317
;; which are representations of the descendent tree for 110, 213, 313 and 317.  
;; You can find the information you need at
;;  https://cs110.students.cs.ubc.ca/psets/pset-06-image.png
;;
;; NOTE 1: Use the information in the image above, rather than any other source.
;;         We are significantly simplying the information.
;;
;; NOTE 2: Do this very carefully, the autograder wants to see correct results
;;         from the functions you design to operate on this data.
;;
;; NOTE 3: The tree you will make for C110 will be a bit odd because 210 has 110
;;         as a pre-req, and both 213 and 221 have 210 as a pre-req, and313 has
;;         213 AND 221 as a pre-req, and 317 has 213 AND 221 as a pre-req. As a
;;         result, 313 and 317 will both show up twice in your descendent tree
;          for C110. This is okay for this problem set.
;; NOTE 4: Expect this step of the problem set to take you some time.


(@htdd Course ListOfCourse)
(define-struct course (number credits dependents))
;; Course is (make-course Natural Natural ListOfCourse)
;; interp. a course with a course number,
;;         the number of credits the course is worth, and a
;;         list of courses that list this course as a direct pre-requisite

;; ListOfCourse is one of:
;; - empty
;; - (cons Course ListOfCourse)
;; interp. a list of courses

(define LOC0 empty)
(define C100 (make-course 100 3 LOC0))
(define C189 (make-course 189 1 LOC0))
(define C203 (make-course 203 3 LOC0))
(define C302 (make-course 302 3 LOC0))
(define C303 (make-course 303 3 LOC0))
(define C304 (make-course 304 3 LOC0))
(define C311 (make-course 310 3 LOC0))
(define C313 (make-course 313 3 LOC0))
(define C314 (make-course 314 3 LOC0))
(define C317 (make-course 317 3 LOC0))
(define C319 (make-course 319 4 LOC0))
(define C320 (make-course 320 3 LOC0))
(define C322 (make-course 322 3 LOC0))
(define C310 (make-course 310 4 (list C319)))
(define C221 (make-course 221 4 (list C304 C313 C314 C317 C320 C322)))
(define C213 (make-course 213 4 (list C313 C317)))
(define C210 (make-course 210 4 (list C213 C221 C310 C311)))
(define C110 (make-course 110 4 (list C189 C203 C210 C302 C303)))

(define (fn-for-course c)
  (... (course-number c)
       (course-credits c)
       (fn-for-loc (course-dependents c))))

(define (fn-for-loc loc)
  (cond [(empty? loc) (...)]
        [else
         (... (fn-for-course (first loc))
              (fn-for-loc (rest loc)))]))

(@problem 2)
;;
;; Design a function that produces the list of all the course numbers in the
;; course's tree including the given course's number.
;;
;; Your @htdf tag and the rest of the design MUST have the definition for
;; the function that takes Course as an argument first. The function that
;; operates on a list must be second.  Marks will only be rewarded for
;; solutions that order the design this way.
;;

(@htdf list-course--course list-course--list)
(@signature Course -> ListOfNatural)
(@signature ListOfCourse -> ListOfNatural)

(check-expect (list-course--course C100) (list 100))
(check-expect (list-course--course C213) (list 213 313 317))
(check-expect (list-course--list empty) empty)
(check-expect (list-course--list (list C100 C203)) (list 100 203))

(@template-origin Course)

;;(define (list-course--course c) empty);stub
(define (list-course--course c)
  (cons (course-number c)
        (list-course--list (course-dependents c))))

(@template-origin ListOfCourse)

;(define (list-course--list loc) empty);stub
(define (list-course--list loc)
  (cond [(empty? loc) empty]
        [else
         (append (list-course--course (first loc))
                 (list-course--list (rest loc)))]))


(@problem 3)
;;
;; Design a function that takes two arguments: a Course and a Natural, in that
;; order. It produces the list of courses in the tree that are worth that
;; many credits or more.
;;
;; Your @htdf tag and the rest of the design MUST have the definition for
;; the function that takes Course as an argument first. The function that
;; operates on a list must be second.  Marks will only be rewarded for
;; solutions that order the design this way.
;;
(@htdf courses>ncredits--course courses>ncredits--list)

(@signature Course Natural -> ListOfCourse)
(@signature ListOfCourse Natural -> ListOfCourse)
(@signature Course Natural -> Boolean)

(check-expect (courses>ncredits--course C189 3) empty)
(check-expect (courses>ncredits--course C310 3) (list C310 C319))
(check-expect (courses>ncredits--course C322 3) (list C322))

(check-expect (courses>ncredits--list empty 3) empty)
(check-expect (courses>ncredits--list (list C319 C189 C320) 3) (list C319 C320))

(@template-origin Course)


(define (courses>ncredits--course c n)
  (if (>ncredits? c n)
      (cons c (courses>ncredits--list (course-dependents c) n))
      (courses>ncredits--list (course-dependents c)n )))


(@template-origin ListOfCourse)
(define (courses>ncredits--list loc n)
  (cond [(empty? loc) empty]
        [else
         (append (courses>ncredits--course (first loc) n)
                 (courses>ncredits--list (rest loc) n))]))


(define (>ncredits? c n)
  (>= (course-credits c) n))


(@problem 4)
;;
;; Design a function that produces the largest course number in the tree.
;;
;; Your @htdf tag and the rest of the design MUST have the definition for
;; the function that takes Course as an argument first. The function that
;; operates on a list must be second.  Marks will only be rewarded for
;; solutions that order the design this way.
;;

(@htdf largest--course largest--list)

(@template-origin Course)

(check-expect (largest--course C221) 322)

(define (largest--course c)
  (if(> (course-number c)
        (largest--list (course-dependents c)))
     (course-number c)
     (largest--list (course-dependents c))))

(@template-origin ListOfCourse)

(define (largest--list loc)
  (cond [(empty? loc) 0]
        [else
         (if (> (largest--course (first loc))
                (largest--list (rest loc)))
             (largest--course (first loc))
             (largest--list (first loc)))]))

(@problem 5)
;;
;; Design a function that takes two arguments: a Course and a Natural, in that
;; order. It produces the course in the tree with that course number. If it
;; can't find a course in the given tree with that course number, it signals
;; failure by producing false.
;;
;; Your @htdf tag and the rest of the design MUST have the definition for
;; the function that takes Course as an argument first. The function that
;; operates on a list must be second.  Marks will only be rewarded for
;; solutions that order the design this way.
;;
