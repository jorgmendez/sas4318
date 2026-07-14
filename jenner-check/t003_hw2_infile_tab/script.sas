/*----------------------------------------------------
  Problem 2a: Read tab-delimited data with INFILE (FIRSTOBS=2)
  and create bp1  (from homework/Homework 2.sas; the external
  bp.txt is inlined as tab-delimited DATALINES so the bundle is
  self-contained. The DLM='09'x DSD FIRSTOBS=2 TRUNCOVER options,
  LENGTH, list INPUT, and both PROCs are unchanged.)
----------------------------------------------------*/

DATA work.bp1;

    INFILE DATALINES
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

DATALINES;
ptid	clinic	age	sex	dbpbl	dbp6	dbp12	sbpbl	sbp6	sbp12
10001	A	54	M	95	88	84	150	142	138
10002	A	61	F	102	94	90	168	155	149
10003	B	47	M	88	82	80	138	132	130
10004	B	58	F	99	91	87	159	148	143
10005	C	66	M	105	97	93	172	160	152
10006	C	50	F	91	85	83	145	139	135
10007	A	72	M	110	101	96	180	168	159
10008	B	45	F	85	80	78	132	128	126
;
RUN;

PROC CONTENTS DATA=work.bp1 VARNUM;
RUN;

PROC PRINT DATA=work.bp1 (OBS=10);
RUN;
