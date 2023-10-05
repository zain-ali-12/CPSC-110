;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w2-mt2/mt2-p4)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line


(@htdf qselect)
(@signature (listof Number) Number -> Number)
;; use quickselect to produce the nth smallest element of lon (0 based)
;; CONSTRAINT: lon contains no duplicates, and has at least n+1 elements
(check-expect (qselect (list 2) 0) 2)
(check-expect (qselect (list 2 1) 0) 1)
(check-expect (qselect (list 1 2) 1) 2)
(check-expect (qselect (list 1 3 2) 2) 3) ;all after pivot
(check-expect (qselect (list 3 2 1) 1) 2) ;all before pivot
(check-expect (qselect (list 6 5 4) 0) 4)
(check-expect (qselect (list 6 4 5) 1) 5)
(check-expect (qselect (list 6 5 4) 2) 6) 
(check-expect (qselect (list 8 3 11 1 12 5 2 10 4 6) 5) 6)
(check-expect (qselect (list 11 3 8 1 12 5 2 10 4 6) 5) 6)


(@template-origin genrec use-abstract-fn)

(define (qselect lon n)
  ;; Base case: empty
  ;; Reduction: strict subset (at least one element removed) from lon
  ;; Argument: repeated strict subset of list always reaches empty

  ;; The SIMPLEST way to write this is as follows. But it computes lon>p
  ;; every time whereas, on average, it should only be need just under
  ;; 50% of the time.  So the bottom solution is actually better.
  #;
  (cond [(empty? (rest lon)) (first lon)]
        [else
         (local [(define p (first lon))
                 (define lon<p (filter (lambda (n) (< n p)) lon))
                 (define lon>p (filter (lambda (n) (> n p)) lon))]
           (cond [(= n (length lon<p)) p]
                 [(< n (length lon<p)) (qselect lon<p n)]
                 [else
                  (qselect lon>p  (- n (length lon<p) 1))]))])
  
  (cond [(empty? (rest lon)) (first lon)]
        [else
         (local [(define p (first lon))
                 (define lon<p (filter (lambda (n) (< n p)) lon))]
           (cond [(= n (length lon<p)) p]
                 [(< n (length lon<p)) (qselect lon<p n)]
                 [else
                  (qselect (filter (lambda (n) (> n p)) lon)
                           (- n (length lon<p) 1))]))]))
