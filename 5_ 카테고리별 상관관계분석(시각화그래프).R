###############################################
##카테고리별 상관관계분석

#install.packages("corrplot")
library(corrplot)

##전체##
new_20 <- date_catm_cgi_all_20_matrix[-1]
cor_20 <- cor(new_20)
corrplot.mixed(cor_20)
new_3060 <- date_catm_cgi_all_3060_matrix[-1]
cor_3060 <- cor(new_3060)
corrplot.mixed(cor_3060)

##변화 비변화 나눠서##
a <- c(4,6,7,9,10,12,14,15,17)
b <- c(2,3,5,8,11,13,16)
c <- c(3,4,6,7,9,10,12,14,15,17)
d <- c(2,5,8,11,13,16)

yes_20 <- date_catm_cgi_all_20_matrix[a]
no_20 <- date_catm_cgi_all_20_matrix[b]
yes_3060 <- date_catm_cgi_all_3060_matrix[c]
no_3060 <- date_catm_cgi_all_3060_matrix[d]
cor_yes_20 <- cor(yes_20)
cor_no_20 <- cor(no_20)
cor_yes_3060 <- cor(yes_3060)
cor_no_3060 <- cor(no_3060)
corrplot.mixed(cor_yes_20)
corrplot.mixed(cor_no_20)
corrplot.mixed(cor_yes_3060)
corrplot.mixed(cor_no_3060)
