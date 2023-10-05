;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p2-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2023s-mt1/mt1-p2)

(@cwl ???)   ;fill in your CWL here (same as for problem sets)

(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line

(@htdf email-address)
(@signature String String String -> String)
;; produce first character of first, "_", last and hostname appended together
;; CONSTRAINT: first, last, and hostname are not empty strings

(check-expect (email-address "shiv" "roy" "@waystar.com") "s_roy@waystar.com")
(check-expect (email-address "greg" "hirsch" "@mail.com") "g_hirsch@mail.com")

;(define (email-address first last hostname) "") ;stub

(@template-origin String)

(@template
 (define (email-address first last hostname)
   (... first last hostname)))

(define (email-address first last hostname)
  (string-append (substring first 0 1)
                 "_"
                 last
                 hostname))

