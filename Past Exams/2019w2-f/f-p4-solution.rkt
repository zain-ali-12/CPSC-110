;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname f-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2019w2-f/f-p4)

(@cwl ???)

(@problem 1) ;ignore, but DO NOT DELETE this line
(@problem 2) ;ignore, but DO NOT DELETE this line
(@problem 3) ;ignore, but DO NOT DELETE this line
(@problem 4)

;; Design a function called long-seq-list that consumes a list of natural
;; numbers and produces the longest sequence of consecutive numbers ignoring
;; duplicates.  Note that two numbers are consecutive if adding 1 to the first
;; produces the second.
;;
;; For example:
;;   (long-seq-list (list 1 1 1 2 2 5 5 5 7 8 8 9 15 19)) -> (list 7 8 9)
;;
;; Once we ignore duplicates, the longest sequence is clearly 7 8 9.
;; 
;; You are guaranteed that the list is sorted and has at least one element.
;; 
;; Your function MUST be tail-recursive.
;;
;; Finally remember that BSL/ISL/ASL have a primitive function called reverse
;; that given a list produces a list with the elements in reverse order. 

(@htdf long-seq-list)
(@signature (listof Natural) -> (listof Natural))
;; produce the longest sequence of consecutive numbers ignoring duplicates
;; CONSTRAINT: list is sorted and has at least one element
(check-expect (long-seq-list (list 1))
              (list 1))
(check-expect (long-seq-list (list 1 1)) (list 1))

(check-expect (long-seq-list (list 1 1 1 2 2 5 5 5 7 8 8 9 15 19))
	      (list 7 8 9))

(check-expect (long-seq-list (list 1 1 2)) (list 1 2))
(check-expect (long-seq-list (list 1 1 1 1 1 2 2 2 2 2 2 4 5 5 6 6 6))
              (list 4 5 6))

(check-expect (long-seq-list (list 1 1 2 3 4 5 5 8 9 10 10 10 14 15 15 16))
              (list 1 2 3 4 5))

(check-expect (long-seq-list (list 1 1 2 3 3 5 5 6 6 7 7 7))
              (list 1 2 3))
(check-expect (long-seq-list (list 1 1 2 3 4 4 6 7 8 8 8 12 13 13 15 18
                                   19 20 21 22 22 24 25 26 27))
              (list 18 19 20 21 22))



(@template-origin accumulator (listof Natural))
(define (long-seq-list lon0)
  ;; prev is Natural; number before (first lon) in lon0
  ;; rsf is (listof Natural); longest sequence so far
  ;; curr is (listof Natural); current sequence
  (local [(define (fn-for-lon lon prev curr rsf)
            (cond [(empty? lon) (reverse rsf)]
                  [else
                   (cond [(= (first lon) prev) 
                          (fn-for-lon (rest lon) (first lon) curr rsf)]   
                         [(= (first lon) (add1 prev)) 
                          (fn-for-lon (rest lon)
                                      (first lon)
                                      (cons (first lon) curr)
                                      (longer-of (cons (first lon) curr) rsf))]
                         [else (fn-for-lon (rest lon)
                                           (first lon)
                                           (list (first lon))
                                           rsf)])]))
          (define (longer-of l1 l2)
            (if (> (length l1) (length l2)) l1 l2))]


    (fn-for-lon lon0 (first lon0) (list (first lon0)) (list (first lon0)))))

#;#;
(@template-origin fn-composition accumulator (listof Natural))

(define (long-seq-list lon0)
  (local [;; CONSTRAINT: list is sorted, no duplicates
          ;; prev is Natural; previous number in list
          ;; curr is (listof Natural); current consecutive sequence
          ;; rsf is (listof Natural); longest consecutive sequence so far
          (define (longest-seq lon prev curr rsf)
            (cond [(empty? lon) (reverse rsf)]
                  [else
                   (if (= (first lon) (add1 prev))
                       (longest-seq (rest lon)
                                    (first lon)
                                    (cons (first lon) curr)
                                    (longest (cons (first lon) curr) rsf))
                       (longest-seq (rest lon)
                                    (first lon)
                                    (list (first lon))
                                    rsf))]))

          ;; CONSTRAINT: list is sorted and non-empty
          ;; prev is Natural; previous number in list
          ;; curr is (listof Natural); current consecutive sequence
          ;; rsf is (listof Natural); longest consecutive sequence so far
          (define (remove-duplicates lon prev rsf)
            (cond [(empty? lon) (reverse rsf)]
                  [else
                   (remove-duplicates (rest lon)
                                      (first lon)
                                      (if (= (first lon) prev)
                                          rsf
                                          (cons (first lon) rsf)))]))

          (define (longest l1 l2)
            (if (> (length l1) (length l2))
                l1
                l2))]


    (longest-seq (remove-duplicates (rest lon0)
                                    (first lon0)
                                    (list (first lon0)))
                 (first lon0)
                 (list (first lon0))                 
                 (list (first lon0)))))
