;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname pset-09-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
;; DO NOT PUT ANYTHING PERSONALLY IDENTIFYING BEYOND YOUR CWL IN THIS FILE.
;; YOUR CWLs WILL BE SUFFICIENT TO IDENTIFY YOU AND, IF YOU HAVE ONE, YOUR
;; PARTNER
;;

(require spd/tags)

(@assignment psets/pset-09);Do not edit or remove this tag

;; If you are:
;;   - A 110 or 107 student replace the first set of '???'s with your cwl.
;;     For problem sets, If you have a partner, please replace the second
;;     set of '???'s with their cwl.  Remember this, it is what you will
;;     do with these @cwl annotations for the whole course.
;;   - A UBC Extended Learning student, replace the first set of ??? with
;;     your email address as confirmed in the email you received from
;;     extended learning.  The handin password is also in that email.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   
(@cwl ??? ???)

;;
;; THIS IS THE MOST CHALLENGING PROBLEM SET SO FAR THIS TERM.  PLEASE BE
;; SURE YOU WORK THROUGH IT CAREFULLY THOUGH.  110 FINAL EXAMS OFTEN INCLUDE
;; PROBLEMS BASED ON PROBLEM SETS 9, 10, OR 11.
;;
;; ALSO NOTE THAT THE AUTOGRADER COOL DOWN IS 1 HOUR FOR THIS PROBLEM SET.
;;
;; THERE WILL BE A SPECIAL PINNED THREAD ON PIAZZA IN WHICH WE WILL ANSWER
;; QUESTIONS ABOUT THIS PROBLEM SET.
;;
;; In this problem set you are going to work on one of the toughest problems
;; we face running 110 - scheduling of TAs.  As you may know, we have about
;; 45 TAs, and we have to schedule them for many labs, 3 lectures, and office
;; hours.  We solved this by writing a schedule solver, and that's what you
;; are going to do for this problem set.
;;
;; We are making it a little easier for you, in that all you will be having
;; to deal with is labs. 
;;
;; We are giving you two key data definitions, as well as some examples of
;; that data.  We are also giving you a wish list entry for the main solve
;; function you have to design.  The function consumes a list of lab slots
;; to fill, and a list of TAs.  It produces a list of assignments.  So, for
;; example, in the following very simple case, where there are two slots,
;; and two TAs, you get an assignment of the TAs to those slots.
;;
;; (solve (list (make-slot "A" 1) (make-slot "B" 1))
;;        (list (make-ta "Ali" (list "B"))
;;              (make-ta "Azi" (list "A"))))  ==>
;;
;; (list (list "Ali" "B") (list "Azi" "A"))
;;
;; In this simple example there was only one possible assignment. But in
;; general there might be more than one assignment, or it might be impossible
;; to generate an assignment.

;; By now you know enough about search to know that the first thing you need
;; to do is figure out the search space.  What does the tree look like? What
;; information do you have to represent at each node in the tree?  How do you
;; generate the next nodes in the tree? How do you tell you have a solution?
;; Although this function ends up producing just a list of assignments, does
;; it need more than just the assignments so far at each node in the tree?
;; What other information do you need to represent at each node?
;;
;; As you consider the search tree, note that a TA can work more than one slot,
;; but a slot is filled by one TA.  So once you assign a TA to a slot that slot
;; is done.
;;
;; As usual, anything we give you below you must not change.  The autograder
;; will want to call solve with arguments as described below.  Also note that
;; we give you just a few small data examples for illustration. You will want
;; to test your function with additional examples.
;;

(@problem 1)

;; Constants:

(define MAX-SLOTS-PER-TA 3) ;this is the max number of labs a TA can work

;; Data definitions:

(@htdd Slot)
(define-struct slot (lab n))
;; Slot is (make-slot String Natural)
;; interp. the name of a lab - "A", "B", etc.
;;         the lab's slot number - 1, 2, 3 etc.
;;         A given lab can have multiple slots, each slot 
;;         should have a unique number in that lab.
;;  
(define SLOTS1
  (list (make-slot "A" 1) (make-slot "A" 2)   ;A needs 2 TAs
        (make-slot "B" 1)                     ;B needs 1
        (make-slot "C" 1) (make-slot "C" 2))) ;C needs 2

(@htdd TA)
(define-struct ta (name avail))
;; TA is (make-ta String (listof String))
;; interp. A TA with their name and the labs names they are free to work.

(define TAS1
  (list (make-ta "Ali" (list "A" "B"))
        (make-ta "Ari" (list     "B" "C"))
        (make-ta "Azi" (list "A"     "C"))))


(@htdf solve)
(@signature (listof Slot) (listof TA) -> (listof (listof String)) or false)
;; produce assignments of form (list (list "ta name" "lab name") ...)
;; CONSTRAINTS:
;;  - The list of slots must not contain duplicates (slots with the
;;    same lab name and number).
;;  - The list of TAs must not contain duplicates (tas with the
;;    same name)
(define (solve slots tas) empty)  ;stub

