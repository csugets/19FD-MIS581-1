ods noproctitle;
ods graphics / imagemap=on;

proc genmod data=WORK.COLODATA plots=(predicted resraw(index) stdreschi(index) 
		);
	model Completers_Pct=Total_02_Unsat_Pct / dist=normal;
run;

proc genmod data=WORK.COLODATA plots=(predicted resraw(index) stdreschi(index) 
		);
	model Completers_Pct=Total_05_Advanced / dist=normal;
run;