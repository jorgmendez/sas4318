/*
Purpose: Lab 1 - Problem 2 (from labs/Lab 1.sas)
Name: Jorge Mendez
*/

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
