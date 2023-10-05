;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p7-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)
(require 2htdp/image)

(@assignment exams/2020w1-mt2/mt2-p7)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;this is actually problem 7(a) - DO NOT EDIT OR DELETE THIS LINE!

(@htdf without)
(@signature Number (listof Number) -> (listof Number))
;; produce a list that has every element of lon, except n

(check-expect (without 2 empty) empty)
(check-expect (without 3 (list 1 3 8 3 9 8 2 3)) (list 1 8 9 8 2))
(check-expect (without 3 (list 4 2 5 1)) (list 4 2 5 1))

(@template-origin use-abstract-fn)

(define (without n lon)
  (local [(define (notn? x) (not (= x n)))]
    (filter notn? lon)))








(@problem 2) ;this is actually problem 7(b) - DO NOT EDIT OR DELETE THIS LINE!

(@htdd Solid)
(define-struct solid (w h d))
;; Solid is (make-solid Number Number Number)
;; interp. the width, height, and depth of a 3 dimensional rectangular solid
(define SLD1 (make-solid 2 3 4))
(define SLD2 (make-solid 2.3 6 1.1))

(define (fn-for-solid s)
  (... (solid-w s)
       (solid-h s)
       (solid-d s)))

(@htdf count-larger)
(@signature (listof Solid) Number -> Natural)
;; produce the number of solids in s whose volume is >= the given volume

(check-expect (count-larger empty 10) 0)
(check-expect (count-larger (cons (make-solid 2 3 4) empty) 20) 1)
(check-expect (count-larger (cons (make-solid 2 3 4)
                                  (cons (make-solid 2 25 2)
                                        (cons (make-solid 2 25 3)
                                              empty)))
                            100)
              2)

;; Three of many alternative solutions

(@template-origin use-abstract-fn)

(define (count-larger l v)
  (local [(define (add1if>=v s rnr) (if (>= (volume s) v) (+ 1 rnr) rnr))]
    (foldr add1if>=v 0 l)))

#;#;
(@template-origin use-abstract-fn fn-composition)

(define (count-larger l v)
  (local [(define (>=v s) (if (>= (volume s) v) 1 0))]
    (foldr + 0 (map >=v l))))

#;#;
(@template-origin use-abstract-fn fn-composition)

(define (count-larger l v)
  (local [(define (>=v? s) (>= (volume s) v))
          (define (addone x sum) (add1 sum))]
    (foldr addone 0 (filter >=v? l))))

;; You may call the following helper in your solution if you wish.

(@htdf volume)
(@signature Solid -> Number)
;; produce the volume of a rectangular solid
(check-expect (volume (make-solid 2 3 4)) 24)
(check-expect (volume (make-solid 1.1 1.2 1.3)) (* 1.1 1.2 1.3))

(@template-origin Solid)
(define (volume s) (* (solid-w s) (solid-h s) (solid-d s)))







(@problem 3) ;this is actually problem 7(c) - DO NOT EDIT OR DELETE THIS LINE!

(@htdf set=?)
(@signature (listof Number) (listof Number) -> Boolean)
;; true if each number in lon1 is in lon2 and each number in lon2 is in lon1

(check-expect (set=? (list 1 2 3 4) (list 4 2 3 1)) true)
(check-expect (set=? (list 1 3 2 4) (list 4 3 1 2)) true)
(check-expect (set=? (list 1 2 3 4) (list 4 4 2 3 1)) true)
(check-expect (set=? (list 1 2 3 4) (list 4 2 3 6 1)) false)
(check-expect (set=? (list 1 2 3 4 6) (list 4 2 3 1)) false)  

(@template-origin use-abstract-fn fn-composition)

(define (set=? lst1 lst2)
  (local [(define (in-lst1? n) (ormap (λ (x) (= n x)) lst1))
          (define (in-lst2? n) (ormap (λ (x) (= n x)) lst2))]
    (and (andmap in-lst1? lst2)
         (andmap in-lst2? lst1))))






