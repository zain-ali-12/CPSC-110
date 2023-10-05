;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt2-p3-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2023s-mt2/mt2-p3);Do not edit or remove this tag

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line

(@htdd Agent ListOfAgent Team)

(define-struct agent (name n-missions team subs))
;; Agent is (make-agent String Natural Team ListOfAgent)
;; interp. an organization of secret agents. each agent has:
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
;;         within their organization

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

;; Some more agents, for use in tests
(define A4 (make-agent "Mercury" 0 "BLUE" empty))
(define A5 (make-agent "Bigfoot" 2 "RED" (list A4)))
(define A6 (make-agent "Nimbus" 9 "RED" (list A5 A3)))

(@htdf agents-of-the-month)
(@signature Agent Natural Team -> ListOfString)
;; produce names of agents on given team with missions >= given # of missions
(check-expect (agents-of-the-month A4 0 "BLUE") (list "Mercury"))
(check-expect (agents-of-the-month A4 0 "RED") empty)
(check-expect (agents-of-the-month A4 1 "BLUE") empty)
(check-expect (agents-of-the-month A1 1 "RED") (list "Eagle"))
(check-expect (agents-of-the-month A1 1 "BLUE") empty)
(check-expect (agents-of-the-month A1 2 "RED") empty)
(check-expect (agents-of-the-month A3 1 "BLUE") (list "Spider" "Steve"))
(check-expect (agents-of-the-month A6 4 "BLUE") (list "Spider" "Steve"))

;(define (agents-of-the-month a n team) empty)

(@template-origin encapsulated Agent Team ListOfAgent)

(define (agents-of-the-month a0 n team)
  (local [(define (fn-for-agent a)
            (if (and (>= (agent-n-missions a) n)
                     (fn-for-team (agent-team a)))
                (cons (agent-name a) (fn-for-loa (agent-subs a)))
                (fn-for-loa (agent-subs a))))

          (define (fn-for-loa loa)
            (cond [(empty? loa) empty]
                  [else
                   (append (fn-for-agent (first loa))
                           (fn-for-loa (rest loa)))]))

          (define (fn-for-team t)
            (cond [(string=? t "RED") (string=? team "RED")]
                  [(string=? t "BLUE") (string=? team "BLUE")]))]
    (fn-for-agent a0)))

