/* Example Code 1 A Simple SAS Program

title1 'June Billing'; /* #1 */
data work.junefee; /* #2 */
 set cert.admitjune;
 where age>39;
run; /* #3 */
proc print data=work.junefee; /* #4 */
run;

/* Example Code 2 Processing SAS Programs */
data work.admit2; /* #1 */
 set cert.admit;
 where age>39;
proc print data=work.admit2; /* #2 */
run; /* #3 */

data work.admit2;
 set cert.admit;
 where age>39;
run;

data work.admit2;
 set cert.admit;
 where age>39;
run;
proc print data=work.admit2;
run;



proc freq data=sashelp.cars;
 table origin*DriveTrain;
run;

libname cert 'C:\Users\Student1\Cert';

proc print data=cert.admit; 
run;

proc contents data=cert._all_ nods;
run;

proc contents data=cert.amounts;
run;

/* Example: Importing an Excel File with an XLSX Extension */
options validvarname=v7; /* #1 */
proc import datafile='C:\Users\Student1\cert\boots.xlsx' /* #2 */
 dbms=xlsx
 out=work.bootsales
 replace;
 sheet=boot; /* #3 */
 getnames=yes; /* #4 */
run;
proc contents data=bootsales; /* #5 */
run;
proc print data=bootsales;
run;

/* Example: Importing a Delimited File with a TXT Extension */
options validvarname=v7;
proc import datafile='C:\Users\Student1\cert\delimiter.txt' /* #1 */
 dbms=dlm /* #2 */
 out=mydata
 replace;
 delimiter='&'; /* #3 */  
 getnames=yes; /* #4 */
run;
proc print data=mydata;
run

/* Example: Importing a Space-Delimited File with a TXT Extension */
options validvarname=v7;
filename stdata 'C:\Users\Student1\cert\state_data.txt' lrecl=100; /* #1 */
proc import datafile=stdata /* #2 */
 dbms=dlm
 out=states
 replace;
 delimiter=' '; /* #3 */
 getnames=yes;
run;
proc print data=states;
run;

/* Example: Importing a Comma-Delimited File with a CSV Extension */
options validvarname=v7;
proc import datafile='C:\Users\Student1\cert\boot.csv' /* #1 */
 dbms=csv
 out=shoes
 replace;
 getnames=no; /* #2 */
run;
proc print data=work.shoes;
run;

/* Example: Importing a Tab-Delimited File */
proc import datafile='C:\Users\Student1\cert\class.txt' /* #1 */
 dbms=tab
 out=class
 replace;
 delimiter='09'x; /* #2 */
run;
proc print data=class;
run;

 
options obs=5;
proc import datafile="C:\Users\Student1\cert\boot.csv"
 dbms=csv
 out=shoes
 replace;
 getnames=no;
run;

/* Printing the Data Set */
proc print data=work.shoes;
run;

/* Reading the Entire External File */
options obs=max;
proc import datafile="C:\Users\Student1\cert\boot.csv"
 dbms=csv
 out=shoes
 replace;
 getnames=no; 
run;

/* Example: Using the SET Statement to Specify Imported Data */
proc import datafile="C:\certdata\boot.csv"
 out=shoes
 dbms=csv
 replace;
 getnames=no; 
run;
data boots;
 set shoes;
 where var1='South America' OR var1='Canada';
run;

/* Example: Reading a SAS Data Set */
libname cert 'C:\Users\Student1\cert\';
libname Men50 'C:\Users\Student1\cert\Men50';
data Men50.males;
 set cert.admit;
 where sex='M' and age>50; 
run;
proc print data=Men50.males;
 title 'Men Over 50';
run;

/* Specifying DROP= and KEEP= Data Set Options */
data cert.drug1h(drop=placebo);
 set cert.cltrials(drop=triglyc uric);
 if placebo='YES';
run;
proc print data=cert.drug1h;
run;

/* Basic Steps for Reading Excel Data into a SAS Data Set */
/* Reference an Excel workbook file */
libname cert xlsx 'C:\Users\Student1\cert\exercise.xlsx';
/* Write out the contents of the SAS Library */
proc contents data=cert._all_;
/* Read in an Excel worksheet (as the input data for the new SAS data set) */
set cert.ActLevel;
/* View the contents of a particular data set */
proc print data=stress;


libname certxl XLSX 'C:\Users\Student1\cert\exercise.xlsx';

/* SET Statement */
data work.stress;
 set certxl.ActivityLevels;
run;

data work.stress;
 set certxl.ActivityLevels;
 where ActLevel='HIGH';
run;


/* Name Literals */
libname certxl xlsx 'C:\Users\Student1\cert\stock.xlsx';
data work.bstock;
 set certxl.'boots stock'n;
run;

/* Printing an Excel Worksheet as a SAS Data Set */
libname certxl xlsx 'C:\Users\Student1\cert\stock.xlsx';
data work.bstock;
 set certxl.'boots stock'n;
run;
proc print data=work.bstock;
run;

libname certxl xlsx 'C:\Users\Student1\cert\stock.xlsx';
proc print data=cerxl.'boots stock'n;
run;

/* 上面两种写法的output是一样的 */

/* Creating Excel Worksheets */
libname excelout xlsx 'C:\Users\Student1\Cert\newExcel.xlsx';
data excelout.HighStress;
 set cert.stress;
run;


/* Writing Observations Explicitly */
data work.usa5; 
 set cert.usa(keep=manager wagerate);
 if _n_=5 then output;
run; 
proc print data=work.usa5; 
run;

/* sas文件的默认保存地址 */
%let path=/Users/Lvzi/Documents/My SAS Files/9.4/Certadv

data empty full; 
 set cert.usa; 
 output full; 
run;


/* The Basics of Error Correction */
data work.admitfee;
 set cert.admit;
run;
proc print data=work.admitfee;
 var id name actlevel fee;
run;

/* 用逗号替换MEAN函数中的加号 */
data work.grades; 
 set cert.class;
Homework=Homework*2;
 AverageScore = MEAN(Score1, Score2, Score3, Homework);
 if AverageScore < 70; 
run;
proc print data=work.grades;
run;

/* Example: Using the PUT Statement */
data work.test;
 set cert.loan01;
 if code='1' then type='variable'; /* #1 */
 else if code='2' then type='fixed';
 else type='unknown';
 if type='unknown' then put 'MY NOTE: invalid value: ' code=; /* #2 */
run;

/* Example: Character Strings */
data work.loan01;
 set cert.loan;
 if code='1' then type='variable';
 else if code='2' then type='fixed';
 else type='unknown';
 put 'MY NOTE: The condition was met.';
run;

/* Example: Data Set Variables */
data work.loan01;
 set cert.loan;
 if code='1' then type='variable';
 else if code='2' then type='fixed';
 else type='unknown';
 put 'MY NOTE: Invalid Value: ' code= type= ;
run;

/* Example: Conditional Processing */
data work.newcalc;
 set cert.loan;
 if rate>0 then Interest=amount*(rate/12);
 else put 'DATA ERROR: ' rate= _n_ = ;
run;

