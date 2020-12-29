
#MANOVA분석 (연령별 ~ (코로나전, 중 , 후), 윌크스 람다 통계량 이용)
M = manova(cbind(pre_cgi, ing_cgi, post_cgi)~age, data = all_cgi)
summary(M, intercept = T, test = "Wilks")
#연령별 유의미한 차이가 있음

#사후분석(일변량 검정 통계량)
summary.aov(M) 
#코로나 이전의 cgi양에서 차이가 있고
#코로나 중,후 의 cgi양에서 차이가 없음

#연령별 all_cgi 데이터
all_cgi_20 =
  all_cgi %>% 
  filter(age == 20)
all_cgi_30 =
  all_cgi %>% 
  filter(age == 30)
all_cgi_40 =
  all_cgi %>% 
  filter(age == 40)
all_cgi_50 =
  all_cgi %>% 
  filter(age == 50)
all_cgi_60 =
  all_cgi %>% 
  filter(age == 60)
#비 20대
all_cgi_3060 = 
  all_cgi %>% 
  filter(age != 20)

#비 20대 MANOVA분석 (연령별 ~ (코로나전, 중 , 후), 윌크스 람다 통계량 이용)
M = manova(cbind(pre_cgi, ing_cgi, post_cgi)~age, data = all_cgi_3060)
summary(M, intercept = T, test = "Wilks")
#0.3788 유의미한 차이 X -> 즉 20대를 끼고했을 때 유의미한 차이가 있으므로 20대만
#코로나 이전의 소비에서 차이가 있음 
#(인사이트)->20대의 소비cgi의 전중후 패턴변화가 다른세대와 차이가 있음

#t.test를 통해서 다시한번 구체적으로 검증해보자
#연령별 전~중, 중~후 의 cgi 변화(평균값의 차이가 유의미한지, 유의수준5%)
#20대
t.test(all_cgi_20$pre_cgi,all_cgi_20$ing_cgi) #변화X
t.test(all_cgi_20$ing_cgi,all_cgi_20$post_cgi) #변화X
#30대
t.test(all_cgi_30$pre_cgi,all_cgi_30$ing_cgi) #변화o
t.test(all_cgi_30$ing_cgi,all_cgi_30$post_cgi) #변화X
#40대
t.test(all_cgi_40$pre_cgi,all_cgi_40$ing_cgi) #변화O
t.test(all_cgi_40$ing_cgi,all_cgi_40$post_cgi) #변화X
#50대
t.test(all_cgi_50$pre_cgi,all_cgi_50$ing_cgi) #변화O
t.test(all_cgi_50$ing_cgi,all_cgi_50$post_cgi) #변화X
#60대
t.test(all_cgi_60$pre_cgi,all_cgi_60$ing_cgi) #변화O
t.test(all_cgi_60$ing_cgi,all_cgi_60$post_cgi) #변화X

#(인사이트)
#30~60세대는 코로나 전~중으로 즉각적인 cgi의 변화(감소)를 보였지만
#20대는 그러하지 않았다.
#전반적으로 코로나 중~후 에는 cgi의 유의미한 변화가 없었다.
#굳이 얘기하자면 20대의 반응이 늦음(중~후 에서의 유의수준 값이 가장 작음)
#즉, 30~60들은 바로 반응 20대는 천천히 반응


#그렇다면 30~60에서는 가장 크게 변화한 품목은 무엇이고 크게 변화하지 않은 품목은 무엇일까
#20대 에서는 가장 크게 변화한 품목은 무엇이고 크게 변화하지 않은 품목은 무엇일까
#품목의 차이를 비교해보자

#그러고나서 변한품목(기호품)과 변하지 않은 품목(필수품) 을 구분하는 분석방법을 써보자
#그게 무엇일까 (군집분석사용)