;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p2-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2023s-mt1/mt1-p2)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line

#|

Design a function that consumes three strings called first, last and hostname.
It should produce a string with the first character of first, "_", all of last,
and hostname appended together. For example:

  (email-address "shiv" "roy" "@mail.ca") should produce "s_roy@mail.ca"

You should assume that none of first, last, or hostname are empty strings.

Your function design must include a @signature tag, purpose, commented out 
stub, appropriate tests, a @template-origin tag, a @template tag, and a 
function definition.

NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - The function you design MUST BE CALLED email-address.
 - You MUST NOT EDIT the provided @htdf tag.
 - You MUST NOT COMMENT out any @ metadata tags.
 - You must follow all applicable design rules.
 - The file MUST NOT have any errors when the Check Syntax button is pressed.

As a reminder, BSL includes a function called substring that works as
follows

  (substring "abcdefg" 2 3) produces "c"

|#

(@htdf email-address)