/* Missing RUN Statement */
data work.admitfee; /* #1 */
 set cert.admit;
proc print data=work.admitfee; /* #2 */
 var id name actlevel fee;
 /* #3 */


/* Missing Semicolon */
data work.admitfee;
 set cert.admit;
run;
proc print data=work.admitfee 
 var id name actlevel fee;
run;


/* Creating a Basic Report */
libname cert 'C:\Users\Student1\Cert'; 
proc print data=cert.therapy;
run;

/* The VAR Statement */
proc print data=cert.admit;
 var age height weight fee;
run;

/* Removing the OBS Column */
proc print data=work.example noobs;
 var age height weight fee; 
run;

/* Example: ID Statement */
proc print data=cert.reps;
 id idnum lastname;
run;

/* Example: ID and VAR Statement */
proc print data=cert.reps;
 id idnum lastname; /* #1 */
 var idnum sex jobcode salary; /* #2 */
run;

/* Example Code 1 Using the WHERE Statement in PROC PRINT */
proc print data=cert.admit;
 var age height weight fee; /* #1 */
 where age>30; /* #2 */
run;

/* Using the CONTAINS Operator */
where firstname CONTAINS 'Jon'; 
where firstname ? 'Jon';

/* Examples of WHERE Statements */
where age<=55 and pulse>75; 
where area='A' or region='S'; 
where ID>'1050' and state='NC';

where actlevel='LOW' or actlevel='MOD'; 
where fee=124.80 or fee=178.20;

where actlevel in ('LOW','MOD'); 
where fee in (124.80,178.20);

where (age<=55 and pulse>75) or area='A'; 
where age<=55 and (pulse>75 or area='A');

/* Examples: FIRSTOBS= and OBS= Options */
/* Example Code 2 Using the FIRSTOBS= Option */
options firstobs=10; /* #1 */
proc print data=cert.heart; /* #2 */
run;

/* Example Code 3 Using the FIRSTOBS= and OBS= Options */
options firstobs=1 obs=10; /* #1 */
proc print data=cert.heart; /* #2 */
run;

/* Example Code 4 Processing Middle Observations of a Data Set */
options firstobs=10 obs=15; /* #1 */
proc print data=cert.heart; /* #2 */
run;

/* Example: FIRSTOBS= and OBS= as Data Set Options */
options firstobs=10 obs=15; 
proc print data=clinic.heart; 
run;

/*  */
options firstobs=10 obs=15; 
proc print data=clinic.heart(firstobs=20 obs=30); 
run;

/* Example: PROC SORT */
proc sort data=cert.admit out=work.wgtadmit; /* #1 */
 by weight age;
run;
proc print data=work.wgtadmit; /* #2 */
 var weight age height fee; /* #3 */
 where age>30; /* #4 */
run;

proc sort data=cert.admit out=work.wgtadmit; 
 by descending weight age; 
run; 
proc print data=work.wgtadmit; 
 var weight age height fee; 
 where age>30; 
run;

/* The SUM Statement */
proc print data=cert.insure; 
 var name policy balancedue; 
 where pctinsured < 100; 
 sum balancedue;
run;

/* Example: SUM Statement */
proc sort data=cert.admit out=work.activity; /* #1 */
 by actlevel;
run;
proc print data=work.activity;
 var age height weight fee;
 where age>30;
 sum fee; /* #2 */
 by actlevel; /* #3 */
run;

/* Example: ID, BY, and SUM Statements */
proc sort data=cert.admit out=work.activity; /* #1 */
 by actlevel;
run;
proc print data=work.activity;
 var age height weight fee;
 where age>30;
 sum fee; /* #2 */
 by actlevel; /* #3 */
 id actlevel; /* #4 */
run;

/* Example: PAGEBY Statement */
proc sort data=cert.admit out=work.activity;
 by actlevel;
run;
proc print data=work.activity;
 var age height weight fee;
 where age>30;
 sum fee;
 by actlevel;
 id actlevel;
 pageby actlevel;
run;

/* Example: Creating Titles */
title1 'Heart Rates for Patients with:';
title3 'Increased Stress Tolerance Levels';
proc print data=cert.stress;
 var resthr maxhr rechr;
 where tolerance='I';
run;

/* Example: Creating Footnotes */
footnote1 'Data from Treadmill Tests';
footnote3 '1st Quarter Admissions';
proc print data=cert.stress;
 var resthr maxhr rechr;
 where tolerance='I';
run;

/* Modifying and Canceling Titles and Footnotes */
title1 'Heart Rates for Patients with';
title3 'Increased Stress Tolerance Levels';
footnote1 'Data from Treadmill Tests';
footnote3 '1st Quarter Admissions';
proc print data=cert.stress;
 var resthr maxhr rechr;
 where tolerance='I';
run;
proc means data=cert.stress;
 where tolerance='I';
 var resthr maxhr;
run;

/* 重定义title2 会取消title3 因为会抵消高位 */
title1 'Heart Rates for Patients with';
title3 'Participation in Exercise Therapy';
footnote1 'Data from Treadmill Tests';
footnote3 '1st Quarter Admissions';
proc print data=cert.therapy;
 var swim walkjogrun aerclass;
run;
title2 'Report for March';
proc print data=cert.therapy;
run

/* 比较这块代码和上面的输出 脚注的不同/*
title1; /* #1 */
footnote1 'Data from Treadmill Tests'; /* #2 */
footnote3 '1st Quarter Admissions'; 
proc print data=cert.stress;
 var resthr maxhr rechr;
 where tolerance='I';
run;
footnote; /* #3 */
proc means data=cert.stress;
where tolerance='I';
 var resthr maxhr;
run;

/* Example: Using the LABEL Option in the PROC PRINT Statement */
proc print data=cert.therapy label;
 label walkjogrun='Walk/Jog/Run';
run;

/* Example: Using Multiple LABEL Statements */
proc print data=cert.admit label; /* #1 */
 var age height;
 label age='Age of Patient'; /* #2 */
 label height='Height in Inches'; /* #3 */
run;

/* Example: Using a Single LABEL Statement to Assign Multiple 
Labels */
proc print data=cert.admit label; /* #1 */
 var actlevel height weight;
 label actlevel='Activity Level' /* #2 */
 height='Height in Inches'
 weight='Weight in Pounds';
run;

/* Using Permanently Assigned Labels */
data cert.paris;
 set cert.laguardia;
 where dest='PAR' and (boarded=155 or boarded=146);
 label date='Departure Date';
run;
proc print data=cert.paris label;
 var date dest boarded;
run;

/* Compilation Phase */
/* Data Set Variables */
data work.update;
 set cert.invent;
 Total=instock+backord;
 SalePrice=(CostPerUnit*0.65)+CostPerUnit;
 format CostPerUnit SalePrice dollar6.2;
run;

/* Descriptor Portion of the SAS Data Set */
proc contents data=work.update;
run;

/* Initializing Variables */
data work.update;
 set cert.invent;
 Total=instock+backord;
 SalePrice=(CostPerUnit*0.65)+CostPerUnit;
 format CostPerUnit SalePrice dollar6.2;
