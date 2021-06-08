library(mlbench)
library(MLmetrics)
library(dplyr)
library(tidyverse)
library(caret)
library(e1071)

#Task 1
##Sub-task 1
data<-read.csv(file.choose(), header=TRUE)
sum(is.na(data))
data<-drop_na(data)
data$Work.load.Average.day<-as.factor(data$Work.load.Average.day)
data$Absenteeism.time.in.hours<-as.factor(data$Absenteeism.time.in.hours)

set.seed(123)
indexes<-sample(1:nrow(data), size = 0.2*nrow(data))
Testingset<-data[indexes,]
Trainingset<-data[-indexes,]
##Sub-task 2
Model<-lm(Absenteeism.time.in.hours~.,data = Trainingset, family = )
summary(Model)
##Sub-task 3
y_pred<-predict(Model, Testingset, type = "response")
print(y_pred)
y_pred<-round(y_pred)
print(y_pred)

#Task 2
##Sub-task 1
data1<-read.csv(file.choose(), header=TRUE)
sum(is.na(data1))
data1<-drop_na(data1)
data1$the.price.of.the.house<-as.factor(data1$the.price.of.the.house)

set.seed(100)
indexes1<-sample(1:nrow(data1), size = 0.2*nrow(data1))
Testingset1<-data1[indexes,]
Trainingset1<-data1[-indexes,]
##Sub-task 2
Model1<-glm(the.price.of.the.house~.,data = Trainingset1, family = "binomial")
summary(Model1)
##Sub-task 3
y_pred1<-predict(Model1, Testingset1, type = "response")
print(y_pred1)
y_pred1<-round(y_pred1)
print(y_pred1)
