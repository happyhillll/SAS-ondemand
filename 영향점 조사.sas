proc import out =SL
datafile="/home/u58178606/SL6.xlsx"
dbms=xlsx replace;
run;

*수익률과 리스크의 관계를 산점도로 표시하고, 번호를 표시하라.;
proc sgscatter data=SL;
matrix return beta sigma;
run;

*어떤 번호가 영향점인지 알고싶을때;
data SL2;
set SL;
id=_n_;
run;

proc sgscatter data=SL2;
matrix return beta sigma / datalabel=id;
run;

*중회귀분석을 실시한 결과를 그래프로 표현하라;
proc reg data=SL2;
model return = beta sigma;
run;

proc reg data=SL;
model return = beta sigma/influence;
run;

data SL_a;
set SL2;
where id ^= 2;  *2번이 아닌경우;
run;

proc sgscatter data = SL2;
matrix return beta sigma / datalabel=id;    *2번관측치 표시됨;
run;

proc sgscatter data=SL_a;
matrix return beta sigma / datalabel=id;    *2번 관측치 없음;
run;