run;

proc freq data=cert.pats;
 tables Gender Age; 
run;

proc means data=cert.pats;
 var Age;
run;

/* Using an Assignment Statement to Clean Invalid Data */
data work.pats_clean;
 set cert.pats;
 gender=upcase(Gender);
 if Gender='G' then Gender='M';
run;
proc print data=work.pats_clean;
run;


data work.clean_data;
 set cert.pats;
 gender=upcase(Gender);
 if Gender='G' 
   then Gender='M';
 if id=1147 
   then age=65;
 else if id=5277 
   then age=75;
run;
proc print data=work.clean_data;
run;


data work.clean_data;
 set cert.pats;
 gender=upcase(Gender);
 if Gender='G' 
  then Gender='M';
 if Age>110 
  then delete;
run;
proc print data=work.clean_data;
run;

/* Testing Your Programs */
/* Limiting Observations */
data work.limitobs;
 set cert.invent (obs=10);
 total=instock+backord;
run;

/* Example: Viewing Execution in the SAS Log */
data work.update;
 set cert.invent;
 putlog 'PDV After SET Statement';
 putlog _all_;
 Total=instock+backord;
 SalePrice=(CostPerUnit*0.65)+CostPerUnit;
 format CostPerUnit SalePrice dollar 6.2;
run;

/* Example: Sorting Observations for BY-Group Processing 默认升序 ascending */
proc sort data=cert.usa out=work.usa;
 by manager;
run;
proc print data=work.usa;
run;

/* Example: Grouping Observations Using One BY Variable */
proc sort data=cert.usa out=work.temp; /* #1 */
 by dept;
 run;
data work.budget(keep=dept payroll); /* #2 */
 set work.temp;
 by dept; /* #3 */
 if wagecat='S' then Yearly=wagerate*12; /* #4 */
 else if wagecat='H' then Yearly=wagerate*2000;
 if first.dept then Payroll=0; /* #5 */
 payroll+yearly; /* #6 */
 if last.dept; /* #7 */
run;

proc print data=work.budget noobs; 
 sum payroll; 
 format payroll dollar12.2; 
run;

/* Example: Grouping Observations Using Multiple BY Variables */
proc sort data=cert.usa out=work.temp2; /* #1 */
 by manager jobtype;
run;
data work.budget2 (keep=manager jobtype payroll); /* #2 */
 set work.temp2;
 by manager jobtype; /* #3 */
 if wagecat='S' then Yearly=wagerate*12; /* #4 */
 else if wagecat='H' then Yearly=wagerate*2000;
 if first.jobtype then Payroll=0; /* #5 */
 payroll+yearly; /* #6 */
 if last.jobtype; /* #7 */
run;

proc print data=work.budget2 noobs;
 by manager;
 var jobtype;
 sum payroll;
 where manager in ('Coxe', 'Delgado');
 format payroll dollar12.2;
run;

/* Example 1: Create a New Variable */
data work.stresstest;
 set cert.tests;
 TotalTime=(timemin*60)+timesec;
run;
proc print data=work.stresstest;
run;

/* Example 2: Re-evaluating Variables */
data work.stresstest;
 set cert.tests;
 resthr=resthr+(resthr*.10);
run;
proc print data=work.stresstest;
run;

/* Example: Assignment Statements and Date Values */
data work.stresstest;
 set cert.tests;
 TotalTime=(timemin*60)+timesec;
 TestDate='01jan2015'd;
run;
proc print data=work.stresstest;
run;

/* Example: Accumulating Totals */
data work.stresstest; 
 set cert.tests; 
 TotalTime=(timemin*60)+timesec; 
 SumSec+totaltime;
run;

/* Example: RETAIN Statement */
data work.stresstest;
 set cert.tests;
 TotalTime=(timemin*60)+timesec;
 retain SumSec 5400;
 sumsec+totaltime;
run;
proc print data=work.stresstest;
run;

/* Specifying Lengths for Variables */
length Address1 Address2 Address3 $200;

/* Example: LENGTH Statement */
data stress; 
 set cert.stress; 
 TotalTime=(timemin*60)+timesec; 
 retain SumSec 5400; 
 sumsec+totaltime; 
 length TestLength $ 6;
 if totaltime>800 then testlength='Long'; 
 else if 750<=totaltime<=800 then testlength='Normal'; 
 else if totaltime<750 then TestLength='Short'; 
run;

/* Example: Subsetting IF Statement */
data work.stresstest;
 set cert.tests;
 if tolerance='D';
 TotalTime=(timemin*60)+timesec;
run;
proc print data=work.stresstest;
run;

/* Example: IF-THEN Statement */
data work.stresstest;
 set cert.tests;
 TotalTime=(timemin*60)+timesec; 
 retain SumSec 5400; 
 sumsec+totaltime; 
 if totaltime>800 then TestLength='Long';
run;

/* Examples: Logical Operators */
if status='OK' and type=3 
 then Count+1; 
if (age^=agecheck | time^=3) 
 & error=1 then Test=1;

if (age^=agecheck | time^=3) 
 & error=1 then Test=1; 
if status='S' or cond='E' 
 then Control='Stop';

if not(loghours<7500) 
 then Schedule='Quarterly'; 
if region not in ('NE','SE') 
 then Bonus=200;

if status='OK' and type=3 
 then Count+1; 
if status='S' or cond='E'
 then Control='Stop'; 
if not(loghours<7500) 
 then Schedule='Quarterly'; 
if region not in ('NE','SE') 
 then Bonus=200;

if x=1 or 2;
if x=1 or x=2;

/* Providing an Alternative Action */
if totaltime>800 then TestLength='Long';
if 750<=totaltime<=800 then TestLength='Normal';
if totaltime<750 then TestLength='Short';


if totaltime>800 then TestLength='Long';
else if 750<=totaltime<=800 then TestLength='Normal';
else if totaltime<750 then TestLength='Short';

/* 整个程序的代码块 */
data work.stresstest;
 set cert.tests;
 TotalTime=(timemin*60)+timesec;
 retain SumSec 5400;
 sumsec+totaltime;
 length TestLength $6;
 if totaltime>800 then TestLength='Long'; 
 else if 750<=totaltime<=800 then TestLength='Normal'; 
 else if totaltime<750 then TestLength='Short'; 
run;
proc print data=work.stresstest;
run;

/* 用put语句进行测试 */
if totaltime>800 then TestLength='Long'; 
 else if 750<=totaltime<=800 then TestLength='Normal'; 
 else put 'NOTE: Check this Length: ' totaltime=; 
run;

/* Example: IF-THEN and DELETE Statements */
data work.stresstest;
 set cert.tests;
 if resthr<70 then delete;
 TotalTime=(timemin*60)+timesec;
 retain SumSec 5400;
 sumsec+totaltime;
 length TestLength $6;
 if totaltime>800 then TestLength='Long'; 
 else if 750<=totaltime<=800 then TestLength='Normal'; 
 else if totaltime<750 then TestLength='Short'; 
run;
proc print data=work.stresstest;
run;

