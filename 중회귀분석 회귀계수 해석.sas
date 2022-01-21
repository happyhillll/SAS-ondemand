*중회귀분석;
/***Cost Data***/
proc import out = COST4
datafile="/home/u58178606/regression class/COST4.xlsx"
dbms=xlsx replace;
run;

*1) 4개의 독립변수를 모두 사용한 회귀선은?;
proc reg data=COST4 plot=none;
model COST = PAPER MACHINE OVERHEAD LABOR / clb alpha=0.05;
run;

*2) 회귀선의 전체적인 적합 여부를 f-검정으로 실시하되, 가설을 적고/ 5%로 검정한 결론을 서술하라.;
/*
h0 : b1=b2=b3=b4=0;
h1 : at least one of the b isn't equal to zero;

p-value < 0.05
f > f0.05(4,22)
따라서 귀무가설을 기각한다. < 4개의 설명변수중 적어도 하나는 유의하다. */


*3) 월별 기계사용시간에 따른 생산비용이 얼마인지 추정하고, 95%신뢰구간 구하기;
/*
기계사용시간을 제외한 다른 값이 고정되어있을때, machine이 1시간 늘어나면, 
cost는 $2,471만큼 늘어난다.
신뢰구간(1.505,3.436)
그러므로 $1,505 ~ $3,436만큼 늘어난다.  */


*4) 월별 골지 생산량 1톤에 따른 생산비용이 1만큼 증가한다는 가설을 5% 신뢰수준으로 검정;
/*
h0 : b_paper = 1
h1 : b_paper =* 1


*5) 생산비용의 변동은 몇 퍼센트 설명?;
R-sqr : 99.8 % 







	