*6) model1 : y=x1 x2 x3 x4 / model2 : y = x1 x2 일때 어떤 모형 사용?
* 가설 / decision rule / test statistic 계산 / 결론 서술
h0 : b_3 = b_4 = 0
h1 : b_3 =/ 0 or b4 =/ 0  */

*full model; 
proc reg data=COST4 plot=none;
	model COST=PAPER MACHINE OVERHEAD LABOR;
run;

*reduced model;
proc reg data=COST4 plot=none;
	model COST=PAPER MACHINE;
run;

*partial F-test;
proc reg data=COST4 plot=none;
	model COST=PAPER MACHINE OVERHEAD LABOR;
	test OVERHEAD = LABOR = 0;
run;

*test statistic 계산 = f통계량 = 0.8;
*결론 : f<f(2,22) : h0을 기각할 수 없다. p-value도 기각 못함.