/* Example: DROP Data Set Option 只写入 TotalTime */
data work.stresstest (drop=timemin timesec);
 set cert.tests;
 if resthr<70 then delete;
 TotalTime=(timemin*60)+timesec;
 retain SumSec 5400;
 sumsec+totaltime;
 length TestLength $6;
 if totaltime>800 then TestLength='Long'; 
 else if 750<=totaltime<=800 then TestLength='Normal';
 else if totaltime<750 then TestLength='Short'; 
run;
proc print data=work.stresstest;
run;

/* Example: Using the DROP Statement */
data work.stresstest;
 set cert.tests;
 if tolerance='D';
 drop timemin timesec; /* 不输出timemin timesec */
 TotalTime=(timemin*60)+timesec;
 retain SumSec 5400;
 sumsec+totaltime;
 length TestLength $6;
 if totaltime>800 then TestLength='Long'; 
 else if 750<=totaltime<=800 then TestLength='Normal'; 
 else if totaltime<750 then TestLength='Short'; 
run;
proc print data=work.stresstest;
run;

/* Example: Performing a Simple Transposition */
proc transpose data=cert.class out=score_transposed; /* #1 */
run;
proc print data=score_transposed noobs; /* #2 */
 title 'Scores for the Year';
run;

/* 转置数据集 Transposing Specific Variables */
proc transpose data=cert.trials out=transtrials1; /* #1 */
 var Cholesterol Triglyc Uric; /* #2 */
run;
proc print data=transtrials1; /* #3 */
run;

/* Naming Transposed Variables */
proc transpose data=cert.trials out=transtrials2; /* #1 */
 var cholesterol triglyc uric; /* #2 */
 id name testdate; /* #3 */
run;
proc print data=transtrials2; /* #4 */
run;

/* Transposing BY Groups */
proc transpose data=cert.trials out=transtrials3; /* #1 */
 var cholesterol triglyc uric; /* #2 */
 id name; /* #3 */
 by testdate; /* #4 */
run;
proc print data=transtrials3; /* #5 */
run;

/* Example: Using SAS Macro Variables with Numeric Values 宏变量 */
%let Cyl_Count=5; /* #1 */
proc print data=sashelp.cars;
 where Cylinders=&Cyl_Count; /* #2 */
 var Type Make Model Cylinders MSRP;
run;
proc freq data=sashelp.cars;
 where Cylinders=&Cyl_Count;
 tables Type;
run;

/* Example: Using SAS Macro Variables with Character Values */
%let CarType=Wagon; /* #1 */
proc print data=sashelp.cars;
 where Type="&CarType"; /* #2 */
 var Type Make Model MSRP;
run;
proc means data=sashelp.cars;
 where Type="&CarType";
 var MSRP MPG_Highway;
run;
proc freq data=sashelp.cars;
 where Type="&CarType";
 tables Origin Make;
run;

/* Example: Using Macro Variables in TITLE Statements */
%let TitleX=PROC PRINT Of Only &Cyl_Count Cylinder Vehicles;
%let Cyl_Count=5;
Title "&TitleX";
proc print data=sashelp.cars;
 where Cylinders=&Cyl_Count;
 var Type Make Model Cylinders MSRP;
run;

%let TitleX=PROC MEANS Of Only &Cyl_Count Cylinder Vehicles;
%let Cyl_Count=12;
Title "&TitleX";
proc means data=sashelp.cars;
 where Cylinders=&Cyl_Count;
 var MSRP;
run;

/* Methods of Combining SAS Data Sets: The Basics */
/* One-to-One Reading Syntax */
data one2one; 
 set a; 
 set b; 
run;

/* Example: Using One-to-One Reading to Combine Data Sets */
data work.one2one; 
 set cert.patients; 
 if age<60; 
 set cert.measure; 
run;

/* How Concatenating Selects Data */
data concat; 
 set a c; 
run;

/* Example: Using Concatenating to Combine Data Sets */
data work.concat;
 set cert.therapy2012 cert.therapy2013;
run;
proc print data=work.concat;
run;

/* How Match-Merging Selects Data */
data merged; 
 merge a b; 
 by num; 
run;

/* Example: Using Match-Merging to Combine Data Sets */
proc sort data=cert.demog; 
 by id; 
run; 
proc print data=cert.demog; 
run;

proc sort data=cert.visit; 
 by id; 
run; 
proc print data=cert.visit; 
run;

data work.merged;
 merge cert.demog cert.visit;
 by id;
run;
proc print data=work.merged; 
run;

/* Example: Merge in Descending Order */
proc sort data=cert.demog; 
 by descending id; 
run; 
proc sort data=cert.visit; 
 by descending id; 
run; 
data work.merged; 
 merge cert.demog cert.visit; 
 by descending id; 
run; 
proc print data=work.merged; 
run;

/*  */
proc print data=work.claims noobs;
format date date9.;

/* The Basics of Renaming Variables */
data work.merged;
 merge cert.patdat cert.visit;
 by id;
run;
proc print data=work.merged; 
run;

/* Example: Renaming Variables */
data work.merged; 
 merge cert.patdat (rename=(date=BirthDate))
 cert.visit (rename=(date=VisitDate));
 by id; 
run; 
proc print data=work.merged; 
run;

/* Example: Renaming Variables */
data work.merged; 
 merge cert.patdat (rename=(date=BirthDate))
 cert.visit (rename=(date=VisitDate));
 by id; 
run; 
proc print data=work.merged; 
run;

/* Identifying Observation in Both Data Sets */
data work.merged; 
 merge cert.patdat(in=inpat) 
 cert.visit(in=invisit
 rename=(date=BirthDate));
 by id; 
run;

/* Selecting Matching Observations */
data work.merged; 
 merge cert.patdat(in=inpat 
 rename=(date=BirthDate)) 
 cert.visit(in=invisit
 rename=(date=VisitDate)); 
 by id; 
 if inpat=1 and invisit=1;
run; 
proc print data=work.merged; 
run;

if inpat=1 and invisit=1; 
if inpat and invisit;

/* Example: DO and END Statements */
data work.stresstest;
 set cert.tests;
 TotalTime=(timemin*60)+timesec;
 retain SumSec 5400;
 sumsec+totaltime;
 length TestLength $6 Message $20;
 if totaltime>800 then 

 do;
 TestLength='Long';
 message='Run blood panel';
 end;

 else if 750<=totaltime<=800 then TestLength='Normal';
 else if totaltime<750 then TestLength='Short';
run;
proc print data=work.stresstest;
run;

/* Example: Processing Iterative DO Loops */
data work.earn (drop=month); 
 set cert.master;
  Earned=0; 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
 earned+(amount+earned)*(rate/12); 
run;

data work.earnings (drop=month); 
 set cert.master; 
 Earned=0; 

 do month=1 to 12;
 earned+(amount+earned)*(rate/12);
 end;

 Balance=Amount+Earned; 
run; 
proc print data=work.earnings;
run;

/* DO Loop Execution */
data work.earnings; 
 Amount=1000; 
 Rate=0.75/12; 
 do month=1 to 12; 
 Earned+(amount+earned)*rate; 
 end; 
run;

