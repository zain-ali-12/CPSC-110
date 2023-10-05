;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p3-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)



(@assignment exams/2021w2-mt1/mt1-p3)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE! (This is actually problem 3)

(@htdd Bazzle)
(define-struct who (l m))
;; Bazzle is one of:
;;  - Number
;;  - "A"
;;  - "B"
;;  - (make-who Bazzle String)
;;  - Boolean

(@dd-template-rules one-of
                    atomic-non-distinct
                    atomic-distinct
                    atomic-distinct
                    compound
                    self-ref
                    atomic-non-distinct)

(define (fn-for-bazzle b)
  (cond [(number? b) (... b)]
        [(and (string? b) (string=? b "A")) (...)]
        [(and (string? b) (string=? b "B")) (...)] ;question could be
        ;                                          ;simplified to (string? b)
        [(who? b)
         (... (fn-for-bazzle (who-l b))
              (who-m b))]
        [else
         (... b)]))

