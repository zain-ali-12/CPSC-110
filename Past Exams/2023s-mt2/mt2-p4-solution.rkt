;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2023s-mt2/mt2-p4);Do not edit or remove this tag

(@cwl ???)   ;fill in your CWL here (same as for problem sets)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line

#|

Consider the following data definitions which you will recognize from problem 3:

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
(define A4 (make-agent "Sally" 4 "RED" empty))
(define A5 (make-agent "Sue"   20 "BLUE" (list A3 A4)))

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


(@htdf fold-agent)
(@signature (String Natural Z Y -> X) (X Y -> Y) Y Z Z Agent -> X)

(check-expect (fold-agent make-agent cons empty "RED" "BLUE" A5) A5)
(check-expect (fold-agent (lambda (name nm rteam rmr) (+ nm rmr)) + 0 0 0 A5)
              (+ 1 4 8 4 20))

(@template-origin encapsulated Agent ListOfAgent Team)

(define (fold-agent c1 c2 b1 b2 b3 a0)
  (local [(define (fn-for-agent a)
            (c1 (agent-name a)
                (agent-n-missions a)
                (fn-for-team (agent-team a))
                (fn-for-loa (agent-subs a))))

          (define (fn-for-loa loa)
            (cond [(empty? loa) b1]
                  [else
                   (c2 (fn-for-agent (first loa))
                       (fn-for-loa (rest loa)))]))

          (define (fn-for-team t)
            (cond [(string=? t "RED")  b2]
                  [(string=? t "BLUE") b3]))]
    
    (fn-for-agent a0)))