/* Using Explicit OUTPUT Statements */
data work.earn; 
 Value=2000; 
 do Year=1 to 20; 
 Interest=value*.075; 
 value+interest; 
 output;
 end; 
run;
proc print data=work.earn;
run;

/* Decrementing DO Loops 递减循环*/
DO index-variable=5 to 1 by -1;
 ...more SAS statements...
END;

DO index-variable=2,5,9,13,27; 
 ...more SAS statements...
END;

DO index-variable='MON','TUE','WED','THR','FRI';
 ...more SAS statements...
END;

DO index-variable=win,place,show; 
 ...more SAS statements...
END;

/* Nesting DO Loops 嵌套循环 */
do;
  ...more SAS statements...;
    do;
      ...more SAS statements...;
      do;
        ...more SAS statements...;
      end;
    end;
end;

/* Examples: Nesting DO Loops */
do i=1 to 20; 
 ...more SAS statements...
  do j=1 to 10;
  ...more SAS statements...
  end;
 ...more SAS statements...
end;

data work.earn; 
 Capital=2000; 
   do month=1 to 12;
     Interest=capital*(.075/12);
     capital+interest;
   end; 
run;

data work.earn;
  do year=1 to 20; 
   Capital+2000; 
      do month=1 to 12; 
        Interest=capital*(.075/12); 
        capital+interest; 
      end; 
 end; 
run;


data work.earn; 
 do year=1 to 20; 
 Capital+2000; 
 do month=1 to 12; 
 Interest=capital*(.075/12); 
 capital+interest; 
 end;
 end; 
run;

data work.earn; 
 do year=1 to 20;
 Capital+2000; 
 do month=1 to 12;
 Interest=capital*(.075/12); 
 capital+interest; 
 end; 
 end; 
run;

data work.earn; 
 do year=1 to 20;
 Capital+2000; 
 do month=1 to 12; 
 Interest=capital*(.075/12); 
 capital+interest; 
 end;
 end;
run;

/* 迭代处理数据集 Iteratively Processing Observations from a Data Set */
data work.compare(drop=i); 
 set work.cdrates; 
 Investment=5000; 
 do i=1 to years; 
 investment+rate*investment; 
 end; 
run;
proc print data=work.compare;
run;

/* Conditionally Executing DO Loops */
data work.invest; 
 do year=1 to ? ; 
 Capital+2000; 
 capital+capital*.10; 
 end; 
run;

/* Using the DO UNTIL Statement */
data work.invest; 
 do until(Capital>=50000); 
 capital+2000; 
 capital+capital*.10; 
 Year+1; 
 end; 
run;

/* Using the DO WHILE Statement */
data work.invest; 
 do while(Capital>=50000); 
 capital+2000; 
 capital+capital*.10; 
 Year+1; 
 end; 
run;

data work.invest; 
 do year=1 to 10 until (Capital>=50000);
 capital+2000; 
 capital+capital*.10; 
 end; 
run;

data work.invest; 
 do year=1 to 10 until (Capital>=50000);
 capital+4000;
 capital+capital*.10; 
 end; 
run;

/* 迭代DO语句函数中的UNTIL和WHILE表达式 */
DO index-variable=start TO stop BY increment UNTIL(expression);
DO index-variable=start TO stop BY increment WHILE(expression);

/* Applying SAS Formats and Informats */
proc print data=cert.admit;
 var actlevel fee;
 where actlevel='HIGH';
 format fee dollar4.;
run;

/* Permanently Storing Your Formats */
libname formtlib 'c:\sas\formats\lib';
PROC FORMAT LIBRARY=formtlib;

libname formtlib 'C:\Users\Student1\formats\lib'; 
proc format library=formtlib; 
 ...more SAS statements... 
run;

proc format lib=formtlib；

/* The VALUE Statement */
proc format;
 value gender 
 1 = 'Male'
 2 = 'Female';
 value agegroup 
 13 -< 20 = 'Teen'
 20 -< 65 = 'Adult'
 65 - HIGH = 'Senior';
 value $col 
 'W' = 'Moon White'
 'B' = 'Sky Blue'
 'Y' = 'Sunburst Yellow'
 'G' = 'Rain Cloud Gray';
run;

proc format lib=formtlib; 
 value $col 
 'W' = 'Moon White' 
 'B' = 'Sky Blue' 
 'Y' = 'Sunburst Yellow' 
 'G' = 'Rain Cloud Gray'; 
run;

/* Specifying Value Ranges */
proc format lib=formtlib; 
 value agefmt 
 0-<13='child' 
 13-<20='teenager' 
 20-<65='adult' 
 65-100='senior citizen'; 
run;

proc format lib=formtlib; 
 value agefmt 
 low-<13='child' 
 13-<20='teenager' 
 20-<65='adult' 
 65-high='senior citizen' 
 other='unknown'; 
run;

proc format lib=formtlib; 
 value agefmt 
 0-<13='child' 
 13-<20='teenager' 
 20-<65='adult' 
 65-100='senior citizen'; 
run;

proc format lib=formtlib; 
 value agefmt 
 low-<13='child' 
 13-<20='teenager' 
 20-<65='adult' 
 65-high='senior citizen' 
 other='unknown'; 
run;

proc format;
 value gender 
   1 = 'Male' 2 = 'Female'; 
  value agegroup  
   13 -< 20 = 'Teen' 20 -< 65 = 'Adult' 65 - HIGH = 'Senior'; 
  value $col  
   'W' = 'Moon White' 'B' = 'Sky Blue' 'Y' = 'Sunburst Yellow' 'G' = 'Rain Cloud Gray';
run;


/* Assigning Formats to Variables */
data work.carsurvey;
 set cert.cars;
 format Sex gender. Age agegroup. Color $col. Income Dollar8.;
run;

proc print data=work.carsurvey;
run;

libname formtlib 'C:\Users\Student1\formats\lib';
proc format lib=formtlib;
 value gender 
 1 = 'Male';
 value agegroup 
 13 -< 20 = 'Teen'
 20 -< 65 = 'Adult'
65 - HIGH = 'Senior';
 value $col 
 'W' = 'Moon White'
 'B' = 'Sky Blue'
 'Y' = 'Sunburst Yellow'
 'G' = 'Rain Cloud Gray';
run;
data work.carsurvey;
 set cert.cars;
 format Sex gender. Age agegroup.Color $col. Income Dollar8.;
run;
proc print data=work.carsurvey;
run;

/* Displaying User-Defined Formats */
libname formtlib 'c:\sas\formats\lib'; 
proc format library=formtlib fmtlib; 
run;

/* Example: Date and Time Values */
data work.test; 
 set cert.temp; 
 TotDay=enddate-startdate; 
run;
proc print data=work.test; 
run;

/* Example: Reading Dates with Formats and Informats */
proc import datafile='C:\Users\Student1\cert\new_hires.csv'
 out=newhires
 dbms=csv
 replace;
 getnames=yes;
run;
proc print data=work.newhires;
run;
proc contents data=work.newhires;
run;

