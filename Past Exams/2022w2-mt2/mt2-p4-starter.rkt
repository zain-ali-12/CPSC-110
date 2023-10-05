;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p4-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w2-mt2/mt2-p4)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line


#|

 In this problem, you are asked to design a function that implements the
 quickselect algorithm.  Quickselect is similar to the quicksort algorithm
 we discussed in lecture. But, instead of sorting the list, quickselect
 produces the nth smallest element in the given list (USING 0 BASED INDEXING),
 where n is a parameter to the function. In this version of quickselect we are 
 allowing you to place 2 additional constraints on the arguments:

   - the list contains no duplicates
   - the list contains at least n+1 elements

 Note that this is a generative recursion problem. You should use the genrec
 template, and your function should work as follows:

   - take the first element of the list (lon) as a pivot (p), and split the
     list into two new lists, one with elements less than p (lon<p) and one
     with elements > than p (lon>p)
   - if the lon<p sublist contains the nth element of lon, produce the result
     of recursing on that sublist and n
   - if p is the nth element of lon produce p
   - otherwise produce the result of recursing on the second sublist and an
     appropriately reduced n

Below we provide an @htdf tag, purpose, @signature and A FEW SAMPLE TESTS. The
tests given are not enough to pass test thoroughness, and may not even be enough
for you to fully understand how the function works.  They are simply there to
get you started and make it clear what the function does.

This problem will be autograded.  NOTE that all of the following are required.
Violating one or more will cause your solution to receive 0 marks.

  - The file MUST NOT have any errors when the Check Syntax button is pressed.
    Press Check Syntax and Run often, and correct any errors early.

  - You MUST NOT edit or comment out the provided @htdf tag.

  - You MUST NOT edit or comment out the provided @signature tag.

  - You MUST NOT edit or comment out the provided check-expects.

  - You MUST NOT change the order of the provided check-expects

  - You SHOULD add new check-expects AFTER the existing check-expects.

|#

(@htdf qselect)
(@signature (listof Number) Number -> Number)
;; use quickselect to produce the nth smallest element of lon (0 based)
;; CONSTRAINT: lon contains no duplicates, and has at least n+1 elements
(check-expect (qselect (list 2) 0) 2)
(check-expect (qselect (list 2 1) 0) 1)
(check-expect (qselect (list 1 2) 1) 2)
(check-expect (qselect (list 8 3 11 1 12 5 2 10 4 6) 5) 6)

;; DO NOT EDIT ABOVE THIS LINE

(define (qselect lon n) 0) ;stub
