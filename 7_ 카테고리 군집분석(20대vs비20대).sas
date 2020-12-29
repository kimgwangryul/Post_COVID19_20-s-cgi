/*20대*/
/* 카테고리 나누는 군집분석*/
proc import datafile = 'D:\G20_scale.csv' dbms = csv out = G20_scale replace;
run;

/*계층적 군집분석*/
/*method =  single(최단연결법), complete(최장연결법), ward(왈드연결법), average(평균연결법), centroid(중심연결법)에 따라서 달라짐*/
/*적정군집수는 군집화 인덱스인 pseudo-F값이 전후보다 높거나 pseudo-T 값이 낮아진 단계에서 결정*/


proc cluster data = G20_scale method = ward outtree = out1 standard pseudo rsq;
var G20_pre G20_ing G20_post;
id var1;
copy G20_pre G20_ing G20_post;
/*나무구조그림 그리기, ncl= 군집의개수지정*/
proc tree data = out1 ncl=3 out=cluster_1;
id var1;
proc print data = cluster_1;
run;
/*데이터 정렬 및 병합*/
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
/*군집별 기초통계량*/
proc means data = cluster_1d;
by cluster;
run;
/*군집분석 시각화*/
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






/*비 20대*/
/* 카테고리 나누는 군집분석*/
proc import datafile = 'D:\G3060_scale.csv' dbms = csv out = G3060_scale replace;
run;

/*계층적 군집분석*/
/*method =  single(최단연결법), complete(최장연결법), ward(왈드연결법), average(평균연결법), centroid(중심연결법)에 따라서 달라짐*/
/*적정군집수는 군집화 인덱스인 pseudo-F값이 전후보다 높거나 pseudo-T 값이 낮아진 단계에서 결정*/


proc cluster data = G3060_scale method = ward outtree = out2 standard pseudo rsq;
var G3060_pre G3060_ing G3060_post;
id var1;
copy G3060_pre G3060_ing G3060_post;
/*나무구조그림 그리기, ncl= 군집의개수지정*/
proc tree data = out2 ncl=2 out=cluster_2;
id var1;
proc print data = cluster_2;
run;
/*데이터 정렬 및 병합*/
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
/*군집별 기초통계량*/
proc means data = cluster_2d;
by cluster;
run;
/*군집분석 시각화*/
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