/* Example: Using Dates and Times in Calculations */
data work.aprhospitalbills;
 set cert.aprbills;
 Days=dateout-datein+1; /* #1 */
 RoomCharge=days*roomrate; /* #2 */
 Total=roomcharge+equipcost; /* #3 */
run;
proc print data=work.aprhospitalbills;
 format DateIn DateOut mmddyy8.; /* #4 */
run;

/* The WEEKDATEw. Format */
proc print data=work.aprhospitalbills; 
 format datein dateout weekdate17.;
run;

/* The WORDDATEw. Format */
proc print data=work.aprhospitalbills; 
 format datein dateout worddate12.;
run;

data work.aprhospitalbills;
 set cert.aprbills;
 Days=dateout-datein+1;
 RoomCharge=days*roomrate;
 Total=roomcharge+equipcost;
 format datein dateout worddate12.;
run;
proc print data=work.aprhospitalbills;
run;

/* Arguments and Variable Lists */
function-name(argument-1,argument-2,argument-n);

/* Example: Multiple Arguments */
mean(x1,x2,x3)
mean(of x1-x3)

/* Target Variables */
AvgScore=mean(exam1,exam2,exam3);

/* Converting Data with Functions */

/* A Word about Converting Data */
data work.newtemp;
 set cert.temp;
 Salary=payrate*hours;
run;

/* Automatic Character-to-Numeric Conversion */
data work.newtemp; 
 set cert.temp; 
 Salary=payrate*hours; 
run;

/* hen Automatic Conversion Occurs */
Rate=payrate;

Salary=payrate*hours;

if payrate>=rate;

NewRate=sum(payrate,raise);

/* Restriction for WHERE Expressions */
data work.convtest; 
 Number=4; 
 Character='4'; 
run; 
proc print data=work.convtest; 
 where character=4; 
run; 
proc print data=work.convtest; 
 where number='4'; 
run;

/* Example: INPUT Function */
Test=input(saletest,comma9.);

input(payrate,2.)

data work.newtemp; 
 set cert.temp; 
 Salary=input(payrate,2.)*hours; 
run;

/* Explicit Numeric-to-Character Conversion */
data work.newtemp;
  set cert.temp; 
   Assignment=site||'/'||dept; 
run;

data work.newtemp; 
 set cert.temp; 
 Assignment=put(site,2.)||'/'||dept; 
run;
proc print data=work.newtemp;
run;

/* Manipulating SAS Date Values with Functions */

/* Example: Finding the Year and Month */
year(startdate)

month(startdate)

data work.nov17; 
 set cert.temp; 
 if year(startdate)=2017 and month(startdate)=11; 
run;

proc print data=work.nov17; 
 format startdate enddate birthdate date9.;
run;

/* Example: Finding the Year */
year(startdate)

data work.temp16; 
 set cert.temp; 
 if year(startdate)=2016; 
run;

data work.temp16; 
 set cert.temp; 
 where year(startdate)=2016; 
run; 
proc print data=work.temp16; 
 format startdate enddate birthdate date9.;
run;

/* Example: WEEKDAY Function */
data work.schwkend; 
 set cert.sch; 
 if weekday(airdate)in(1,7); 
run;
proc print data=work.schwkend;
run;

/* Example: MDY Function */
mdy(month,day,year)

data work.datestemp; 
 set cert.dates; 
 Date=mdy(month,day,year);
run;
proc print data=work.datestemp;
 format date mmddyy10.;
run;

data work.datestemp;
 set cert.dates;
 DateCons=mdy(6,17,2018);
run;
proc print data=work.datestemp;
 format DateCons mmddyy10.;
run;

/* Example: Finding the Date */
data work.review2018 (drop=Day);
 set cert.review2018;
 ReviewDate=mdy(12,day,2018);
run;
proc print data=work.review2018;
 format ReviewDate mmddyy10.;
run;

/* 如果您在MDY函数中指定了一个无效的日期，那么SAS会将一个缺失的值分配给目标变量 */
data work.review2018 (drop=Day);
 set cert.review2018;
 ReviewDate=mdy(15,day,2018);
run;
proc print data=work.review2018;
 format ReviewDate mmddyy10.;
run;

/* Example: The DATE and TODAY Functions */
EditDate=date();

data work.tempdate; 
 set cert.dates; 
 EditDate=date(); 
run;
proc print data=work.tempdate; 
 format EditDate date9.; 
run;

/* Examples: INTCK Function */
Years=intck('year','15jun2016'd,'15jun2018'd);

Months=intck('month','15jun2016'd,'15jun2018'd);

Years=intck('year','01jan2018'd,'31dec2018'd);

/* Example: The INTCK Function and Periodic Events */
data work.anniversary; 
 set cert.mechanics(keep=id lastname firstname hired); 
 Years=intck('year',hired,today()); 
 if years=20 and month(hired)=month(today()); 
run;
proc print data=work.anniversary; 
 title '20-Year Anniversaries'; 
run;

/* INTNX Function */

/* Example: INTNX Function */
TargetYear=intnx('year','20Jul18'd,3);

TargetMonth=intnx('semiyear','01Jan18'd,1);

/* Examples of the YRDIF Function */
data _null_;
 x=yrdif('16feb2016'd,'16jun2018'd,'30/360');
 put x;
run;

data _null_;
 x=yrdif('16feb2016'd, '16jun2018'd, 'ACT/ACT');
 put x;
run;

data _null_;
 x=yrdif('16feb2016'd, '16jun2018'd, 'ACT/360');
 put x;
run;

data _null_;
 x=yrdif('16feb2016'd, '16jun2018'd, 'ACT/365');
 put x;
run;

/* Example: Create New Name Variables */
LastName=scan(name,1);

LastName=scan(name,1,' ,');

LastName=scan(name,1);

data work.newnames(drop=name); 
 set cert.staff; 
 LastName=scan(name,1); 
 FirstName=scan(name,2); 
run;

/* Specifying Variable Length */
data work.newnames(drop=name); 
 set cert.staff; 
 length LastName FirstName $ 12;
 LastName=scan(name,1); 
 FirstName=scan(name,2); 
 MiddleInitial=scan(name,3); 
run;
proc print data=newnames;
run;

/* Example: SUBSTR Function */
substr(middlename,1,1)

data work.agencyemp(drop=middlename); 
 set cert.agencyemp; 
 length MiddleInitial $ 1;
 MiddleInitial=substr(middlename,1,1); 
run;
proc print data=work.agencyemp;
run;

/* Replacing Text Using SUBSTR */
SUBSTR(argument,position,n)

/* Positioning the SUBSTR Function */
MiddleInitial=substr(middlename,1,1);

substr(region,1,3)='NNW';

substr(test,4,2)='92';

data work.temp2;
 set cert.temp;
 substr(phone,1,3)='433';
run;
proc print data=work.temp2;
run;

data work.temp2(drop=exchange);
 set cert.temp;
 Exchange=substr(phone,1,3);
 substr(phone,1,3)='433';
run;
proc print data=work.temp2;
run;

data work.temp2(drop=exchange);
 set cert.temp;
 Exchange=substr(phone,1,3);
 if exchange='622' then substr(phone,1,3)='433';
