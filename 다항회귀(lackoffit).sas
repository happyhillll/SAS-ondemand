proc import out= TELEMARK
datafile = "/home/u58178606/regression class/telemark.xlsx"
dbms=xlsx replace;
run;

data TELEMARK2;
set TELEMARK;
MONTHS2 = MONTHS ** 2;
run;

*회귀;
proc reg data=TELEMARK2 plots=none;
model CALLS = MONTHS / lackfit ;
run;

proc reg data=TELEMARK2 plots=none;
model CALLS = MONTHS MONTHS2 / lackfit ;
run;

*1,2차 회귀선을 산점도와 함꼐;
proc sgplot data=TELEMARK2;
reg X=MONTHS Y=CALLS /degree=1;
reg X=MONTHS Y=CALLS /degree=2;
run;