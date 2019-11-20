%web_drop_table(WORK.GRAD);
%web_drop_table(WORK.CSAP);


FILENAME REFFILE '/folders/myfolders/sasuser.v94/data/GRAD New.csv';
PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.GRAD;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.GRAD; RUN;


FILENAME REFFILE '/folders/myfolders/sasuser.v94/data/CSAP New.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=WORK.CSAP;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=WORK.CSAP; RUN;