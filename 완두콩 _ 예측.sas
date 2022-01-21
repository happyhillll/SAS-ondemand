/*

1. 산점도를 그리고 회귀선을 구하라. 각 계수 추정량의 표준오차를 적어라.

2. 

*/

data sweetpea;
input parent descendent;
cards;
21 17.26
20 17.07
19 16.37
18 16.40
17 16.13
16 16.17
15 15.98
;

* 1. 산점도를 그리고 회귀선을 구하라. 각 계수 추정량의 표준오차를 적어라.;
proc sgplot data = sweetpea;
	ㅊㄴ