;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p1-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2022w1-mt2/mt2-p1)

(@problem 1) ;do not edit or delete this line


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

(@template-origin Professor (listof String) (listof Professor)  encapsulated)

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




(@htdf profs-with-award)
(@signature String Professor -> (listof String))
;; produce the names of all profs in the tree who have the given award
(check-expect (profs-with-award "Sloan" P1) empty)
(check-expect (profs-with-award "Sloan" P4) (list "Heer"))
(check-expect (profs-with-award "VGTC" P4) (list "Heer"))
(check-expect (profs-with-award "foo" P9) empty)
(check-expect (profs-with-award "Microsoft" P9) (list "Hullman"))
(check-expect (profs-with-award "VGTC" P9) (list "Munzner" "Heer"))
(check-expect (profs-with-award "VisAcademy" P9)
              (list "Hanrahan" "Munzner" "Heer"))



(@template-origin Professor (listof String)  (listof Professor) encapsulated)

(define (profs-with-award str p)
  (local [(define (fn-for-prof p)
            (if (fn-for-los (prof-awd p))
                (cons (prof-nam p) (fn-for-lop (prof-stu p)))
                (fn-for-lop (prof-stu p))))

          (define (fn-for-los los)
            (cond [(empty? los) false]
                  [else
                    (or (string=? (first los) str)
                        (fn-for-los (rest los)))]))

          (define (fn-for-lop lop)
            (cond [(empty? lop) empty]
                  [else
                   (append (fn-for-prof (first lop))
                           (fn-for-lop (rest lop)))]))]

    (fn-for-prof p)))
