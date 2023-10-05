;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname mt2-p5-starter) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require spd/tags)

(@assignment exams/2021w2-mt2/mt2-p5)

(@cwl ???) ;fill in your CWL here (same as for problem sets)

(@problem 1) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 2) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 3) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 4) ;DO NOT EDIT OR DELETE THIS LINE!
(@problem 5) ;DO NOT EDIT OR DELETE THIS LINE!

#|
NOTE: This problem may sound very math-intensive.  But it isn't actually.
All you really need to know is simple math operations.  You also need to
be able to read a description carefully and design a function to do just
exactly what the description says.

Specifically this problem asks you to design a function to implement a
well known generative recursion function - the Euclidean algorithm for
computing the greatest common divisor (GCD) of two numbers.

One way of computing the greatest common divisor for two numbers is the 
Euclidean algorithm. A simple way of understanding the algorithm is that
the absolute difference between the two numbers replaces the larger
number, and this is done recursively until both numbers are equal.

For instance, 21 is the GCD of 252 and 105 (as 252 = 21 × 12 and
105 = 21 × 5). Let's look at the recursive structure for this example
in detail:

       a    b     to get next step
      252  105    a>b, 252-105 = 147
      147  105    a>b, 147-105 =  42
       42  105    b>a, 105-42  =  63
       42   63    b>a,  63-42  =  21
       42   21    a>b,  42-21  =  21
       21   21    a=b, result is 21


Complete the design of a function called euclid that consumes two natural
numbers > 0 and produces the greatest common divisor using Euclid's method 
as show above.  Additional useful examples are:

   (euclid 1 1)     should produce  1
   (euclid 1 3)     should produce  1
   (euclid 25 15)   should produce  5
   (euclid 252 105) should produce 21


NOTE: This problem will be substantially autograded, and ALL OF THE FOLLOWING
      ARE ESSENTIAL IN YOUR SOLUTION.  Failure to follow these requirements may
      result in receiving zero marks for this problem.

 - the function you design must be called euclid
 - you must include ALL relevant @ metadata tags
 - you must not comment out any @ metadata tags
 - your submission must pass the Check Syntax button
 - treat this as a genrec problem, and be sure to include a 
   3 part termination argument


|#
;(@htdf euclid) ;uncomment when you start on this problem
