;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname mt1-p5-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
(require 2htdp/universe)
(require spd/tags)

(@assignment exams/2021s1-mt1/mt1-p5)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 4) ;DO NOT EDIT OR DELETE THIS LINE!

(@problem 5)



;; Spinning Star

(@htdw WorldStar)

;; =================
;; Constants:

(define WIDTH  200)
(define HEIGHT 200)

(define CTR-X (/ WIDTH 2))
(define CTR-Y (/ HEIGHT 2))

(define LEN 20)        ;star side-length
(define MODE "solid")  ;the mode for the star
(define SPEED 5)       ;spin speed in degrees per tick

(define MTS (empty-scene WIDTH HEIGHT "black"))

;; =================
;; Data definitions:


(@htdd UniColor)
;; UniColor is one of:
;; - "white"
;; - "orange"
;; - "blue"
;; - "red"
;; interp. the color of an image 

(@dd-template-rules  one-of
                     atomic-distinct
                     atomic-distinct
                     atomic-distinct
                     atomic-distinct)

(define (fn-for-uni-color uc)
  (cond [(string=? uc "white")  (...)]
        [(string=? uc "orange") (...)]
        [(string=? uc "blue")   (...)]
        [(string=? uc "red")    (...)]))
        

(@htdd WorldStar)
(define-struct wstar (rot col))
;; Star is (make-wstar Integer UniColor)
;; interp. the state of a star, where
;;         rot is the angle of rotation in degrees
;;         col is the color of the star
(define WS1 (make-wstar   0 "white"))
(define WS2 (make-wstar  90 "orange"))

;; TASK 1: Complete the Data Definition for WorldStar

(@dd-template-rules compound ;(make-ws Integer UniColor)
                    ref)     ;(wstar-col ws) is UniColor

(define (fn-for-wstar ws)
  (... (wstar-rot ws)
       (fn-for-uni-color (wstar-col ws))))


       

;; =================
;; Functions:

(@htdf main)
(@signature WorldStar -> WorldStar)
;; start the world with (main WS1)

(@template-origin htdw-main)

(define (main ws)
  (big-bang ws               ; WorldStar
    (on-tick  spin)          ; WorldStar -> WorldStar
    (to-draw  render)        ; WorldStar -> Image
    (on-key   handle-key)))  ; WorldStar KeyEvent -> WorldStar


;; TASK 2. Work through the wish list until done


(@htdf spin)
(@signature WorldStar -> WorldStar)
;; update ws by increasing rotation by SPEED degrees
(check-expect (spin (make-wstar   0 "white"))  (make-wstar SPEED  "white"))
(check-expect (spin (make-wstar  90 "orange")) (make-wstar (+ 90 SPEED) "orange"))

;(define (spin ws) ws) ; stub

(@template-origin WorldStar)

(@template
 (define (spin ws)
   (... (wstar-rot ws)
        (fn-for-uni-color (wstar-col ws)))))

(define (spin ws)
  (make-wstar (+ (wstar-rot ws) SPEED)
              (wstar-col ws)))



(@htdf render)
(@signature WorldStar -> Image)
;; place appropriate rotated and colored star at the center of MTS
(check-expect (render (make-wstar 0 "white"))
              (place-image (rotate 0 (star LEN MODE "white"))
                           CTR-X CTR-Y
                           MTS))

(check-expect (render (make-wstar 90 "orange"))
              (place-image (rotate 90 (star LEN MODE "orange"))
                           CTR-X CTR-Y
                           MTS))

;(define (render ws) MTS) ;stub

(@template-origin WorldStar)

(@template
 (define (render ws)
   (... (wstar-rot ws)
        (fn-for-uni-color (wstar-col ws)))))

(define (render ws)
  (place-image (rotate (wstar-rot ws) (star LEN MODE (wstar-col ws)))
               CTR-X CTR-Y
               MTS))


(@htdf handle-key)
(@signature WorldStar KeyEvent -> WorldStar)
;; on key "c" update ws by changing (wstar-col ws) to next color in enumeration

(check-expect (handle-key (make-wstar   0 "white") "c")
              (make-wstar 0 "orange"))
(check-expect (handle-key (make-wstar  90 "orange") "c")
              (make-wstar 90 "blue"))
(check-expect (handle-key (make-wstar 180 "blue") "c")
              (make-wstar 180 "red"))
(check-expect (handle-key (make-wstar  20 "red") "c")
              (make-wstar 20 "white"))
(check-expect (handle-key (make-wstar   0 "white") " ")
              (make-wstar 0 "white"))


;(define (handle-key ws ke) ws) ; stub

(@template-origin KeyEvent)

(@template   
 (define (handle-key ws ke)
   (cond [(key=? ke " ") (... ws)]
         [else 
          (... ws)])))

(define (handle-key ws ke)
  (cond [(key=? ke "c") (make-wstar (wstar-rot ws)
                                    (change-color (wstar-col ws)))]
        [else ws]))


(@htdf change-color)
(@signature UniColor -> UniColor)
;; change the color to the next color in the unicolor enumeration

(check-expect (change-color "white") "orange")
(check-expect (change-color "orange") "blue")
(check-expect (change-color "blue") "red")
(check-expect (change-color "red") "white")

;(define (change-color uc) uc) ; stub

(@template-origin UniColor)

(@template
 (define (change-color uc)
   (cond [(string=? uc "white")  (...)]
         [(string=? uc "orange") (...)]
         [(string=? uc "blue")   (...)]
         [(string=? uc "red")    (...)])))

(define (change-color uc)
  (cond [(string=? uc "white")  "orange"]
        [(string=? uc "orange") "blue"]
        [(string=? uc "blue")   "red"]
        [(string=? uc "red")    "white"]))
