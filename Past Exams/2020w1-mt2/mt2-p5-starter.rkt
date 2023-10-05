;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2020w1-mt2-p5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2020w1-mt2/mt2-p5)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 4) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 5)
;;
;; Given the following data definitions, determine the signature of the abstract
;; fold function for Arbre, called fold-arbre.
;;
;; As always, a file that does not run will lose a significant number of marks.
;; Run your work often, so that you can check and fix errors as soon as they
;; creep in.  Also be sure to run every time before you submit.
;;

(@htdd Arbre Fruit)
(define-struct trey (a b c))
;; Arbre is (make-trey String Integer Fruit)


(define-struct pear (f o))
;; Fruit is one of:
;;  - false
;;  - (make-pear Arbre Fruit)


(@htdf fold-arbre)
;; Enter your signature here:
(@signature )
;; Abstract fold for Arbre

;; check-expects intentionally omitted from this question

(@template-origin Arbre Fruit encapsulated)

(define (fold-arbre c1 c2 b1 t)
  (local [(define (fn-for-arbre t)
            (c1 (trey-a t)
                (trey-b t)
                (fn-for-fruit (trey-c t))))

          (define (fn-for-fruit fp)
            (cond [(false? fp) b1]
                  [else
                   (c2 (fn-for-arbre (pear-f fp))
                       (fn-for-fruit (pear-o fp)))]))]

    (fn-for-arbre t)))
