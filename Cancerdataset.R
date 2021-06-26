library(ggplot2)
?ggplot2

library(corrplot)

library(caTools)

library(dplyr)


cancer = read.csv(choose.files(),header = TRUE)
cancer
head(cancer)
str(cancer)
dim(cancer)
glimpse(cancer)

cancer = cancer[-33]
cancer

# no. of women affected in being and melignant stage
cancer%>%count(diagnosis)

#percentage of women affected in begning and melignant stage
cancer%>%count(diagnosis)%>%group_by(diagnosis)%>%
  summarise(perc_dx = round(n/569*100,2))

# data visualization

# frequency of cancer diagnosis
diagnosis.table= table(cancer$diagnosis)
colors = terrain.colors(2)

# create a pie chart
diagnosis.prop.table = prop.table(diagnosis.table)*100
diagnosis.prop.df = as.data.frame(diagnosis.prop.table)
pietables = sprintf("%s-%3.1f%s",diagnosis.prop.df[,1],
                    diagnosis.prop.table,"%")
pie(diagnosis.prop.table,lables = pietables,clockwise = TRUE,
    col = c("purple","red"),radius = 0.8,cex =1.3,
    main = "frequency of cancer diagnosis",border = "black")
legend(1,0.2,legend = diagnosis.prop.df[,2],
       cex = 0.7,fill = c("purple","red"),
       border = "black")
# correlation plot

c = cor(cancer[,3:25])
corrplot(c,order = "hclust",tl.cex = 0.7)
corrplot(c,method = "square",tl.cex = 0.8)

# compairing the radius of benign and melignant
ggplot(cancer,aes(x = diagnosis,
                  y = radius_mean))+geom_boxplot(fill = "yellow")+ggtitle("radius_mean for benign")

#barplot
ggplot(cancer,aes(x=diagnosis,fill=texture_mean))+
  geom_bar(fill = "pink")+
  ggtitle("people affected with benign and melignant")

#density plot based on texture and mean
ggplot(cancer,aes(x = texture_mean,fill = as.factor(diagnosis)))+geom_density()+ggtitle("texture_mean")

# barplot for area_se
ggplot(cancer,aes(x=diagnosis,fill=area_se))+
  geom_bar(fill = "purple")+
  ggtitle("AREA_SE")

#distrubution of data by histogram
ggplot(cancer,aes(x = concavity_mean,fill = diagnosis)
)+geom_histogram(binwidth=5)+ggtitle("concavity_mean")
ggplot(cancer,aes(x=perimeter_mean))+facet_wrap(~diagnosis)+
  geom_histogram(binwidth=15,col="green",fill="pink")+ggtitle("concavity_mean")
ggplot(cancer,aes(x=radius_mean))+facet_wrap(~diagnosis)+
  geom_histogram(binwidth=1,col="green",fill="pink")+ggtitle("radius_mean")

# creating pdf
pdf("cancer,plots2.pdf")
pietables = sprintf("%s-%3.1f%s",diagnosis.prop.df[,1],
                    diagnosis.prop.table,"%")
pie(diagnosis.prop.table,lables = pietables,clockwise = TRUE,
    col = c("purple","red"),radius = 0.8,cex =1.3,
    main = "frequency of cancer diagnosis",border = "black")
legend(1,0.2,legend = diagnosis.prop.df[,2],
       cex = 0.7,fill = c("purple","red"),
       border = "black")
corrplot(c,order = "hclust",tl.cex = 0.7)
corrplot(c,method = "square",tl.cex = 0.8)
ggplot(cancer,aes(x = diagnosis,
                  y = radius_mean))+geom_boxplot(fill = "yellow")+ggtitle("radius_mean for benign")
ggplot(cancer,aes(x=diagnosis,fill=texture_mean))+
  geom_bar(fill = "pink")+
  ggtitle("people affected with benign and melignant")
ggplot(cancer,aes(x = texture_mean,fill = as.factor(diagnosis)))+geom_density()+ggtitle("texture_mean")


ggplot(cancer,aes(x=diagnosis,fill=area_se))+
  geom_bar(fill = "purple")+
  ggtitle("AREA_SE")

ggplot(cancer,aes(x=perimeter_mean))+facet_wrap(~diagnosis)+
  geom_histogram(binwidth=15,col="green",fill="pink")+ggtitle("concavity_mean")
ggplot(cancer,aes(x=radius_mean))+facet_wrap(~diagnosis)+
  geom_histogram(binwidth=1,col="green",fill="pink")+ggtitle("radius_mean")
dev.off()
