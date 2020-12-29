####################패키지, 라이브러리####################
#install.packages("dplyr")
#install.packages("readr")
library(dplyr)
library(readr)
##########################################################


################데이터 불러오기 및 전처리#################

index <- read_csv("C:/Users/GWANGRYUL/Desktop/COVID19_DATA/index.csv")
head(index)
#View(index)
str(index)


#코로나 전(전연령)
index_pre = index %>% 
  select(period, catl, catm, age, cgi) %>% 
  filter(  !is.na(index$age) &
             index$gender == 'all' & 
             index$sigungu == 'all' &
             index$period >= 201901 & period <= 202001 & 
             index$catm != "기타화장품") %>%
  arrange(period, catl, catm)

#코로나 중(전연령)
index_ing = index %>% 
  select(period, catl, catm, age, cgi) %>% 
  filter(  !is.na(index$age) &
             index$gender == 'all' & 
             index$sigungu == 'all' &
             index$period >= 202002 & period <= 202003 & 
             index$catm != "기타화장품") %>%
  arrange(period, catl, catm)

#코로나 후(전연령)
index_post = index %>% 
  select(period, catl, catm, age, cgi) %>% 
  filter(    !is.na(index$age) &
               index$gender == 'all' & 
               index$sigungu == 'all' &
               index$period >= 202004 & 
               index$catm != "기타화장품") %>%
  arrange(period, catl, catm)


#코로나전(상품별,연령별 cgi)
pre_cgi = 
  index_pre %>% 
  group_by(catm, age) %>%
  summarize(pre_cgi = mean(cgi)) %>%
  arrange(age, catm) 

#코로나중(상품별,연령별 cgi)
ing_cgi =
  index_ing %>% 
  group_by(catm, age) %>%
  summarize(ing_cgi = mean(cgi)) %>%
  arrange(age, catm)

#코로나후(상품별,연령별 cgi)
post_cgi = 
  index_post %>% 
  group_by(catm, age) %>%
  summarize(post_cgi = mean(cgi)) %>%
  arrange(age, catm)

#코로나 전중후(상품별,연령별 cgi)
all_cgi = cbind(pre_cgi, ing_cgi[,3], post_cgi[,3])

##################################
library(gridExtra)

#탐색적 데이터분석 EDA

cgi_scatter1 = ggplot(all_cgi, aes(pre_cgi, ing_cgi)) #전~중
cgi_scatter2 = ggplot(all_cgi, aes(ing_cgi, post_cgi)) #중~후

#변화없이 일정하다면 빨간색 선을 따라가야함

#그렇지 못한모습
P1 = cgi_scatter1 + 
  geom_point() +
  geom_smooth(formula = y~x, method = 'lm') +
  geom_abline(slope=1, intercept=0, size =1, color = 'red') +
  theme(plot.title = element_text(face = "bold", size =20),
        text = element_text(face = "bold", size =15)) +
  ggtitle("Pre COVID19 ~ Ing COVID19")+ 
  labs(x = 'Pre COVID19의 품목별 cgi', y = 'Ing COVID19의 품목별 cgi') 

#그럭저럭 괜찮은 모습
P2 = cgi_scatter2 + 
  geom_point() +
  geom_smooth(formula = y~x, method = 'lm') +
  geom_abline(slope=1, intercept=0, size =1, color = 'red') +
  theme(plot.title = element_text(face = "bold", size =20),
        text = element_text(face = "bold", size =15)) +
  ggtitle("Ing COVID19 ~ Post COVID19")+ 
  labs(x = 'Ing COVID19의 품목별 cgi', y = 'Post COVID19의 품목별 cgi')

grid.arrange(P1,P2, layout_matrix = rbind(c(1,2)))

##################################