run;
proc print data=work.temp2;
run;

MiddleInitial=substr(middlename,1,1);

substr(region,1,3)='NNW';

/* Example: LEFT Function */
data _null_;
 a='DUE DATE';
 b=' DUE DATE';
 c=left(a);
 d=left(b);
 put c $8.;
 put d $12.;
run;

/* Example: RIGHT Function */
data _null_;
 a='DUE DATE';
 b='DUE DATE ';
 c=right(a);
 d=right(b);
 put c $8.;
 put d $12.;
run;

/* Concatenation Operator */
FullName = First || Middle || Last;

/* TRIM Function */
FullName = trim(First) || trim(Middle) || Last;

/* Example: TRIM Function */
data work.nametrim;
 length Name $ 20 First Middle Last $ 10;
 Name= 'Jones, Mary Ann, Sue';
 First = left(scan(Name, 2, ','));
 Middle = left(scan(Name, 3, ','));
 Last = scan(name, 1, ',');
 FullName = trim(First) || trim(Middle) ||Last;
 drop Name;
run;
proc print data=work.nametrim;
run;

/* CATX Function */
data work.newaddress(drop=address city state zip); 
 set cert.temp; 
 NewAddress=trim(address)||', '||trim(city)||', '||zip; 
run;

/* Example: Create New Variable Using CATX Function */
data work.newaddress(drop=address city state zip); 
 set cert.temp; 
 NewAddress=catx(', ',address,city,zip); 
run;
proc print data=work.newaddress;
run;

/* Example: Search for Occurrences of a Phrase */
index(job,'word processing')

data work.datapool; 
 set cert.temp; 
 where index(job,'word processing') > 0; 
run;
proc print data=work.datapool;
run;

index(job,'WORD PROCESSING')

/* index 函数是区分大小写的 */

/* Finding a String Regardless of Case */
index(upcase(job),'WORD PROCESSING') 

index(lowcase(job),'word processing')

/* Example: Find Word Processing Jobs in a Data Set */
find(job,'word processing')

data work.datapool; 
 set cert.temp; 
 where find(job,'word processing') > 0; 
run;
proc print data=work.datapool;
run;

/* UPCASE Function */
data work.upcasejob; 
 set cert.temp; 
 Job=upcase(job); 
run;
proc print data=work.upcasejob;
run;
The new data set contains the converted values of Job.

/* LOWCASE Function */
data work.lowcasecontact; 
 set cert.temp; 
 Contact=lowcase(contact); 
run;
proc print data=work.lowcasecontact;
run;

/* PROPCASE Function */
data work.propcasecontact;
 set cert.temp;
 Contact=propcase(contact);
run;
proc print data=work.propcasecontact;
run;

/* Example: Update Variables in Place Using TRANWRD Function */
name=tranwrd(name,'Monroe','Manson')

data work.after; 
 set cert.before; 
 name=tranwrd(name,'Miss','Ms.'); 
 name=tranwrd(name,'Mrs.','Ms.'); 
run;
proc print data=work.after;
run;

/* COMPBL Function */
data _null_;
 string='Hey
 Diddle Diddle';
 string=compbl(string);
 put string;
run;

data _null_;
 string='125 E Main St';
 length address $10;
 address=compbl(string);
 put address;
run;

/* COMPRESS Function */
compress(source, "1234567890");
compress(source, , "d");

compress(source, "1234567890+-");
compress(source, "+-", "d");

/* Example: Compress a Character String */
data _null_;
 a='A B C D';
 b=compress(a);
 put b=;
run;

/* Example: Compress a Character String Using a Modifier */
data _null_;
 x='919-000-000 nc 610-000-000 pa 719-000-000 CO 419-000-000 Oh';
 y=compress(x, 'ACHONP', 'i');
 put y=;
run;
The following is printed to the SAS log.

/* CEIL and FLOOR Functions */
data _null_;
 var1=2.1;
 var2=-2.1;
 a=ceil(var1);
 b=ceil(var2);
 put "a=" a;
 put "b=" b;
run;

data _null_;
 c=ceil(1+1.e-11);
 d=ceil(-1+1e-11);
 e=ceil(1+1.e-13)
 put "c=" c;
 put "d=" d;
 put "e=" e;
run;

data _null_;
 f=ceil(223.456);
 g=ceil(763);
 h=ceil(-223.456);
 put "f=" f;
 put "g=" g;
 put "h=" h;
run;

data _null_;
 var1=2.1;
 var2=-2.1;
 a=floor(var1);
 b=floor(var2);
 put "a=" a;
 put "b=" b;
run;

data _null_;
 c=floor(1+1.e-11);
 d=floor(-1+1e-11);
 e=floor(1+1.e-13)
 put "c=" c;
 put "d=" d;
 put "e=" e;
run;

data _null_;
 f=floor(223.456);
 g=floor(763);
 h=floor(-223.456);
 put "f=" f;
 put "g=" g;
 put "h=" h;
run;

/* INT Function */
data work.creditx; 
 set cert.credit; 
 Transaction=int(transaction); 
run;
proc print data=work.creditx;
run;

/* ROUND Function */
data work.rounders;
 set cert.rounders; 
 AccountBalance=round(AccountBalance, 1);
 InvoicedAmount=round(InvoicedAmount, 0.1);
 AmountRemaining=round(AmountRemaining, 0.02);
 format AccountBalance InvoicedAmount PaymentReceived AmountRemaining dollar9.2;
run;
proc print data=work.rounders;
run;

/* Nesting SAS Functions */
MiddleInitial=substr(scan(name,3),1,1);

Years=intck('year','15jun2018'd,today());

/* Example: Default PROC MEANS Output */
proc means data=cert.survey; 
run;

/* Example: Specifying Statistic Keywords */
proc means data=cert.survey median range; 
run;

/* Limiting Decimal Places with MAXDEC= Option */
proc means data=cert.diabetes min max maxdec=0; 
run;

/* Specifying Variables Using the VAR Statement */
proc means data=cert.diabetes min max maxdec=0;
 var age height weight;
run;

proc means data=cert.survey mean stderr maxdec=2;
 var item1-item5;
run;

/* Group Processing Using the CLASS Statement */
proc means data=cert.heart maxdec=1;
 var arterial heart cardiac urinary;
 class survive sex;
run;

/* Creating a Summarized Data Set Using the OUTPUT Statement */
proc means data=cert.diabetes;
 var age height weight; /* #1 */
 class sex; /* #2 */
 output out=work.diabetes_by_gender /* #3 */
 mean=AvgAge AvgHeight AvgWeight
 min=MinAge MinHeight MinWeight;
run;
proc print data=work.diabetes_by_gender noobs; /* #4 */
 title1 'Diabetes Results by Gender';
run;

/* FREQ Procedure Syntax */
Syntax, FREQ procedure:
PROC FREQ <options>;
RUN;

/* Example: Creating a One-Way Frequency Table (Default) */
proc freq data=cert.usa;
run;

/* Example: Creating a One-Way Table for One Variable */
proc freq data=cert.diabetes;
 tables sex;
run;

