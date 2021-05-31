datacar=read.csv("car.data",stringsAsFactors = TRUE)
View(datacar)
summary(datacar)
#examine the class distribution
table(datacar$acceptability)
#training and test
datacar=datacar[order(runif(1728)),]
datacar_train=datacar[1:1200,]
datacar_test=datacar[1201:1728,]
#model
library(C50)
model=C5.0(acceptability~.,data=datacar)
summary(model)
plot(model)
#compare the predicted and actual
predictions=predict(model,datacar_test)
library(gmodels)
CrossTable(predictions,datacar_test$acceptability,prop.chisq = FALSE,
           prop.c=FALSE,prop.r = FALSE,
           dnn=c('predicted','actual'))

