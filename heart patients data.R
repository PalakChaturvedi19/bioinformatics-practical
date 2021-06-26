data_1 = read.csv(file.choose(), header = TRUE)
data

# line graph
x = data_1[1:15,"chol"]
plot(x,type = "b",col = "red",xlab = "row no",ylab = "chol",main = "heart details of cholestral")

# pie chart
y = data_1[1:20,"oldpeak"]
labels = data_1[1:21,"oldpeak"]
pie(y,labels, main = "oldpeak in heart desease", col = "rainbow"(length(x)))

# bar plot
a = data_1[1:20,"chol"]
b = data_1[1:20,"cp"]
barplot(a,names.arg=b,xlab="cp",ylab="chol",main="age and cp data")

# scatter plot
c = data_1[1:300,c("trestbps","thalach")]
c
plot(x=data_1$trestbps,y=data_1$thalach,xlab = "thalach",ylab = "trestbps",
     main = "trestbps and thalach")

# box plot
e = data_1[,c('chol','cp')]
boxplot(chol~cp,data = data_1,xlab="chol",
        ylab = "cp",main = "details of heart patients",col = "purple","green")
# creating pdf
pdf("heart,plot.pdf")
plot(x,type = "b",col = "red",xlab = "row no",ylab = "chol",main = "heart details of cholestral")
pie(y,labels, main = "oldpeak in heart desease", col = "rainbow"(length(x)))
barplot(a,names.arg=b,xlab="cp",ylab="chol",main="age and cp data")
plot(x=data_1$trestbps,y=data_1$thalach,xlab = "thalach",ylab = "trestbps",
     main = "trestbps and thalach")
boxplot(chol~cp,data = data_1,xlab="chol",
        ylab = "cp",main = "details of heart patients",col = "purple","green")
dev.off()
