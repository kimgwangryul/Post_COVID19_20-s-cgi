

#(전세대)월별, 카테고리별 cgi평균
#코로나전
date_catm_cgi_pre = 
  index_pre %>% 
  group_by(period,catm) %>%
  summarize(cgi = mean(cgi))

#코로나중
date_catm_cgi_ing = 
  index_ing %>% 
  group_by(period,catm) %>%
  summarize(cgi = mean(cgi))

#코로나후
date_catm_cgi_post = 
  index_post %>% 
  group_by(period,catm) %>%
  summarize(cgi = mean(cgi))


#(20대)월별, 그룹별 cgi평균
#코로나전
date_catm_cgi_pre_20 = 
  index_pre %>% filter(age == 20) %>%
  group_by(period,catm) %>%
  summarize(cgi = mean(cgi))

#코로나중
date_catm_cgi_ing_20 = 
  index_ing %>% filter(age == 20) %>%
  group_by(period,catm) %>%
  summarize(cgi = mean(cgi))

#코로나후
date_catm_cgi_post_20 = 
  index_post %>% filter(age == 20) %>%
  group_by(period,catm) %>%
  summarize(cgi = mean(cgi))


#(비20대)월별, 그룹별 cgi평균
#코로나전
date_catm_cgi_pre_3060 = 
  index_pre %>% filter(age != 20) %>%
  group_by(period,catm) %>%
  summarize(cgi = mean(cgi))

#코로나중
date_catm_cgi_ing_3060 = 
  index_ing %>% filter(age != 20) %>%
  group_by(period,catm) %>%
  summarize(cgi = mean(cgi))

#코로나후
date_catm_cgi_post_3060 = 
  index_post %>% filter(age != 20) %>%
  group_by(period,catm) %>%
  summarize(cgi = mean(cgi))

#date_catm_cgi_pre_20
#date_catm_cgi_ing_20
#date_catm_cgi_post_20
#date_catm_cgi_pre_3060
#date_catm_cgi_ing_3060
#date_catm_cgi_post_3060


#(20대)월X소품목 별 cgi 행렬
#전
date_catm_cgi_pre_20_matrix = matrix(data = date_catm_cgi_pre_20$cgi, ncol = 16, byrow = T)
date_catm_cgi_pre_20_matrix = cbind(c("pre"),date_catm_cgi_pre_20_matrix)
colnames(date_catm_cgi_pre_20_matrix) = c("시기",sort(unique(index_pre$catm)))
rownames(date_catm_cgi_pre_20_matrix) = sort(unique(index_pre$period))
#중
date_catm_cgi_ing_20_matrix = matrix(data = date_catm_cgi_ing_20$cgi, ncol = 16, byrow = T)
date_catm_cgi_ing_20_matrix = cbind(c("ing"),date_catm_cgi_ing_20_matrix)
colnames(date_catm_cgi_ing_20_matrix) = c("시기",sort(unique(index_ing$catm)))
rownames(date_catm_cgi_ing_20_matrix) = sort(unique(index_ing$period))
#후
date_catm_cgi_post_20_matrix = matrix(data = date_catm_cgi_post_20$cgi, ncol = 16, byrow = T)
date_catm_cgi_post_20_matrix = cbind(c("post"),date_catm_cgi_post_20_matrix)
colnames(date_catm_cgi_post_20_matrix) = c("시기",sort(unique(index_post$catm)))
rownames(date_catm_cgi_post_20_matrix) = sort(unique(index_post$period))


