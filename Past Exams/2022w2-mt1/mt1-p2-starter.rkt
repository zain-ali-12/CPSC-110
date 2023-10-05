;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w2-mt1/mt1-p2)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line

#|

Design a function that consumes a string and two naturals a and b, IN
THAT ORDER, and produces a string consisting of the ath and bth characters
of the string, in that order. For example:

  (abbrev "abcdefg" 2 4) should produce "ce")

You should assume the length of the string is greater than both a and b.

Your function design must include a @signature, purpose, commented out stub,
appropriate tests, a @template-origin tag, a @template tag, and a function
definition.

This problem will be autograded.  NOTE that all of the following are required.
Violating one or more will cause your solution to receive 0 marks.

 - Files must not have any errors when the Check Syntax button is pressed.
   Press Check Syntax and Run often, and correct any errors early.

 - You must define a function with the same name as in the @htdf tag below.

As a reminder, BSL includes a function called substring that works as
follows

  (substring "abcdefg" 2 3) produces "c"

|#

(@htdf abbrev)



