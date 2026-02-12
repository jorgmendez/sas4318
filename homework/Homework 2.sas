
/*----------------------------------------------------
  
  Problem 1a: Import studentswithvarnames.xlsx and verify data
----------------------------------------------------*/

PROC IMPORT DATAFILE="/home/u64433614/Data/studentswithvarnames.xlsx"
    OUT=work.class
    DBMS=xlsx REPLACE;
    GETNAMES=YES;
RUN;

PROC CONTENTS DATA=work.class VARNUM;
RUN;

PROC PRINT DATA=work.class;
RUN;

/*----------------------------------------------------
  
  Problem 2a: Read bp.txt with INFILE (FIRSTOBS=2) and create bp1
----------------------------------------------------*/

DATA work.bp1;

    INFILE "/home/u64433614/Data/bp.txt"
        DLM='09'x
        DSD
        FIRSTOBS=2
        TRUNCOVER;

    LENGTH ptid $20 clinic $20 sex $1;

    INPUT
        ptid   $
        clinic $
        age
        sex    $
        dbpbl
        dbp6
        dbp12
        sbpbl
        sbp6
        sbp12
    ;

RUN;

PROC CONTENTS DATA=work.bp1 VARNUM;
RUN;

PROC PRINT DATA=work.bp1 (OBS=10);
RUN;

/*----------------------------------------------------
  
  Problem 2b: Import bp.txt using PROC IMPORT
----------------------------------------------------*/

PROC IMPORT DATAFILE="/home/u64433614/Data/bp.txt"
    OUT=work.bp2
    DBMS=tab REPLACE;
    GETNAMES=YES;
RUN;

PROC CONTENTS DATA=work.bp2 VARNUM;
RUN;

PROC PRINT DATA=work.bp2 (OBS=10);
RUN;

/*----------------------------------------------------
  Problem 3a:
----------------------------------------------------*/


DATA work.tomhs_subset;

    INFILE "/home/u64433614/Data/tomhs.dat" LRECL=200 TRUNCOVER;

    LENGTH ptid $6 clinic $1;

    INPUT
        @1  ptid   $CHAR6.
        @12 clinic $CHAR1.
        @25 group  1.
        @27 age    2.
        @30 sex    1.
    ;

RUN;

/*----------------------------------------------------
  Problem 3b
----------------------------------------------------*/

PROC PRINT DATA=work.tomhs_subset (OBS=10);
RUN;

/*----------------------------------------------------
  Problem 3c
----------------------------------------------------*/

PROC MEANS DATA=work.tomhs_subset MEAN;
    VAR age;
RUN;

/*----------------------------------------------------
  Problem 3d
----------------------------------------------------*/

PROC FREQ DATA=work.tomhs_subset;
    TABLES sex;
RUN;