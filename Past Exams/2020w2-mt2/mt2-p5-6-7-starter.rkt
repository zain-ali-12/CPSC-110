;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p5-6-7-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2020w2-mt2/mt2-p5-6-7)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;THIS FILE ACTUALLY HAS 5, 6 & 7.  DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;THIS FILE ACTUALLY HAS 5, 6 & 7.  DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;THIS FILE ACTUALLY HAS 5, 6 & 7.  DO NOT EDIT OR DELETE THIS LINE!
(@problem 4) ;THIS FILE ACTUALLY HAS 5, 6 & 7.  DO NOT EDIT OR DELETE THIS LINE!

;;
;; Complete the design of the following functions by writing the template tag
;; and the function definition.  
;;
;; These problems will be autograded.  NOTE that all of the following are
;; required. Violating one or more will cause your solution to receive 0 marks.
;;
;;   - Files must not have any errors when the Check Syntax button is pressed.
;;     Press Check Syntax and Run often, and correct any errors early.
;;
;;   - The function definition MUST call one or more built-in abstract
;;     functions.
;;
;;   - For maximum credit the function definition should use the most clear
;;     and expressive combination of abstract functions.  In particular, while
;;     it is possible to just use foldr for these problems that is not always
;;     correct. If what is happening is a filter, then it is not correct to 
;;     just implement filtering with foldr.
;;
;;   - The function definition MUST NOT be recursive.
;;
;;   - The function definition MUST NOT use any part of the recursive Natural
;;     template or the (listof X) template.
;;
;;       - it must not include (cond [(empty? ... anywhere
;;       - it must not include (cond [(zero? ... anywhere
;;       - it must not include (if (empty? ... anywhere
;;       - it must not include (if (zero? ... anywhere
;;
;;   - The result of the function must directly be the result of one of the
;;     built-in abstract functions. So, for example, the following is not
;;     a valid function body:
;;
;;        (define (foo x)
;;          (empty? (filter ...)))
;;
;;   - You MUST NOT change or comment out any check-expects, but you are free
;;     to add new ones.
;;

(@problem 5)
;;
;; Complete the design of the following function.
;;
(@htdf sum-interval)
(@signature Integer Integer -> Integer)
;; produce the sum of the integers in [lo, hi].
;; CONSTRAINT: lo <= hi
(check-expect (sum-interval 5 5) (+ 5))
(check-expect (sum-interval 3 6) (+ 3 4 5 6))

(define (sum-interval lo hi) 0)








(@problem 6)
;;
;; Complete the design of the following function. You can and should use
;; member in your solution.
;;
(@htdf set-difference)
(@signature (listof Number) (listof Number) -> (listof Number))
;; produce list of the elements in lst1 that are not in lst2
;; CONSTRAINT: no duplicates in lst1; and no duplicates in lst2
(check-expect (set-difference (list 1 3 7 2) (list 1 2)) (list 3 7))

(define (set-difference lst1 lst2) empty)





(@problem 7)
;;
;; Complete the design of the following function.
;;
;; Note that we are giving you a next-countdown function which you must
;; call.  DO NOT encapsulate it inside the local, leave it at top-level.
;;

(@htdd Countdown)
;; Countdown is one of:
;;  - false
;;  - Natural
;; interp. A countdown to 0 indicating number of seconds left, or false
;;         to indicate the countdown ended more than one second ago. So
;;         they countdown  5, 4, 3, 2, 1, 0, false...

(@htdf next-countdowns)
(@signature (listof Countdown) -> (listof Countdown))
;; next every countdown once, keep false countdowns in list for one tick only
(check-expect (next-countdowns empty) empty)
(check-expect (next-countdowns (list 0 3 1 false 2)) (list false 2 0    1))

(define (next-countdowns loc) empty) ;stub




(@htdf next-countdown)
;; advance countdown by 1 along 3, 2, 1, 0, false
(check-expect (next-countdown 10) 9)
(check-expect (next-countdown 1) 0)
(check-expect (next-countdown 0) false)
(check-expect (next-countdown false) false)

(@template-origin Countdown)

(define (next-countdown c)
  (cond [(false? c) false]
        [else
         (if (zero? c)
             false
             (sub1 c))]))
