;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2019W2-F-P1-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2019w2-f/f-p1)

(@cwl ???)


(@problem 1)

;; Consider the following data definition:

(@htdd Hobbit)
(define-struct hob (name age sons))
;; Hobbit is (make-hob String Natural (listof Hobbit))
;; interp. a hobbit in a patriarchal family tree
;;         name is the first name
;;         age at time of death
;;         sons is list of their male children

(define H1 (make-hob "Bungo" 54 (list (make-hob "Bilbo" 146 empty))))
(define H2 (make-hob "Longo" 123
                     (list (make-hob "Otho" 98
                                     (list (make-hob "Lotho" 136 empty))))))

(define H3 (make-hob "Bingo" 56 (list (make-hob "Falco" 98 empty))))

(define H4 (make-hob "Polo" 80
                     (list (make-hob "Posco" 98
                                     (list (make-hob "Ponto" 108 empty)
                                           (make-hob "Porto" 74 empty))))))

(define H5 (make-hob "Fosco" 117
                     (list (make-hob "Drogo" 76
                                     (list (make-hob "Frodo" 98 empty)))
                           (make-hob "Dudo" 113 empty))))

(define H6 (make-hob "Mungo" 97 (list H1 H2 H3)))
(define H7 (make-hob "Ponto" 94 (list H4)))
(define H8 (make-hob "Largo" 100 (list H5)))
(define H9 (make-hob "Balbo" 110 (list H6 H7 H8)))


(define (fn-for-hobbit h)
  (local [(define (fn-for-hobbit h)
            (... (hob-name h)
                 (hob-age h)
                 (fn-for-loh (hob-sons h))))
          
          (define (fn-for-loh loh)
            (cond [(empty? loh) (...)]
                  [else
                   (... (fn-for-hobbit (first loh))
                        (fn-for-loh (rest loh)))]))]

    (fn-for-hobbit h)))


;;
;; PROBLEM 1:
;;
;; Design a function that consumes a hobbit and a natural number and produces
;; a list of all the hobbits in the tree older than the given age.  Your
;; function MUST be called older-than, and it must consume a hobbit and a
;; natural number in that order
;;

(@htdf older-than)
