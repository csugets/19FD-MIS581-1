ods noproctitle;
ods graphics / imagemap=on;

proc glmselect data=WORK.COLODATA outdesign(addinputvars)=Work.reg_design 
		plots=(criterionpanel);
	model Completers_Pct=Math_02_Unsat_Pct Math_03_Partially_Proficient_Pct 
		Math_04_Proficient_Pct Math_05_Advanced_Pct Reading_02_Unsat_Pct 
		Reading_03_Partially_Proficient_ Reading_04_Proficient_Pct 
		Reading_05_Advanced_Pct Writing_02_Unsat_Pct Writing_03_Partially_Proficient_ 
		Writing_04_Proficient_Pct Writing_05_Advanced_Pct / showpvalues 
		selection=backward
    
   (select=sbc);
run;

proc reg data=Work.reg_design alpha=0.05 plots(only)=(diagnostics residuals 
		observedbypredicted);
	ods select DiagnosticsPanel ResidualPlot ObservedByPredicted;
	model Completers_Pct=&_GLSMOD /;
	run;
quit;

proc delete data=Work.reg_design;
run;
