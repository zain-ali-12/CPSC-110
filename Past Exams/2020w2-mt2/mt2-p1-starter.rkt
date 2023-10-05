;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p1-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #t)))
(require spd/tags)

(@assignment exams/2020w2-mt2/mt2-p1)

(@cwl ???)   ;fill in your CWL here (same CWL you put for 110 problem sets)


(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!

#| 

THE INSTRUCTIONS TO THIS PROBLEM ARE IN THREE PARTS:

 - WORK TO DO
 - ENTERING YOUR ANSWERS
 - ERRORS AND FAILING TESTS

**WORK TO DO**

This question is about reference arrows in type comments and their corresponding
call arrows in templates.  Download the mt2-p1-figure.pdf file.  That file shows
two figures, one of type comments with reference arrows; the other is templates
and call arrows.

The reference arrows in the type comments figure are labeled with the letters
A to F.  The arrows in the templates figure are labeled with the numbers 1 to 6.  
In this problem you have to do three things:

 - For each of the type comment reference arrows A to F you must determine
   whether it is a reference, self-reference or mutual reference.

 - For each of the call arrows 1 to 6 you must determine whether it is a
   natural helper, natural recursion, or natural mutual recursion.

 - For each of the call arrows 1 to 6 you must determine which of the
   type comment reference arrows A to F it corresponds to.


**ENTERING YOUR ANSWERS**
--------------------------------------------------------------------------------
You will enter all of your answers into three constant definitions below.  You
MUST FOLLOW THE DIRECTIONS BELOW AND ENTER YOUR RESULTS EXACTLY as specified.

               >>>>>> RUN YOUR FILE BEFORE SUBMITTING IT <<<<<<

We have included special check-expects in this file that check whether your
answer is properly formed.  Do not edit or delete these check-expects, they
are there to help you.

Zero marks will be awarded if your file does not run, or if it fails any of
the special tests we have added.  Follow the instructions in this section, AND
read the next section on errors.  Run your file every time before you hand
it in.

In the type comment reference-arrows constant you must replace every "???"
string with one of the strings "R" (reference), "SR" (self-reference), or
"MR" (mutual reference). Those are the only edits you should make.

|#

(define reference-arrows
  (list (list "A" "???")
	(list "B" "???")
	(list "C" "???")
	(list "D" "???")
	(list "E" "???")
	(list "F" "???")))

#|


In the call-arrows constant you must replace every "???" string with one of the
strings "NH" (natural helper), "NR" (natural recursion), or "NMR" (natural
mutual recursion).  Those are the only edits you should make.

|#
(define call-arrows
  (list (list 1 "???")
	(list 2 "???")
	(list 3 "???")
	(list 4 "???")
	(list 5 "???")
	(list 6 "???")))

#|


In the correspondences constant you must replace every "???" string with one of
the strings "A" to "F" indicating which reference arrow corresponds to the call
arrow with that line's number.  Those are the only edits you should make.

|#
(define correspondences
  (list (list 1 "???")
	(list 2 "???")
	(list 3 "???")
	(list 4 "???")
	(list 5 "???")
	(list 6 "???")))


#|


ERRORS AND FAILING TESTS

A file that cannot run without errors or failing tests  may earn as few as
zero marks.  At this point in the term there is no reason for you to hand
in a file that does not run.  Run your work often while filling in the
reference-arrows and call-arrows and you will have no problem being sure
your file runs. Also be sure to run EVERY TIME BEFORE YOU SUBMIT.

We have special checks (tests) at the end of the file.  Any tests that fail
indicate that you have not understood or followed the instructions on how to
form your answer.  Files that have failing checks may earn as few as zero marks.
IF YOU GET A FAILING CHECK, take the time to CAREFULLY READ THE MESSAGE.  We
have designed these tests so that the name of the failing tests indicates what 
is incorrect.

If you get more than one error or failing test we recommend fixing the first
one and then re-running before trying to fix the later ones.

|#

;;============================================================================
;;============================================================================
;;============================================================================
;; You should ignore this code.  Do not read or edit below here.
;;
;; This code is here so that running the file will verify that your answer is
;; well-formed.

(define REF-LABELS  (list "R"  "SR" "MR" ))
(define CALL-LABELS (list "NH" "NR" "NMR"))

(define (list-has-length-6 l)
  (= (length l) 6))

(define (all-sublists-have-length-2 l)
  (andmap (λ (m) (= m 2)) (map length l)))

(define (all-sublist-first-elements-are-A-to-F l)
  (equal? (map first l) '("A" "B" "C" "D" "E" "F")))

(define (all-sublist-first-elements-are-1-to-6 l)
  (equal? (map first l) (build-list 6 add1)))

(define (all-sublist-second-elements-are-R-SR-MR l)
  (andmap (lambda (sl) (member? (second sl) REF-LABELS)) l))

(define (all-sublist-second-elements-are-NH-NR-NMR l)
  (andmap (lambda (sl) (member? (second sl) CALL-LABELS)) l))

(define (all-sublist-second-elements-are-A-to-F l)
  (andmap (lambda (sl)
            (member? (second sl) '("A" "B" "C" "D" "E" "F")))
          l))

(check-satisfied reference-arrows list-has-length-6)
(check-satisfied reference-arrows all-sublists-have-length-2)
(check-satisfied reference-arrows all-sublist-first-elements-are-A-to-F)
(check-satisfied reference-arrows all-sublist-second-elements-are-R-SR-MR)

(check-satisfied call-arrows      list-has-length-6)
(check-satisfied call-arrows      all-sublists-have-length-2)
(check-satisfied call-arrows      all-sublist-first-elements-are-1-to-6)
(check-satisfied call-arrows      all-sublist-second-elements-are-NH-NR-NMR)

(check-satisfied correspondences  list-has-length-6)
(check-satisfied correspondences  all-sublists-have-length-2)
(check-satisfied correspondences  all-sublist-first-elements-are-1-to-6)
(check-satisfied correspondences  all-sublist-second-elements-are-A-to-F)



