;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w2-mt1/mt1-p2)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line

(@htdf abbrev)
(@signature String Natural Natural -> String)
;; produce appended ath and bth characters of str
;; CONSTRAINT: a and b are less than string length of s; s is not ""

(check-expect (abbrev "abcdef" 2 4) "ce")
(check-expect (abbrev "abcdef" 4 2) "ec")
(check-expect (abbrev "012345" 0 0) "00")
(check-expect (abbrev "012345" 2 2) "22")

;(define (abbrev str a b) "")

(@template-origin String)

(@template
 (define (abbrev str a b)
   (... str a b)))

(define (abbrev str a b)
  (string-append (substring str a (add1 a))
                 (substring str b (add1 b))))


