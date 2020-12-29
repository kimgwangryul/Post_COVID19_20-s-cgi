/*20��*/
/* ī�װ� ������ �����м�*/
proc import datafile = 'D:\G20_scale.csv' dbms = csv out = G20_scale replace;
run;

/*������ �����м�*/
/*method =  single(�ִܿ����), complete(���忬���), ward(�е忬���), average(��տ����), centroid(�߽ɿ����)�� ���� �޶���*/
/*������������ ����ȭ �ε����� pseudo-F���� ���ĺ��� ���ų� pseudo-T ���� ������ �ܰ迡�� ����*/


proc cluster data = G20_scale method = ward outtree = out1 standard pseudo rsq;
var G20_pre G20_ing G20_post;
id var1;
copy G20_pre G20_ing G20_post;
/*���������׸� �׸���, ncl= �����ǰ�������*/
proc tree data = out1 ncl=3 out=cluster_1;
id var1;
proc print data = cluster_1;
run;
/*������ ���� �� ����*/
proc sort data = cluster_1;
by var1;
run;
proc sort data = G20_scale;
by var1;
run;
data cluster_1d;
merge cluster_1 G20_scale;
by var1;
run;
proc sort data = cluster_1d;
by cluster;
run;
proc print data = cluster_1d;
run;
/*������ ������跮*/
proc means data = cluster_1d;
by cluster;
run;
/*�����м� �ð�ȭ*/
proc gplot data=cluster_1d;   
	plot G20_pre*G20_ing = cluster / vaxis=axis1 haxis=axis2 legend=legend;  
	axis1 label=(h=3 a=90 r=0) value=(h=2);  
	axis2 label=(h=3)  value=(h=2);  
	symbol1 i=none h=1.5 v=dot  c=blue;   
	symbol2 i=none h=1.5 v=dot  c=red;     
	symbol3 i=none h=1.5 v=dot  c=yellow;     
	legend position=(top right  inside) mode=share label =(h=3 ) value =(h=3); 
run;
proc gplot data=cluster_1d;   
	plot G20_ing*G20_post = cluster / vaxis=axis1 haxis=axis2 legend=legend;  
	axis1 label=(h=3 a=90 r=0) value=(h=2);  
	axis2 label=(h=3)  value=(h=2);  
	symbol1 i=none h=1.5 v=dot  c=blue;   
	symbol2 i=none h=1.5 v=dot  c=red;    
	symbol3 i=none h=1.5 v=dot  c=yellow;     
	legend position=(top right  inside) mode=share label =(h=3 ) value =(h=3); 
run;






/*�� 20��*/
/* ī�װ� ������ �����м�*/
proc import datafile = 'D:\G3060_scale.csv' dbms = csv out = G3060_scale replace;
run;

/*������ �����м�*/
/*method =  single(�ִܿ����), complete(���忬���), ward(�е忬���), average(��տ����), centroid(�߽ɿ����)�� ���� �޶���*/
/*������������ ����ȭ �ε����� pseudo-F���� ���ĺ��� ���ų� pseudo-T ���� ������ �ܰ迡�� ����*/


proc cluster data = G3060_scale method = ward outtree = out2 standard pseudo rsq;
var G3060_pre G3060_ing G3060_post;
id var1;
copy G3060_pre G3060_ing G3060_post;
/*���������׸� �׸���, ncl= �����ǰ�������*/
proc tree data = out2 ncl=2 out=cluster_2;
id var1;
proc print data = cluster_2;
run;
/*������ ���� �� ����*/
proc sort data = cluster_2;
by var1;
run;
proc sort data = G3060_scale;
by var1;
run;
data cluster_2d;
merge cluster_2 G3060_scale;
by var1;
run;
proc sort data = cluster_2d;
by cluster;
run;
proc print data = cluster_2d;
run;
/*������ ������跮*/
proc means data = cluster_2d;
by cluster;
run;
/*�����м� �ð�ȭ*/
proc gplot data=cluster_2d;   
	plot G3060_pre*G3060_ing = cluster / vaxis=axis1 haxis=axis2 legend=legend;  
	axis1 label=(h=3 a=90 r=0) value=(h=2);  
	axis2 label=(h=3)  value=(h=2);  
	symbol1 i=none h=1.5 v=dot  c=blue;   
	symbol2 i=none h=1.5 v=dot  c=red;     
	symbol3 i=none h=1.5 v=dot  c=yellow;     
	legend position=(top right  inside) mode=share label =(h=3 ) value =(h=3); 
run;
proc gplot data=cluster_2d;   
	plot G3060_ing*G3060_post = cluster / vaxis=axis1 haxis=axis2 legend=legend;  
	axis1 label=(h=3 a=90 r=0) value=(h=2);  
	axis2 label=(h=3)  value=(h=2);  
	symbol1 i=none h=1.5 v=dot  c=blue;   
	symbol2 i=none h=1.5 v=dot  c=red;    
	symbol3 i=none h=1.5 v=dot  c=yellow;     
	legend position=(top right  inside) mode=share label =(h=3 ) value =(h=3); 
run;



