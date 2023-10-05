;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2019W2-F-P4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
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

(@htdf long-seq-list) ;START YOUR SOLUTION BELOW HERE
