/*20대*/
  /*데이터를 불러옴*/
proc import datafile = 'D:\M_20.csv'
out = M_20 dbms = csv replace;
getnames = yes;
run;

/*MANOVA분석*/
 proc glm data = M_20;
class var2; /*그룹변수*/
  model var3 --var18 = var2;
MANOVA H = var2/ PRINTE PRINTH; /*PRINTE가 오차제곱합행렬 , PRINTH가 처리제곱합행렬*/
  run;

/*비20대*/
  /*데이터를 불러옴*/
  proc import datafile = 'D:/M_3060.csv'
out = M_3060 dbms = csv replace;
getnames = yes;
run;

/*MANOVA분석*/
  proc glm data = M_3060;
class var2; /*그룹변수*/
  model var3 --var18 = var2;
MANOVA H = var2/ PRINTE PRINTH; /*PRINTE가 오차제곱합행렬 , PRINTH가 처리제곱합행렬*/
  run;
