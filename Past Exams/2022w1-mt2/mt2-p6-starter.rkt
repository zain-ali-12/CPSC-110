;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p6-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2022w1-mt2/mt2-p6)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line
(@problem 6) ;do not edit or delete this line


#|

An encoded message is sent using a string of packets. Being that there may be
people listening on the line, the recipient has a list of natural numbers to
decode the message. 

|#

(@htdd Message)
(define-struct packet (data key next))
;; Message is one of:
;; - empty
;; - false
;; - (make-packet String Natural Packet)
;; interp. a Message is either empty meaning no data is being sent,
;;         false meaning the data is corrupted or
;;         a packet that contains data, key and rest of Message

(define M1 (make-packet "ALL NIGHT" 4 false))
(define M2 (make-packet "DANCE" 3 M1))
(define M3 (make-packet "SLEEP" 5 empty))

#|

YOU ARE NOT PERMITTED TO USE THE STEPPER AT ANY POINT IN THIS EXAM.

You must complete the design of a function called decode that decodes messages
as follows:

    - if the list is empty the message ends with "STOP"
    - otherwise if there are no more packets the message ends with "EOF"
    - otherwise if the packet is corrupted the message ends with ":" if the 
      first element of the list is odd, and "*" if it is even
    - otherwise
        - if the key in the packet matches the first number in the list
          then the packet's data is added to the message, and the 
          decoding continues with the next packet and next element of
          the list
        - if the key in the packet does not match the first number in
          the list then a string of n "_" are added to the message,
          corresponding to the number that is the first element of 
          the list (See note below about the replicate primitive 
          function), and the decoding continues with the next package
          and next element of the list

NOTE:
replicate is a primitive function that consumes a Natural and a String
and replicates the String n times. 

(replicate n s) → String
  n : Natural
  s : String

NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - the function you design must be called decode
 - it must follow the signature and purpose below
 - it must use the parameter names specified in the stub
 - it must be designed as a 2-one-of function
 - you must include a 2-one-of table
 - you must number the table cells and the corresponding question/answer
   pairs in the code
 - for full credit you should simplify if possible
 - all code in cond questions must be produced by cond question rules in 
   the dd template rules
 - you must not comment out any @ metadata tags
 - you must not edit, comment out, or delete the test below
 - you should add appropriate additional tests
 - your submission must pass the Check Syntax button
 - you must follow all applicable design rules

|#


(@htdf decode)

(@signature Message (listof Natural) -> String)
;; produce decoded message
(check-expect (decode M2 (list 3 4 5)) "DANCEALL NIGHT:")

(define (decode m lon) "")

