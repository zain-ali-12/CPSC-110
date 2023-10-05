;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2020W1-MT1-P2-P3-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2022w1-mt1/mt1-p1)



(@problem 1) ;do not delete or edit this line

(@htdd Foo)
(define-struct bar (x y)) 
;; Foo is one of:
;; - Number
;; - "red"
;; - "green"
;; - (make-bar Number Foo)

(@dd-template-rules one-of
                    atomic-non-distinct
                    atomic-distinct
                    atomic-distinct
                    compound
                    self-ref)

(define (fn-for-foo f)
  (cond [(number? f) (... f)]
        [(and (string? f) (string=? f "red"))   (...)]        
        [(and (string? f) (string=? f "green")) (...)]
        [else
         (... (bar-x f)
              (fn-for-foo (bar-y f)))]))

;; this is also correct
#; 
(define (fn-for-foo f)
  (cond [(number? f) (... f)]
        [(and (string? f) (string=? f "red"))   (...)]
        [(string? f) (...)]
        [else
         (... (bar-x f)
              (fn-for-foo (bar-y f)))]))
