/*중회귀분석*/
proc import out=Meddicorp
datafile="/home/u58178606/regression class/MEDDICORP4.csv"
dbms=csv replace;
run;

*회귀모형 적합;

proc reg data=Meddicorp;
model SALES=ADV BONUS;
run;

* SALES_hat(Y_hat) = -516.444 + 2.473*ADV(X_1) + 1.856*BONUS(X_2)