;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p4-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2023s-mt1/mt1-p4)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line

(@htdd Floo)
(define-struct powder (a b))
;; Floo is one of:
;;  - "N/A"
;;  - Number
;;  - (make-powder Natural Floo)

(@dd-template-rules one-of              ;3 subclasses
                    atomic-distinct     ;"N/A"
                    atomic-non-distinct ;Number
                    compound            ;(make-powder Natural Floo)
                    self-ref)           ;(powder-b f) is Floo

(define (fn-for-floo f)
  (cond [(and (string? f) (string=? f "N/A")) (...)]
        [(number? f) (... f)]
        [else
         (... (powder-a f)
              (fn-for-floo (powder-b f)))]))
