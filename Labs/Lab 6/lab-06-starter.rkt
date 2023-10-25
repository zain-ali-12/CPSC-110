;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname lab-06-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment labs/lab-06)

;; If you are:
;;   - A 110 or 107 student replace the first set of '???'s with your cwl.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   - A UBC Extended Learning student, replace the first set of ??? with
;;     the your email address as confirmed in the email you received from
;;     extended learning.  The handin password is also in that email.
;;     Remember this, it is what you will do with these @cwl annotations
;;     for the whole course.
;;   
(@cwl sali34 ???)

(@problem 1)
;; DATA DEFINITIONS ===============
(@htdd SentenceTree)

(define-struct stree (prefix subs))
;; SentenceTree is (make-stree String ListOfSentenceTree)

(define ST1 (make-stree
             "KISS ME"
             (list(make-stree "JOKING ABOUT JEALOUSY" empty)
                  (make-stree
                   "LIKE"
                   (list (make-stree "YOU REALLY MEAN IT" empty)
                         (make-stree
                          "WE ARE"
                          (list (make-stree
                                 "IN A BACK TO SCHOOL SPECIAL ABOUT MONO"
                                 empty)
                                (make-stree
                                 "PERCHED ON THE TIP OF A SINKING SHIP"
                                 empty)))))
                  (make-stree "TO" (list
                                    (make-stree "FREEZE TIME" empty)
                                    (make-stree "MY FAVOURITE SONG ON REPEAT"
                                                empty))))))
(define (fn-for-stree stree)
  (... (stree-prefix stree)
       (fn-for-los (stree-subs stree))))


(@htdd ListOfSentenceTree)
;; ListOfSentenceTree is one of:
;; - empty
;; - SentenceTree

(define (fn-for-los los)
  (... (first los)
       (rest los)))

;; FUNCTIONS ======================
(@problem 2)
;============================================================================
(@htdf sentence-count)
(@signature SentenceTree -> Natural)
(@signature ListOfSentenceTree -> Natural)
;; produce the number of sentences in the tree

(check-expect (sentence-count (make-stree "KISS ME" empty) )1)
(check-expect (sentence-count (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING" empty))) )1)
(check-expect (sentence-count (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING" empty)
                                (make-stree "LIKE" empty))) )2)
(check-expect (sentence-count (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING"
                                            (list (make-stree "HELLO"
                                                              empty)))
                                (make-stree "LIKE" empty))) )2)

(check-expect (sentence-count (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING"
                                            (list (make-stree "HELLO"
                                                              empty)))
                                (make-stree "LIKE"
                                            (list (make-stree "FOR"
                                                              empty))))))2)
(check-expect (sentence-count (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING"
                                            (list (make-stree "HELLO"
                                                              empty)))
                                (make-stree "LIKE"
                                            (list (make-stree "FOR"
                                                              empty)
                                                  (make-stree "ONE"
                                                              empty)
                                                  (make-stree "TWO"
                                                              empty))))))4)
(check-expect (sentence-count (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING"
                                            (list (make-stree "HELLO"
                                                              empty)
                                                  (make-stree "BYE"
                                                              empty)))
                                (make-stree "LIKE"
                                            (list (make-stree "FOR"
                                                              empty)
                                                  (make-stree "ONE"
                                                              empty)
                                                  (make-stree "TWO"
                                                              empty))))))5)
              

;(define (sentence-count ST1) 0) ; stub
(@template-origin SentenceTree)
(@template
 (define (sentence-count stree)
   (... (stree-ref stree)
        (stree-subs stree))))

(define (sentence-count stree)
  (+ (cond
       [(empty? (stree-subs stree)) 1]
       [else 0])
     (total-list (stree-subs stree))))

;============================================================================

(@template-origin ListOfSentenceTree)
(@template
 (define (total-list los)
   (cond [(empty? los) (...)]
         [else
          (... (first los)
               (total-list (rest los)))])))

(define (total-list los)
  (cond
    [(empty? los) 0]
    [else
     (+ (sentence-count (first los))
        (total-list (rest los)))]))
;============================================================================

(@problem 3)

(@htdf render--stree)
(@signature SentenceTree -> Image)

(check-expect (render--stree (make-stree "KISS ME" empty))
              (render--stree (make-stree "KISS ME" empty)))
(check-expect (render--stree (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING" empty))))
              (render--stree (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING" empty)))))
(check-expect (render--stree (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING" empty)
                                (make-stree "LIKE" empty))))
              (render--stree (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING" empty)
                                (make-stree "LIKE" empty)))))
(check-expect (render--stree (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING"
                                            (list (make-stree "HELLO"
                                                              empty)))
                                (make-stree "LIKE" empty))) )
              (render--stree (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING"
                                            (list (make-stree "HELLO"
                                                              empty)))
                                (make-stree "LIKE" empty)))))

(check-expect (render--stree (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING"
                                            (list (make-stree "HELLO"
                                                              empty)))
                                (make-stree "LIKE"
                                            (list (make-stree "FOR"
                                                              empty)
                                                  (make-stree "ONE"
                                                              empty)
                                                  (make-stree "TWO"
                                                              empty))))))
              (render--stree (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING"
                                            (list (make-stree "HELLO"
                                                              empty)))
                                (make-stree "LIKE"
                                            (list (make-stree "FOR"
                                                              empty)
                                                  (make-stree "ONE"
                                                              empty)
                                                  (make-stree "TWO"
                                                              empty)))))))
(check-expect (render--stree (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING"
                                            (list (make-stree "HELLO"
                                                              empty)
                                                  (make-stree "BYE"
                                                              empty)))
                                (make-stree "LIKE"
                                            (list (make-stree "FOR"
                                                              empty)
                                                  (make-stree "ONE"
                                                              empty)
                                                  (make-stree "TWO"
                                                              empty))))))
              (render--stree (make-stree
                               "KISS ME"
                               (list
                                (make-stree "JOKING"
                                            (list (make-stree "HELLO"
                                                              empty)
                                                  (make-stree "BYE"
                                                              empty)))
                                (make-stree "LIKE"
                                            (list (make-stree "FOR"
                                                              empty)
                                                  (make-stree "ONE"
                                                              empty)
                                                  (make-stree "TWO"
                                                              empty)))))))

;(define (render--stree stree) 0)

(@template-origin SentenceTree)

(@template
 (define (render--stree st)
   ([c1]... (text (stree-prefix st) TEXT-SIZE TEXT-COLOUR)
        (render--lost (stree-subs st)))))

(define (render--stree st)
   (beside (text (stree-prefix st) 20 "white" )
        (render--lost (stree-subs st))))

;========================================================

(@signature ListOfSentenceTree -> Image)

(@template-origin ListOfSentenceTree)
(@template
 (define (render--lost lost)
   (cond [(empty? lost) ([b1]...)]
         [else
          ([c2]... (render--stree (first lost))
               (render--lost (rest lost)))])))

(define (render--lost lost)
   (cond [(empty? lost) empty-image]
         [else
          (above/align "left" (render--stree (first lost))
               (render--lost (rest lost)))]))