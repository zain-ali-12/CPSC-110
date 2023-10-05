;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p1-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w2-mt1/mt1-p3)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line

(@htdd Bar)
(define-struct b-one (w b))
(define-struct b-two (w1 w2 b))
;; Bar is one of:
;;  - "none"
;;  - "error"
;;  - (make-b-one Integer Bar)
;;  - (make-b-two Integer Bar Bar)

(@dd-template-rules one-of          ;4 subclasses
                    atomic-distinct ;"none"
                    atomic-distinct ;"error"
                    compound        ;(make-b-one Integer Bar)
                    self-ref        ;(b-one-b b) is Bar
                    compound        ;(make-b-two Integer Integer Bar)
                    self-ref)       ;(b-two-b b) is Bar

(define (fn-for-bar b)
  (cond [(and (string? b) (string=? b "none")) (...)]
        [(and (string? b) (string=? b "error")) (...)]
        [(b-one? b)
         (... (b-one-w b)
              (fn-for-bar (b-one-b b)))]
        [else
         (... (b-two-w1 b)
              (b-two-w2 b)
              (fn-for-bar (b-two-b b)))]))
