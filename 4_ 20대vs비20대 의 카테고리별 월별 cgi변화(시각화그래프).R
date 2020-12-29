
####################시각화#####################

#20대 vs 비 20대 의 품목별 시간순서 cgi변화

#################RGB##########################
#install.packages("RColorBrewer")
library(RColorBrewer)
#############################################

#20대 전체 cgi
ggplot(date_catm_cgi_all_20_matrix, aes(x = rownames(date_catm_cgi_all_20_matrix), y = 가공식품))+
  geom_line(aes(group=1),color="#93DAFF", size = 1) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size =20),
        text = element_text(face = "bold", size =15)) +
  ggtitle("20대 월별 전체 cgi") +  xlab("년/월") + ylab("cgi")+
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 건강관리용품, group=1),
            color="#00A5FF", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 기호식품, group=1),
            color="#0000FF", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 담배, group=1),
            color="#3DFF92", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = `바디/헤어용품`, group=1),
            color="#80E12A", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 뷰티소품, group=1),
            color="#52E4DC", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 빙과류, group=1),
            color="#FFB6C1", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 빵류, group=1),
            color="#FF82FF", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 생활용품, group=1),
            color="#CD1039", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 신선식품, group=1),
            color="#FFDC3C", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 애완동물용품, group=1),
            color="#FF8200", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 유제품류, group=1),
            color="#FFB182", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 음료, group=1),
            color="#957745", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 제과류, group=1),
            color="#9E5A5A", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 주류, group=1),
            color="#9400D3", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = 화장품, group=1),
            color="#828282", size = 1) +
  geom_vline(mapping = aes(xintercept = "202002"), color = 'red', size = 1) +
  geom_vline(mapping = aes(xintercept = "202003"), color = 'red', size = 1) +
  geom_vline(mapping = aes(xintercept = "201902"), color = 'black', size = 0.5) +
  geom_vline(mapping = aes(xintercept = "201903"), color = 'black', size = 0.5) +
  annotate("text", x= 8, y=100 , label="Pre COVID19", color = "black", size = 5) +
  annotate("text", x= 16, y=100 , label="Post COVID19", color = "black", size = 5)


#비20대 전체 cgi
ggplot(date_catm_cgi_all_3060_matrix, aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 가공식품))+
  geom_line(aes(group=1),color="#93DAFF", size = 1) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size =20),
        text = element_text(face = "bold", size =15)) +
  ggtitle("비20대 월별 전체 cgi") +  xlab("년/월") + ylab("cgi")+
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 건강관리용품, group=1),
            color="#00A5FF", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 기호식품, group=1),
            color="#0000FF", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 담배, group=1),
            color="#3DFF92", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = `바디/헤어용품`, group=1),
            color="#80E12A", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 뷰티소품, group=1),
            color="#52E4DC", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 빙과류, group=1),
            color="#FFB6C1", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 빵류, group=1),
            color="#FF82FF", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 생활용품, group=1),
            color="#CD1039", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 신선식품, group=1),
            color="#FFDC3C", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 애완동물용품, group=1),
            color="#FF8200", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 유제품류, group=1),
            color="#FFB182", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 음료, group=1),
            color="#957745", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 제과류, group=1),
            color="#9E5A5A", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 주류, group=1),
            color="#9400D3", size = 1) +
  geom_line(aes(x = rownames(date_catm_cgi_all_3060_matrix), y = 화장품, group=1),
            color="#828282", size = 1) +
  geom_vline(mapping = aes(xintercept = "202002"), color = 'red', size = 1) +
  geom_vline(mapping = aes(xintercept = "202003"), color = 'red', size = 1) +
  geom_vline(mapping = aes(xintercept = "201902"), color = 'black', size = 0.5) +
  geom_vline(mapping = aes(xintercept = "201903"), color = 'black', size = 0.5) +
  annotate("text", x= 8, y=100 , label="Pre COVID19", color = "black", size = 5) +
  annotate("text", x= 16, y=100 , label="Post COVID19", color = "black", size = 5)


###############################################


####################시각화#####################
#위에서 언급된 특별한 품목들의 20대vs비20대의 시간순서 cgi변화(특정품목만 보고싶을때)
#예시)가공식품, 건강관리용품
ggplot(date_catm_cgi_all_20_matrix, aes(x = rownames(date_catm_cgi_all_20_matrix), y = 가공식품))+
  geom_point()+
  geom_line(aes(group=1),color='blue', size = 1) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size =20),
        text = element_text(face = "bold", size =15)) +
  ggtitle("20대vs비20대 월별-가공식품 cgi") +  xlab("년/월") + ylab("cgi(가공식품)")+
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = date_catm_cgi_all_3060_matrix$가공식품, group=1),
            color='green', size = 1) +
  geom_vline(mapping = aes(xintercept = "202002"), color = 'red', size = 1) +
  geom_vline(mapping = aes(xintercept = "202003"), color = 'red', size = 1) +
  geom_vline(mapping = aes(xintercept = "201902"), color = 'black', size = 0.5) +
  geom_vline(mapping = aes(xintercept = "201903"), color = 'black', size = 0.5) +
  annotate("text", x= 8, y=100 , label="Pre COVID19", color = "black") +
  annotate("text", x= 16, y=100 , label="Post COVID19", color = "black")


ggplot(date_catm_cgi_all_20_matrix, aes(x = rownames(date_catm_cgi_all_20_matrix), y = 건강관리용품))+
  geom_point()+
  geom_line(aes(group=1),color='blue', size = 1) +
  theme(plot.title = element_text(face = "bold", hjust = 0.5, size =20),
        text = element_text(face = "bold", size =15)) +
  ggtitle("20대vs비20대 월별-건강관리용품 cgi") +  xlab("년/월") + ylab("cgi(건강관리용품)")+
  geom_line(aes(x = rownames(date_catm_cgi_all_20_matrix), y = date_catm_cgi_all_3060_matrix$건강관리용품, group=1),
            color='green', size = 1) +
  geom_vline(mapping = aes(xintercept = "202002"), color = 'red', size = 1) +
  geom_vline(mapping = aes(xintercept = "202003"), color = 'red', size = 1) +
  geom_vline(mapping = aes(xintercept = "201902"), color = 'black', size = 0.5) +
  geom_vline(mapping = aes(xintercept = "201903"), color = 'black', size = 0.5) +
  annotate("text", x= 8, y=100 , label="Pre COVID19", color = "black") +
  annotate("text", x= 16, y=100 , label="Post COVID19", color = "black")

###############################################