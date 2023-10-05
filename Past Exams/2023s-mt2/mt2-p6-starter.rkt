;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2023s-mt2/mt2-p6);Do not edit or remove this tag

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line
(@problem 6) ;do not edit or delete this line

#|

Complete the design of the function below by writing the template origin tag
and the function definition.  

For example, (explode-pyramid "apple") would produce:

   (list (list "a")
         (list "a" "p")
         (list "a" "p" "p")
         (list "a" "p" "p" "l")
         (list "a" "p" "p" "l" "e"))

Please note that your solution to this problem MUST NOT use the explode
function. You will almost certainly want to use the substring function
however.

For maximum credit your solution should have two calls to build-list and
no other calls to built-in abstract functions.

NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - The function you design MUST BE CALLED explode-pyramid.
 - You MUST NOT COMMENT out any @ metadata tags.
 - You MUST NOT EDIT the provided tests.
 - You MUST NOT EDIT any part of the file above the first line marked with ***.
 - You MUST FOLLOW all applicable design rules.
 - The file MUST NOT have any errors when the Check Syntax button is pressed.

 - The function definition MUST call one or more built-in abstract functions.

 - You must define a single top-level function with the given name. You are
   permitted to define helpers, but they must be defined within the the
   top-level function using local.

 - The function definition and any helper functions you design MUST NOT be
   recursive.

 - The result of the function must directly be the result of one of the
   built-in abstract functions. So, for example, the following would not
   be a valid function body:

       (define (foo x)
         (empty? (filter ...)))

   This would be a valid function body:

       (define (foo x)
         (local [(define (helper y) (foldr ... ... ...))]
           (helper ...)))

|#

(@htdf explode-pyramid)
(@signature String -> (listof (listof 1String)))
;; produce given string exploded into increasingly long lists of 1strings
(check-expect (explode-pyramid "") empty)
(check-expect (explode-pyramid "apple")
              (list (list "a")
                    (list "a" "p")
                    (list "a" "p" "p")
                    (list "a" "p" "p" "l")
                    (list "a" "p" "p" "l" "e")))

;; *** Must not edit any line above here. ***

(define (explode-pyramid s) empty) ;stub
