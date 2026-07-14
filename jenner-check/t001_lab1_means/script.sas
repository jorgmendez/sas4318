/*
Purpose: Lab 1 - Problem 1 (from labs/Lab 1.sas)
Name: Jorge Mendez
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
