#군집분석 위한 데이터 만들기
# 코로나 전-중-후 변화별로 카테고리별 cgi변화량 만들기
#20대 
G20_pre = date_catm_cgi_all_20_matrix %>% filter(시기 == 'pre')
G20_pre = apply(G20_pre[,-1],2,mean)
G20_ing = date_catm_cgi_all_20_matrix %>% filter(시기 == 'ing')
G20_ing = apply(G20_ing[,-1],2,mean)
G20_post = date_catm_cgi_all_20_matrix %>% filter(시기 == 'post')
G20_post = apply(G20_post[,-1],2,mean)

G20 = as.data.frame(cbind(G20_pre, G20_ing, G20_post))
str(G20)
#비20대
G3060_pre = date_catm_cgi_all_3060_matrix %>% filter(시기 == 'pre')
G3060_pre = apply(G3060_pre[,-1],2,mean)
G3060_ing = date_catm_cgi_all_20_matrix %>% filter(시기 == 'ing')
G3060_ing = apply(G3060_ing[,-1],2,mean)
G3060_post = date_catm_cgi_all_20_matrix %>% filter(시기 == 'post')
G3060_post = apply(G3060_post[,-1],2,mean)

G3060 = as.data.frame(cbind(G3060_pre, G3060_ing, G3060_post))
str(G3060)


#단순 cgi수치를 카테고리별로 표준화 시켜주기

#20대
G20t = as.data.frame(t(G20))
for (i in 1:ncol(G20t)){
  G20t[,i] = scale(G20t[,i])
}
G20_scale = as.data.frame(t(G20t))
G20_scale

#비20대
G3060t = as.data.frame(t(G3060))
for (i in 1:ncol(G3060t)){
  G3060t[,i] = scale(G3060t[,i])
}
G3060_scale = as.data.frame(t(G3060t))
G3060_scale

#이후 SAS로 넘어가서 군집분석 실행
write.csv(G20_scale,"D:\\G20_scale.csv")
write.csv(G3060_scale,"D:\\G3060_scale.csv")


####################아래는 군집분석 SAS코드############################
# /* 카테고리 나누는 군집분석*/
#   proc import datafile = 'D:\G20_scale.csv' dbms = csv out = G20_scale replace;
# run;
# 
# /*계층적 군집분석*/
#   /*method =  single(최단연결법), complete(최장연결법), ward(왈드연결법), average(평균연결법), centroid(중심연결법)에 따라서 달라짐*/
#   /*적정군집수는 군집화 인덱스인 pseudo-F값이 전후보다 높거나 pseudo-T 값이 낮아진 단계에서 결정*/
#   
#   
#   proc cluster data = G20_scale method = ward outtree = out1 standard pseudo rsq;
# var G20_pre G20_ing G20_post;
# id var1;
# copy G20_pre G20_ing G20_post;
# /*나무구조그림 그리기, ncl= 군집의개수지정*/
#   proc tree data = out1 ncl=3 out=cluster_1;
# id var1;
# proc print data = cluster_1;
# run;
# /*데이터 정렬 및 병합*/
#   proc sort data = cluster_1;
# by var1;
# run;
# proc sort data = G20_scale;
# by var1;
# run;
# data cluster_1d;
# merge cluster_1 G20_scale;
# by var1;
# run;
# proc sort data = cluster_1d;
# by cluster;
# run;
# proc print data = cluster_1d;
# run;
# /*군집별 기초통계량*/
#   proc means data = cluster_1d;
# by cluster;
# run;
# /*군집분석 시각화*/
#   proc gplot data=cluster_1d;   
# plot G20_pre*G20_ing = cluster / vaxis=axis1 haxis=axis2 legend=legend;  
# axis1 label=(h=3 a=90 r=0) value=(h=2);  
# axis2 label=(h=3)  value=(h=2);  
# symbol1 i=none h=1.5 v=dot  c=blue;   
# symbol2 i=none h=1.5 v=dot  c=red;     
# symbol3 i=none h=1.5 v=dot  c=yellow;     
# legend position=(top right  inside) mode=share label =(h=3 ) value =(h=3); 
# run;
# proc gplot data=cluster_1d;   
# plot G20_ing*G20_post = cluster / vaxis=axis1 haxis=axis2 legend=legend;  
# axis1 label=(h=3 a=90 r=0) value=(h=2);  
# axis2 label=(h=3)  value=(h=2);  
# symbol1 i=none h=1.5 v=dot  c=blue;   
# symbol2 i=none h=1.5 v=dot  c=red;    
# symbol3 i=none h=1.5 v=dot  c=yellow;     
# legend position=(top right  inside) mode=share label =(h=3 ) value =(h=3); 
# run;

######################################################################