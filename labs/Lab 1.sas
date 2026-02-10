/*
Purpose: Lab 1 
Name: Jorge Mendez
Date: 1/21/2026
*/

/* Problem 1 */


data stocks;
  input StockSymbol $
        Price
        Shares;

  Value = Price * Shares;

datalines;
AMGN 67.66 100
DELL 24.60 200
GE   34.50 100
HPQ  32.32 120
IBM  82.25 50
MOT  30.24 100
;
run;


title "Average Price and Average Number of Shares";

proc means data=stocks mean;
  var Price Shares;
run;


/* Problem 2 */

data prob2;
  input ID $
        Height
        Weight
        SBP
        DBP;

  WtKg = Weight / 2.2;
  HtCm = Height * 2.54;
  AveBP = DBP + (1/3) * (SBP - DBP);

  HtPolynomial = 2*(Height**2) + 1.5*(Height**3);

datalines;
001 68 150 110 70
002 73 240 150 90
003 62 101 120 80
;
run;

title "Listing of PROB2 (All New Variables)";
proc print data=prob2;
run;

/* 
Problem 3 

1.- The INPUT statement is missing a semicolon at the end of x1 x2;
2.- The multiplication is being done with parenthesis, in SAS it should be by using the * operator
*/