proc sort data=work.CSAP out=csapmerg;
	by District District_Number;
run;

proc sort data=work.GRAD out=gradmerg;
	by District District_Number;
run;

proc sql;
	create table colodata as
	select c.*, G.*
	FROM WORK.gradmerg G
	LEFT JOIN WORK.csapmerg C
	ON G.District_Number = C.District_Number;
run;
/* 	on G.District = C.District */

FILENAME REFFILE '/folders/myfolders/sasuser.v94/data/COLODATA.XLSX';

proc export 
  data=WORK.colodata
  dbms=xlsx 
  outfile=REFFILE
  replace;
run;

/*
data colodata;
	merge WORK.csapmerg WORK.gradmerg;
	by District District_Number;
run;

/*
sum(_08___%_Unsatisfactory),
sum(_08___%_Partially_Proficient),
sum(_08___%_Proficient),
sum(_08___%_Advanced),
sum(_08___%_Proficient_&_Advanced),
sum(_08___%_Not_Scored)
*/