/* Example: Determining the Report Layout */
proc freq data=cert.loans;
 tables rate months;
run;

proc freq data=cert.survey;
 tables item1-item3;
run;

/* Example: Creating Two-Way Tables */
proc freq data=cert.diabetes;
 tables sex*fastgluc;
run;

/*Examples: Creating N-Way Tables */
proc format;
 value Survive 
 0='Dead'
 1='Alive';
run;
proc freq data=cert.leukemia;
 tables Survived*AG*WhiteCells;
 format Survived survive.;
run;

/* Example: Using the LIST Option */
proc format;
 value survive 0='Dead'
 1='Alive';
run;
proc freq data=cert.leukemia;
 tables Survived*AG*WhiteCells / list;
 format Survived survive.;
run;

/* Example: Using the CROSSLIST Option*/
proc format;
 value survive 0='Dead'
 1='Alive';
run;
proc freq data=cert.leukemia;
 tables Survived*AG*whitecells / crosslist;
 format Survived survive.;
run;

/* Example: Suppressing Percentages */
proc format;
 value survive 0='Dead'
 1='Alive';
run;
proc freq data=cert.leukemia;
 tables Survived*AG*whitecells / nofreq norow nocol;
 format Survived survive.;
run

/* Example: Creating Output with PROC PRINT */
ods html body='C:\Users\Student1\cert\admit.html';
proc print data=cert.admit label;
 var sex age height weight actlevel;
 label actlevel='Activity Level';
run;
ods html close;
ods html path="%qsysfunc(pathname(work))";

/* Creating HTML Output with a Table of Contents */
ods html body='C:\Users\Student1\cert\data.html'
 contents='C:\Users\Student1\cert\toc.html'
 frame='C:\Users\Student1\cert\frame.html';
proc print data=cert.admit (obs=10) label;
 var id sex age height weight actlevel;
 label actlevel='Activity Level';
run;
proc print data=cert.stress2 (obs=10); 
 var id resthr maxhr rechr;
run;
ods html close;
ods html path="%qsysfunc(pathname(work))";

/* Using Options to Specify Links and Paths */
ods html body='C:\Users\Student1\cert\data.html'
 contents='C:\Users\Student1\cert\toc.html'
 frame='C:\Users\Student1\cert\frame.html';

/* Example Code 1 Source Code for the HTML File Frame.html */
<FRAME MARGINWIDTH="4" MARGINHEIGHT="0" SRC="C:\Users\Student1\cert\toc.html" NAME="contents" SCROLLING=auto>
<FRAME MARGINWIDTH="9" MARGINHEIGHT="0" SRC="C:\Users\Student1\cert\data.html" NAME="body" SCROLLING=auto>

/* Example: Relative URLs */
ods html body='C:\Users\Student1\cert\data.html' (url='data.html')
 contents='C:\Users\Student1\cert\toc.html' (url='toc.html')
 frame='C:\Users\Student1\cert\frame.html';

 /* Example Code 2 Source Code for the HTML File Frame.html */
 <FRAME MARGINWIDTH="4" MARGINHEIGHT="0" SRC="toc.html" NAME="contents" SCROLLING=auto>
<FRAME MARGINWIDTH="9" MARGINHEIGHT="0" SRC="data.html" NAME="body" SCROLLING=auto>

/* Example: Absolute URLs */
ods html body='C:\Users\Student1\cert\data.html' (url='http://mysite.com/cert/data.html')
 contents='C:\Users\Student1\cert\toc.html' (url='http://mysite.com/cert/toc.html')
 frame='C:\Users\Student1\cert\frame.html';

/* Example Code 3 Source Code for the HTML File Frame.html */
<FRAME MARGINWIDTH="4" MARGINHEIGHT="0" SRC="http://mysite.com/cert/data.html" NAME="contents" SCROLLING=auto>
<FRAME MARGINWIDTH="9" MARGINHEIGHT="0" SRC="http://mysite.com/cert/toc.html"  NAME="body" SCROLLING=auto>

/* Example: PATH= Option with URL=NONE */
ods html path='C:\Users\Student1\cert\' (url=none)
 body='data.html'
 contents='toc.html'
 frame='frame.html';
proc print data=cert.admit;
run;
proc print data=cert.stress2;
run;
ods html close;
ods html path="%qsysfunc(pathname(work))";

/* Example: PATH= Option without the URL= Suboption */
ods html path='C:\Users\Student1\cert\'
 body='data.html'
 contents='toc.html'
 frame='frame.html';
proc print data=cert.admit;
run;
proc print data=cert.stress2;
run;
ods html close;
ods html path="%qsysfunc(pathname(work))";

/* Example: PATH= Option with a Specified URL */
ods html path='C:\Users\Student1\cert\ (url='http://mysite.com/cert/')
 body='data.html'
 contents='toc.html'
 frame='frame.html';
proc print data=cert.admit;
run;
proc print data=cert.stress2;
run;
ods html close;
ods html path="%qsysfunc(pathname(work))";

/* Changing the Appearance of HTML Output */
proc template;
list styles/store=sashelp.tmplmst;
run;

/* Example: The STYLE= Option (Banker Style) */
ods html body='C:\Users\Student1\cert\data.html'
 style=banker;
proc print data=cert.admit label;
 var sex age height weight actlevel;
run;
ods html close;
ods html path="%qsysfunc(pathname(work))";

/* Example: Creating PDF Output Using the FILE= Option */
ods html close;
ods pdf file="SamplePDF";
proc freq data=sashelp.cars;
 tables origin*type;
run;
ods pdf close;

/* Example: Creating a Printable Table of Contents */
ods html close;
title "Create a Table of Contents";
options nodate;
ods pdf file="MyDefaultToc.pdf" contents=yes bookmarklist=hide;
proc freq data=sashelp.cars;
 tables origin*type;
run;
proc print data=sashelp.cars (obs=15);
run;
ods pdf close;
ods html path="%qsysfunc(pathname(work))";


/* Example: The STYLE= Option (FestivalPrinter Style) */
ods html close;
ods pdf file="SamplePDF" style=FestivalPrinter;
proc freq data=sashelp.cars;
 tables origin*type;
run;
ods pdf close;

/* Example: Using the STYLE= Option (FestivalPrinter Style) */
ods html close;
ods rtf file="SampleRTF" style=FestivalPrinter;
proc freq data=sashelp.cars;
 tables origin*type;
run;
ods rtf close;

/* Example: Customizing Your Excel Output */
ods excel file='multitablefinal.xlsx' /* #1 */
 options (sheet_interval="bygroup" /* #2 */
 suppress_bylines='yes' /* #3 */
 sheet_label='country' /* #4 */
 embedded_titles='yes'); /* #5 */
title 'Wage Rates By Manager';
proc means data=cert.usa;
 by manager;
 var wagerate;
run;

/* Example: Exporting a Subset of Observation to a CSV File */
proc export data=cert.leukemia (where=(survived=1)) /* #1 */
 outfile="C:\cert\leukemia_surv.csv" /* #2 */
 dbms=csv /* #3 */
 replace; /* #4 */
run;







