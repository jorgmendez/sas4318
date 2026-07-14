/*----------------------------------------------------
  Problem 3: fixed-column INPUT + PROC PRINT / PROC MEANS / PROC FREQ
  (from homework/Homework 2.sas; the external tomhs.dat is inlined as
   fixed-width DATALINES so the bundle is self-contained. The @-column
   INPUT pointers, LRECL/TRUNCOVER, and all three PROCs are unchanged.)
----------------------------------------------------*/

DATA work.tomhs_subset;

    INFILE DATALINES TRUNCOVER;

    LENGTH ptid $6 clinic $1;

    INPUT
        @1  ptid   $CHAR6.
        @12 clinic $CHAR1.
        @25 group  1.
        @27 age    2.
        @30 sex    1.
    ;

DATALINES;
100001     A            1 54 1
100002     A            2 61 2
100003     B            1 47 1
100004     B            3 58 2
100005     C            2 66 1
100006     C            1 50 2
100007     A            3 72 1
100008     B            2 45 2
100009     C            1 69 1
100010     A            2 38 2
;
RUN;

/* Problem 3b */
PROC PRINT DATA=work.tomhs_subset (OBS=10);
RUN;

/* Problem 3c */
PROC MEANS DATA=work.tomhs_subset MEAN;
    VAR age;
RUN;

/* Problem 3d */
PROC FREQ DATA=work.tomhs_subset;
    TABLES sex;
RUN;
