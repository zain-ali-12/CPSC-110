;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p2-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require 2htdp/image)
(require 2htdp/universe)
(require spd/tags)

(@assignment exams/2022w1-mt1/mt1-p2)



(@problem 1) ;do not edit or delete this line

(@problem 2) ;do not edit or delete this line


;; Vega Star spinning, growing, shrinking in Andromeda

(@htdw Vega)

;; =================
;; Constants:
(define WIDTH 400)
(define CTR (/ WIDTH 2))
(define MTS (empty-scene WIDTH WIDTH "Black"))

(define MIN-SIZE 10)
(define MAX-SIZE 200)

(define SPIN-SPEED 3) ; degrees per tick

(define MODE "solid")
(define COLOR "Sky Blue")

;; =================
;; Data definitions:

(@htdd Vega)

(define-struct vega (l dl r))
;; Vega is (make-vega Natural Integer Natural)
;; interp. the side-length of the vega star
;;         the size velocity in pixels/tick
;;         the rotation angle in degrees
;; CONSTRAINT: the side-length is in [MIN-SIZE, MAX-SIZE]


(define V1 (make-vega MIN-SIZE 1  20))
(define V2 (make-vega MAX-SIZE -2 90))

(@dd-template-rules compound) ;3 fields

(define (fn-for-vega v)
  (... (vega-l  v)
       (vega-dl v)
       (vega-r  v)))

;; =================
;; Functions:

(@htdf main)
(@signature Vega -> Vega)
;; start the world with (main V1)
;; no tests for htdw-main template

(@template-origin htdw-main)

;; no @template for htdw-main template

(define (main s)
  (big-bang s                    ;Vega
    (on-tick tock)               ;Vega -> Vega
    (to-draw render)             ;Vega -> Image
    (on-key  change-velocity)))  ;Vega KeyEvent -> Vega


(@htdf tock)
(@signature Vega -> Vega)
;; change r by SPIN-SPEED and l by dl, if l hits MAX/MIN change direction of dl

;; no "bounce"
(check-expect (tock (make-vega MIN-SIZE 1 20))
              (make-vega (+ MIN-SIZE 1) 1 (+ SPIN-SPEED 20)))
(check-expect (tock (make-vega MIN-SIZE 3 30))
              (make-vega (+ MIN-SIZE 3) 3 (+ SPIN-SPEED 30)))

(check-expect (tock (make-vega MAX-SIZE -1 20))
              (make-vega (+ MAX-SIZE -1) -1 (+ SPIN-SPEED 20)))
(check-expect (tock (make-vega MAX-SIZE -4 40))
              (make-vega (+ MAX-SIZE -4) -4 (+ SPIN-SPEED 40)))

;; Hits MIN-SIZE
(check-expect (tock (make-vega (+ MIN-SIZE 1) -1 20))
              (make-vega MIN-SIZE 1 (+ SPIN-SPEED 20)))
(check-expect (tock (make-vega (+ MIN-SIZE 3) -4 30))
              (make-vega MIN-SIZE 4 (+ SPIN-SPEED 30)))

;; Hits MAX-SIZE
(check-expect (tock (make-vega (- MAX-SIZE 1) 1 20))
              (make-vega MAX-SIZE -1 (+ SPIN-SPEED 20)))
(check-expect (tock (make-vega (- MAX-SIZE 4) 5 50))
              (make-vega MAX-SIZE -5 (+ SPIN-SPEED 50)))


;(define (tock v) v)

(@template-origin Vega)

(@template
 (define (tock v)
   (... (vega-l  v)
        (vega-dl v)
        (vega-r  v))))
 
(define (tock v)
  (cond [(>= (+ (vega-l v) (vega-dl v)) MAX-SIZE)
         (make-vega MAX-SIZE
                    (- (vega-dl v))
                    (+ (vega-r  v) SPIN-SPEED))]
        [(<= (+ (vega-l v) (vega-dl v)) MIN-SIZE)
         (make-vega MIN-SIZE  
                    (- (vega-dl v))
                    (+ (vega-r  v) SPIN-SPEED))]
        [else
         (make-vega (+ (vega-l  v) (vega-dl v))
                    (vega-dl v)
                    (+ (vega-r  v) SPIN-SPEED))]))



(@htdf render)
(@signature Vega -> Image)
;; render vega star with given length, rotated by r at the screen's center 

(check-expect (render (make-vega 40 3 30))
              (place-image (rotate 30 (star 40 MODE COLOR))
                           CTR
                           CTR
                           MTS))

(check-expect (render (make-vega MAX-SIZE -2 80))
              (place-image (rotate 80 (star MAX-SIZE MODE COLOR))
                           CTR
                           CTR
                           MTS))


;(define (render v) MTS)

(@template-origin Vega)
(@template
 (define (render v)
   (... (vega-l  v)
        (vega-dl v)
        (vega-r v)))) 


(define (render v)   
  (place-image (rotate (vega-r v) (star (vega-l v) MODE COLOR))
               CTR
               CTR
               MTS))


(@htdf change-velocity)
(@signature Vega KeyEvent -> Vega)
;; up increases dl by 1, down decreases dl by 1, r sets dl to 0

(check-expect (change-velocity (make-vega 20 4 0) "up")
              (make-vega 20 5 0))
(check-expect (change-velocity (make-vega 120 -4 10) "up")
              (make-vega 120 -3 10))

(check-expect (change-velocity (make-vega 20 -3 90) "down")
              (make-vega 20 -4 90))
(check-expect (change-velocity (make-vega 50 2 80) "down")
              (make-vega 50 1 80))

(check-expect (change-velocity (make-vega 20 -3 180) "r")
              (make-vega 20 0 180))
(check-expect (change-velocity (make-vega MAX-SIZE 3 270) "r")
              (make-vega MAX-SIZE 0 270))

(check-expect (change-velocity (make-vega 50 2 100) "b")
              (make-vega 50 2 100))

;(define (change-velocity v ke) v)

(@template-origin KeyEvent Vega)

(@template
 (define (change-velocity v ke)
   (cond [(key=? ke "up")
          (... (vega-l  v) (vega-dl v) (vega-r  v))]
         [(key=? ke "down")
          (... (vega-l  v) (vega-dl v) (vega-r  v))]
         [(key=? ke "r")
          (... (vega-l  v) (vega-dl v) (vega-r  v))]
         [else
          (... (vega-l  v) (vega-dl v) (vega-r  v))])))


(define (change-velocity v ke)
  (cond [(key=? ke "up")
         (make-vega (vega-l v) (add1 (vega-dl v)) (vega-r v))]
        [(key=? ke "down")
         (make-vega (vega-l v) (sub1 (vega-dl v)) (vega-r v))]
        [(key=? ke "r")
         (make-vega (vega-l  v) 0 (vega-r  v))]
        [else v]))
