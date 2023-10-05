;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname 2019W2-F-P5-solution) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2019w2-f/f-p5)

(@cwl ???)

(@problem 1) ;ignore, but DO NOT DELETE this line
(@problem 2) ;ignore, but DO NOT DELETE this line
(@problem 3) ;ignore, but DO NOT DELETE this line
(@problem 4) ;ignore, but DO NOT DELETE this line
(@problem 5)

;;
;; This is a generative graph problem. In this graph there are nodes,
;; represented by just a string, which is the node name.  Nodes have
;; GENERATED links to 0 or more other nodes.  The function that generates
;; the list of next nodes is called next-nodes, and WE ARE GIVING YOU
;; THAT FUNCTION.  So, for example, in the graph shown in the attachment.
;;
;;   (next-nodes "A")  produces  (list "B" "C" "E")
;;   (next-nodes "B")  produces  (list "A" "C" "D")
;;
;; You should only call next-nodes with the name of a node in the graph
;; shown in the attachment, or with a node-name that next-nodes itself
;; has produced.  But do not design your functions to only work with
;; this graph, we may test it with other graphs. 
;; 

(@htdd Node)
;; Node is String
;; interp. a node with a name,
;;         also next-nodes produces the nodes this node has arrows to
(define NA "A")

(@htdd Count)
(define-struct count (node in))
;; Count is (make-count Node Natural)
;; interp. a node and the number of arrows that point to it in a graph
(define CA (make-count "X" 99))  ;99 arrows point to X (in some graph somewhere)

(@htdf arrows)
(@signature Node -> (listof Count))
;; Produce counts of arrows going into each node.
(check-expect (arrows "A") (list (make-count "E" 3)
                                 (make-count "C" 2)
                                 (make-count "B" 2)
                                 (make-count "D" 2)
                                 (make-count "A" 1)))
(check-expect (arrows "B")  (list (make-count "D" 2)
                                  (make-count "C" 2)
                                  (make-count "A" 1)
                                  (make-count "E" 3)
                                  (make-count "B" 2)))
(check-expect (arrows "C") (list (make-count "E" 3)
                                 (make-count "D" 2)
                                 (make-count "B" 2)
                                 (make-count "C" 2)
                                 (make-count "A" 1)))
(check-expect (arrows "D") (list (make-count "E" 1)))
(check-expect (arrows "E") '())

;; BELOW HERE IS SOLUTION
(@template-origin 
           genrec arb-tree  ;graph
           accumulator)
(define (arrows n0)
  ;; Termination:
  ;;   base: todo is empty
  ;;   reduction: if n not visited add its nexts to todo and add n to visited
  ;;   argument:  todo grows only by nexts of n if not visited, graph is finite
  ;;              so all nodes will eventually be visited
 
  ;; visited is (listof String): all nodes already visited
  ;; todo is (listof String): work list
  ;; rsf is (listof (list String Natural)) : result so far
  (local [(define (fn-for-n n todo visited rsf)
            (cond [(member? n visited)
                   (fn-for-lon todo visited rsf)]
                  [else
                   (fn-for-lon (append (next-nodes n) todo)
                               (cons n visited)
                               (foldr add-arrow rsf (next-nodes n)))])) 
          (define (fn-for-lon todo visited rsf)
            (cond [(empty? todo) rsf]
                  [else
                   (fn-for-n (first todo) (rest todo) visited rsf)]))

          (define (add-arrow n loc)
            (cond [(empty? loc) (list (make-count n 1))]
                  [else
                   (if (string=? (count-node (first loc)) n)
                       (cons (make-count n (add1 (count-in (first loc))))
                             (rest loc))
                       (cons (first loc)
                             (add-arrow n (rest loc))))]))]
    
    (fn-for-n n0 empty empty empty)))



;;
;; DO NOT READ PAST HERE.  THIS IS THE IMPLEMENTATION OF NEXT-NODES WE ARE
;; GIVING YOU.  THERE'S NOTHING ABOUT THIS THAT WILL HELP SOLVE THE PROBLEM
;; YOU ARE ASKED TO SOLVE.
;;
(define GRAPH
  '(("A" ("B" "C" "E"))
    ("B" ("A" "C" "D"))
    ("C" ("B" "D" "E"))
    ("D" ("E"))
    ("E" ())))

(define (next-nodes n)
  (cond [(not (string? n))
         (error 'next-nodes (format "Node name should be a string, not ~s." n))]
        [(false? (assoc n GRAPH))
         (error 'next-nodes (format "No node named ~s in graph." n))]
        [else
         (cadr (assoc n GRAPH))]))
          
