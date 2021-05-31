data=read.csv("caesarian.csv.arff",header=FALSE,sep=",")
#give name
names(data)=c("Age","Delivery number","Delivery time","Blood of Pressure","Heart Problem","Caesarian")
str(data)
#change caesarian variables name, it will see clearly whether Caesarian
data$Caesarian=factor(data$Caesarian,levels = c("1","0"),labels=c("Yes","No"))
View(data)
summary(data)
table(data$Caesarian)
#training and testing(in total has 80 data,traning data:60,testing data:20)
data=data[order(runif(80)),]
data_train=data[1:60,]
data_test=data[61:80,]
#build model
library(C50)
model=C5.0(Caesarian~.,data=data)
summary(model)
plot(model)
#predictions(comparing with actual and predicted)
predictions=predict(model,data_test)
library(gmodels)
CrossTable(predictions,data_test$Caesarian,prop.chisq = FALSE,
           prop.c=FALSE,prop.r = FALSE,
           dnn=c('predicted','actual'))