#(비20대)월X소품목 별 cgi 행렬
#전
date_catm_cgi_pre_3060_matrix = matrix(data = date_catm_cgi_pre_3060$cgi, ncol = 16, byrow = T)
date_catm_cgi_pre_3060_matrix = cbind(c("pre"),date_catm_cgi_pre_3060_matrix)
colnames(date_catm_cgi_pre_3060_matrix) = c("시기",sort(unique(index_pre$catm)))
rownames(date_catm_cgi_pre_3060_matrix) = sort(unique(index_pre$period))
#중
date_catm_cgi_ing_3060_matrix = matrix(data = date_catm_cgi_ing_3060$cgi, ncol = 16, byrow = T)
date_catm_cgi_ing_3060_matrix = cbind(c("ing"),date_catm_cgi_ing_3060_matrix)
colnames(date_catm_cgi_ing_3060_matrix) = c("시기",sort(unique(index_ing$catm)))
rownames(date_catm_cgi_ing_3060_matrix) = sort(unique(index_ing$period))
#후
date_catm_cgi_post_3060_matrix = matrix(data = date_catm_cgi_post_3060$cgi, ncol = 16, byrow = T)
date_catm_cgi_post_3060_matrix = cbind(c("post"),date_catm_cgi_post_3060_matrix)
colnames(date_catm_cgi_post_3060_matrix) = c("시기",sort(unique(index_post$catm)))
rownames(date_catm_cgi_post_3060_matrix) = sort(unique(index_post$period))

#date_catm_cgi_pre_20_matrix
#date_catm_cgi_ing_20_matrix
#date_catm_cgi_post_20_matrix
#date_catm_cgi_pre_3060_matrix
#date_catm_cgi_ing_3060_matrix
#date_catm_cgi_post_3060_matrix

##(20대)월X소품목 별 cgi 행렬(전중후)
date_catm_cgi_all_20_matrix =
  rbind(date_catm_cgi_pre_20_matrix, date_catm_cgi_ing_20_matrix, date_catm_cgi_post_20_matrix)
#(비20대)월X소품목 별 cgi 행렬(전중후)
date_catm_cgi_all_3060_matrix =
  rbind(date_catm_cgi_pre_3060_matrix, date_catm_cgi_ing_3060_matrix, date_catm_cgi_post_3060_matrix)

#데이터프레임으로 바꿈
date_catm_cgi_all_20_matrix = as.data.frame(date_catm_cgi_all_20_matrix)
date_catm_cgi_all_3060_matrix = as.data.frame(date_catm_cgi_all_3060_matrix)
#숫자형으로 바꿔줌
for (i in 2:17){
  date_catm_cgi_all_20_matrix[,i] = as.numeric(date_catm_cgi_all_20_matrix[,i])
  date_catm_cgi_all_3060_matrix[,i] = as.numeric(date_catm_cgi_all_3060_matrix[,i])
}

write.csv(date_catm_cgi_all_20_matrix,"D:\\M_20.csv")
write.csv(date_catm_cgi_all_3060_matrix,"D:\\M_3060.csv")
#####################################################################################3333
#이후 SAS에서 다변량 분산분석을 통해 20vs비20 의 변화된 품목을 보여줌(아래는 SAS코드)
################################################################################################3
# /*20대*/
#   /*데이터를 불러옴*/
#   proc import datafile = 'D:\M_20.csv'
# out = M_20 dbms = csv replace;
# getnames = yes;
# run;
# 
# /*MANOVA분석*/
#   proc glm data = M_20;
# class var2; /*그룹변수*/
#   model var3 --var18 = var2;
# MANOVA H = var2/ PRINTE PRINTH; /*PRINTE가 오차제곱합행렬 , PRINTH가 처리제곱합행렬*/
#   run;
# 
# /*비20대*/
#   /*데이터를 불러옴*/
#   proc import datafile = 'D:\M_3060.csv'
# out = M_3060 dbms = csv replace;
# getnames = yes;
# run;
# 
# /*MANOVA분석*/
#   proc glm data = M_3060;
# class var2; /*그룹변수*/
#   model var3 --var18 = var2;
# MANOVA H = var2/ PRINTE PRINTH; /*PRINTE가 오차제곱합행렬 , PRINTH가 처리제곱합행렬*/
#   run;
#####################################################################################################

##연령별로 변화 비변화 된 카테고리 정리(p-value기준)##
a <- c(4,6,7,9,10,12,14,15,17)
b <- c(2,3,5,8,11,13,16)
c <- c(3,4,6,7,9,10,12,14,15,17)
d <- c(2,5,8,11,13,16)

category = sort(unique(index$catm))[-3]

category_yes_20 = category[a]
category_no_20 = category[b]
category_yes_3060 = category[c]
category_no_3060 = category[d]

# category_yes_20
# category_no_20
# category_yes_3060
# category_no_3060

####################################################################################################
