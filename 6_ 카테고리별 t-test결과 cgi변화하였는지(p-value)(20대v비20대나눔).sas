/*20��*/
  /*�����͸� �ҷ���*/
proc import datafile = 'D:\M_20.csv'
out = M_20 dbms = csv replace;
getnames = yes;
run;

/*MANOVA�м�*/
 proc glm data = M_20;
class var2; /*�׷캯��*/
  model var3 --var18 = var2;
MANOVA H = var2/ PRINTE PRINTH; /*PRINTE�� ������������� , PRINTH�� ó�����������*/
  run;

/*��20��*/
  /*�����͸� �ҷ���*/
  proc import datafile = 'D:/M_3060.csv'
out = M_3060 dbms = csv replace;
getnames = yes;
run;

/*MANOVA�м�*/
  proc glm data = M_3060;
class var2; /*�׷캯��*/
  model var3 --var18 = var2;
MANOVA H = var2/ PRINTE PRINTH; /*PRINTE�� ������������� , PRINTH�� ó�����������*/
  run;
