;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2020w1-mt2-p3-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2020w1-mt2/mt2-p3)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 3)

;; This is a two one of problem involving the following two types. 

(@htdd Natural)
;; Natural is one of:
;;  - 0
;;  - (add1 Natural)

(@htdd ListOfInteger)
;; ListOfInteger is one of:
;;  - empty
;;  - (cons Integer ListOfInteger)
;; interp. a list of integers


;; Design a function called descending-from-n? that consumes a list of integers
;; and a natural N and produces true if the list is a descending sequence
;; starting with N and ending with 1.
;;
;; For example:
;;  (descending-from-n? (list 7 6 5 4 3 2 1) 7)  -> true
;;  (descending-from-n? (list 7 6 4 5) 7)        -> false
;;  (descending-from-n? (list 6 5 4 3 2 1) 8)    -> false
;;  (descending-from-n? empty 3)                 -> false
;;
;; Your solution must include all appropriate tags, a 2 one of table, with
;; numbered cells, and a clear correspondence between each cell and the
;; matching cond case in the function.
;;
;; For full credit you should reduce cond cases; but a non-reduced table, with
;; correct correspondences, and a properly working function will earn more
;; marks than design with reductions that has incorrect correspondences or
;; does not work correctly.
;;
;; As always, a file that does not run will lose a significant number of marks.
;; Run your work often, so that you can check and fix errors as soon as they
;; creep in.  Also be sure to run every time before you submit.
;;

(@htdf descending-from-n?)
(@signature ListOfInteger Natural -> Boolean)
;; produce true if lon is a descending series starting at n

(check-expect (descending-from-n? (list ) 0) true)
(check-expect (descending-from-n? (list 1) 0) false)
(check-expect (descending-from-n? (list 7 6 5 4 3 2 1) 7) true)
(check-expect (descending-from-n? (list 7 6 4 5) 7) false)
(check-expect (descending-from-n? (list 6 5 4 3 2 1) 8) false)
(check-expect (descending-from-n? empty 3) false)
(check-expect (descending-from-n? (list 1) 1) true)

(@template-origin 2-one-of)

#|
Not simplified table

            n ->               0        (add1 Natural)                     
                                                                           
loi                                                                        
                                                                           
                                                                           
 v                                                                         

                                                                           
                                                                           
empty                      true [1]          false [2]                     
                                                                           
                                                                           

                                                                           
                                                                           
(cons Natural LOI)         false [3]         (and (= (first loi) n)   [4]  
                                                  (descending-from-n?      
                                                   (rest loi) (sub1 n)))   

|#

#;
(define (descending-from-n? loi n)
  (cond [(and (empty? loi) (zero? n)) true]            ; [1]
        [(empty? loi) false]                           ; [2]
        [(zero? n) false]                              ; [3]
        [else                                          ; [4]
         (and (= (first loi) n)
              (descending-from-n?
               (rest loi) (sub1 n)))]))

#|
Simplified table

            n ->               0        (add1 Natural)                     
                                                                           
loi                                                                        
                                                                           
                                                                           
 v                                                                         

                                                                           
                                                                           
empty               (empty? loi) [1]       false [2]
                                                                           
                                                                           

                                                                           
                                                                           
(cons Natural LOI)  (empty? loi) [1]       (and (= (first loi) n)   [3]      
                                                (descending-from-n?          
                                                 (rest loi) (sub1 n)))

|#


(define (descending-from-n? loi n)
  (cond [(zero? n) (empty? loi)] ; [1]
        [(empty? loi) false]     ; [2]
        [else                    ; [3]
         (and (= (first loi) n)
              (descending-from-n? (rest loi)
				  (sub1 n)))]))
