;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p6-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2022w1-mt2/mt2-p6)


(@problem 1) ;do not edit or delete this line
(@problem 2) ;do not edit or delete this line
(@problem 3) ;do not edit or delete this line
(@problem 4) ;do not edit or delete this line
(@problem 5) ;do not edit or delete this line
(@problem 6) ;do not edit or delete this line

(@htdd Message)
(define-struct packet (data key next))
;; Message is one of:
;; - empty
;; - false
;; - (make-packet String Natural Message)
;; interp. a Message is either empty meaning no data is being sent,
;;         false meaning the data is corrupted or
;;         a packet that contains data, key and rest of Message

(define M1 (make-packet "ALL NIGHT" 4 false))
(define M2 (make-packet "DANCE" 3 M1))
(define M3 (make-packet "SLEEP" 5 empty))


(@htdf decode)
(@signature Message (listof Natural) -> String)
;; produce decoded message
(check-expect (decode empty empty) "STOP")
(check-expect (decode false empty) "STOP")
(check-expect (decode M1    empty) "STOP")

(check-expect (decode empty (list 1)) "EOF")

(check-expect (decode false (list 1)) ":")
(check-expect (decode false (list 2)) "*")

(check-expect (decode M2 (list 3 4 5)) "DANCEALL NIGHT:")
(check-expect (decode M2 (list 4 4 5)) "____ALL NIGHT:")
(check-expect (decode M2 (list 3 3 5)) "DANCE___:")

#|
     lon                   empty      (cons Natural (listof Natural))
m
  empty                     "STOP" [1]  "EOF" [2]
  false                     "STOP" [1]  (if (odd? (first lon)) ":" "*") [3]
  (make-packet String       "STOP" [1]  (string-append                  [4]
               Natural                    (if (= (packet-key p) (first lon))
               Message)                       (packet-data p)
                                              (replicate "_" (first lon)))
                                          (decode (packet-next p) (rest lon)))
|#


(@template-origin 2-one-of)

(define (decode m lon)
  (cond [(empty? lon) "STOP"]                        ;[1]
        [(empty? m) "EOF"]                           ;[2]
        [(false? m) (if (odd? (first lon)) ":" "*")] ;[3]
        [else                                        ;[4]
         (if (= (first lon) (packet-key m))
             (string-append (packet-data m)
                            (decode (packet-next m) (rest lon)))
             (string-append (replicate (first lon) "_")
                            (decode (packet-next m) (rest lon))))]))

