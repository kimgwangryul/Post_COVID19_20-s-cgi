####################패키지, 라이브러리####################
#install.packages("ggplot2")
library(ggplot2)
##########################################################


################데이터 불러오기 및 전처리#################

Time = read.csv("C:\\Users\\GWANGRYUL\\Desktop\\COVID19_DATA\\Time.csv")
Time$date = as.Date(Time$date)
str(Time)

#confirm(확진자수)칼럼을 누적도수 아닌 일별 도수로 바꾸기
confirmed = Time$confirmed
confirmed_new = rep(0,length(confirmed))
confirmed_new[1] = confirmed[1]
for (i in 2:length(confirmed)) {
  confirmed_new[i] = confirmed[i] - confirmed[i-1] 
}
confirmed_new
Time$confirmed_new = confirmed_new

#코로나 확진자수 최고치인 날, 확진자수 찾기
max_person = max(confirmed_new)
max_date = Time$date[which.max(Time$confirmed_new)]
max_person
max_date

#코로나중 기간
Time$date[36]
Time$date[52]
confirmed_new[36]
confirmed_new[52]
##########################################################


######################그래프그리기########################

ggplot(Time, aes(x = date, y = confirmed_new)) + 
  geom_line(color='black', size = 1) +
  geom_line(mapping = aes(x = date[36]), color = 'red', size = 1) +
  geom_line(mapping = aes(x = date[52]), color = 'red', size = 1) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size =20),
        text = element_text(face = "bold", size =15)) +
  ggtitle("COVID-19 일별 확진자수") +  xlab("월") + ylab("확진자수(명)") + 
  geom_point(mapping = aes(x = max_date, y = max_person ), color="red", size =3) + 
  annotate("text", x= max_date, y=max_person , label="2020-02-29(813명)", color = "black",hjust = -0.1) +
  annotate("text", x= Time$date[1], y=400 , label="Pre COVID19", color = "black",hjust = 0.1) +
  annotate("text", x= Time$date[80], y=400 , label="Post COVID19", color = "black",hjust = 0.2) +
  annotate("text", x= Time$date[37], y=-30 , label="2020-02-24", color = "black",hjust = 0.8) +
  annotate("text", x= Time$date[46], y=-30 , label="2020-03-11", color = "black", hjust = 0)

#기간의 이유 policy데이터 이용
#감염병위기경보단계 "심각"으로 격상 2020-02-23 한 다음날부터#
#코로나 확진자 200명 이상이 유지되는 시기
##########################################################
