*어떤 모형을 선택할 것인가 ?;
proc import out= TELEMARK
datafile = "/home/u58178606/regression class/telemark.xlsx"
dbms=xlsx replace;
run;

proc sgplot data = TELEMARK;
scatter X=MONTHS Y=CALLS;
run;

data TELEMARK2;
set TELEMARK;
MONTHS2 = MONTHS ** 2;
run;

*회귀;
proc reg data=TELEMARK2 plots=none;
model CALLS = MONTHS;
run;

proc reg data=TELEMARK2 plots=none;
model CALLS = MONTHS MONTHS2;
run;

*r-sqr 가 model2가 더 좋음

*c=x-x_bar 이거 회귀한것도 있음 5장 실습 텔레마켓