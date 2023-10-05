;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname f-p2-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; DO NOT PUT ANYTHING PERSONALLY IDENTIFYING BEYOND YOUR CWL IN THIS FILE.

(require spd/tags)

(@assignment exams/2022w1-f/f-p2);Do not edit or remove this tag

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line

(@htdd Professor)
(define-struct prof (nam cit awd stu))
;; Professor is (make-prof String Natural (listof String) (listof Professor))
;; interp. an academic tree for professors.
;;         each professor has a (nam)e, number of (cit)ations, a list of awards
;;         they have received and list of current professors they supervised

(define P1 (make-prof "Bostock"  6720  empty empty))
(define P2 (make-prof "Borkin"   3073  empty empty))
(define P3 (make-prof "Meyer"    3880  empty empty))
(define P4 (make-prof "Heer"     27847
                      (list "Sloan" "VGTC" "ACM" "VisAcademy")
                      (list P1)))
(define P5 (make-prof "Hullman"  3253
                      (list "Google" "Microsoft")
                      empty))
(define P6 (make-prof "Munzner"  12660
                      (list "VGTC" "VisAcademy")
                      (list P2 P3)))

(define P7 (make-prof "Ng"       12720 (list "Sloan" "Hellman") empty))

(define P8 (make-prof "Agrawala" 21820 (list "Sloan" "SIGGRAPH") (list P4 P5)))
(define P9 (make-prof "Hanrahan" 50211
                      (list "Turing" "Oscar" "VisAcademy")
                      (list P6 P7 P8)))

(@template-origin Professor (listof String) (listof Professor) encapsulated)

(define (fn-for-prof p)
  (local [(define (fn-for-prof p)
            (... (prof-nam p)
                 (prof-cit p)
                 (fn-for-los (prof-awd p))
                 (fn-for-lop (prof-stu p))))

          (define (fn-for-los los)
            (cond [(empty? los) (...)]
                  [else
                   (... (first los)
                        (fn-for-los (rest los)))]))

          (define (fn-for-lop lop)
            (cond [(empty? lop) (...)]
                  [else
                   (... (fn-for-prof (first lop))
                        (fn-for-lop (rest lop)))]))]

    (fn-for-prof p)))


(@signature (String Natural Y Z -> X)
            (String Y -> Y)
            (X Z -> Z)
            Y Z Professor
            -> X)
;; abstract fold for Professor
(check-expect (fold-prof make-prof cons cons empty empty P9) P9)

(@template-origin Professor (listof String) (listof Professor)  encapsulated)

(define (fold-prof c1 c2 c3 b1 b2 p)
  (local [(define (fn-for-prof p)
            (c1 (prof-nam p)
                (prof-cit p)
                (fn-for-los (prof-awd p))
                (fn-for-lop (prof-stu p))))

          (define (fn-for-los los)
            (cond [(empty? los) b1]
                  [else
                   (c2 (first los)
                       (fn-for-los (rest los)))]))

          (define (fn-for-lop lop)
            (cond [(empty? lop) b2]
                  [else
                   (c3 (fn-for-prof (first lop))
                       (fn-for-lop (rest lop)))]))]

    (fn-for-prof p)))


(@htdf unique-award-names)
(@signature Professor -> (listof String))
;; produce a list of unique award names, removing duplicates
(check-expect (unique-award-names P3) empty)
(check-expect (unique-award-names P4) (list "Sloan" "VGTC" "ACM" "VisAcademy"))
(check-expect (unique-award-names P8)
              (list "Sloan" "SIGGRAPH" "VGTC" "ACM" "VisAcademy"
                    "Google" "Microsoft"))
(check-expect (unique-award-names P9) (list "Turing" "Oscar" "VisAcademy"
                                            "VGTC" "Sloan" "Hellman" "SIGGRAPH"
                                            "ACM" "Google" "Microsoft"))

(@template-origin use-abstract-fn)

(define (unique-award-names p)
  (local [(define (c1 n c rlos rlop) (merge-keep-first rlos rlop))
          (define (c2 f rnr) (cons f rnr))
          (define (c3 rmr rnr) (merge-keep-first rmr rnr))

          (define (merge-keep-first lst1 lst2)
            (append lst1
                    (filter (lambda (i2) (not (member i2 lst1))) lst2)))

          (define (merge-keep-last lst1 lst2)
            (append (filter (lambda (i1) (not (member i1 lst2))) lst1)
                    lst2))]

    (fold-prof c1 c2 c3 empty empty p)))
