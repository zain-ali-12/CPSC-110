;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt2-p3-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2023s-mt2/mt2-p3);Do not edit or remove this tag

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line

#|

Consider the following data definitions:

|#

(@htdd Agent ListOfAgent Team)

(define-struct agent (name n-missions team subs))
;; Agent is (make-agent String Natural Team ListOfAgent)
;; interp. a secret agent with:
;;         a code name,
;;         a tally of completed missions,
;;         an assigned team,
;;         and a list of agents they supervise, which can include
;;         agents from both teams.
;;
;; ListOfAgent is one of:
;; - empty
;; - (cons Agent ListOfAgent)
;; interp. a list of agents
;;
;; Team is one of:
;; - "RED"
;; - "BLUE"
;; interp. the team to which a secret agent is assigned

(define A0 (make-agent "Lorraine" 30 "BLUE" empty))
(define A1 (make-agent "Eagle" 1 "RED" empty))
(define A2 (make-agent "Steve" 4 "BLUE" empty))
(define A3 (make-agent "Spider" 8 "BLUE" (list A1 A2)))

(@template-origin encapsulated Agent ListOfAgent Team)

(define (fn-for-agent a0)
  (local [(define (fn-for-agent a)
            (... (agent-name a)
                 (agent-n-missions a)
                 (fn-for-team (agent-team a))
                 (fn-for-loa (agent-subs a))))

          (define (fn-for-loa loa)
            (cond [(empty? loa) (...)]
                  [else
                   (... (fn-for-agent (first loa))
                        (fn-for-loa (rest loa)))]))

          (define (fn-for-team t)
            (cond [(string=? t "RED") (...)]
                  [(string=? t "BLUE") (...)]))]
    (fn-for-agent a0)))

#|
The RED team and the BLUE team both want to recognize their most highly
qualified operatives. Complete the design of a function that consumes an Agent,
a Natural, and a Team, in that order, and produces a list of the names of all
agents in the given tree that BOTH:
  - have completed a number of missions >= the given natural
  - belong to the given team

For example
  
  (agents-of-the-month A3 4 "BLUE")

should produce
  
  (list "Spider" "Steve").


NOTE: This problem will be autograded, and ALL OF THE FOLLOWING ARE ESSENTIAL
      IN YOUR SOLUTION.  Failure to follow these requirements may result in
      receiving zero marks for this problem.

 - The function you design MUST BE CALLED agents-of-the-month.
 
 - You MUST use the encapsulated templates above.
 
 - You MUST NOT RENAME any of the local functions within those templates.
 
 - You MUST NOT RENAME any of the parameters of those local functions.
 
 - You MUST USE ALL of the local functions within those templates.
 
 - You MUST NOT EDIT the data definitions in any way.
 
 - You MUST NOT EDIT the provided @htdf tag, @signature tag, or purpose.
 
 - You MUST NOT COMMENT out any @ metadata tags.
 
 - The file MUST NOT have any errors when the Check Syntax button is pressed.
   Press Check Syntax and Run often, and correct any errors early.
 
 - You MUST FOLLOW all applicable design rules.

|#

(@htdf agents-of-the-month)
(@signature Agent Natural Team -> ListOfString)
;; produce names of agents on given team with missions >= given # of missions

;; *** As a reminder, you must not edit anything above this line!!! ***

(define (agents-of-the-month a n team) empty) ;stub
