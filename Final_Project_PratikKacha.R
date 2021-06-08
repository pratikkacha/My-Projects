library(randomForest)
library(caret)
library(rpart)
library(tidyverse)
library(rpart.plot)
library(data.tree)
library(caTools)
library(dplyr)
library(ggplot2)
library(mlbench)
library(MLmetrics)
library(e1071)

#Part 1 load data
data<-read.csv(file.choose(), header=TRUE)

##1) Change the first variable name to “AgeofEmployee”
names(data)[1] <- "AgeofEmployee"

##2) Drop the variables named “EmployeeCount”, “EmployeeNumber”, “Over18” and "StandardHours" from the dataset
data = subset(data, select = -c(EmployeeCount, EmployeeNumber, Over18, StandardHours))

##3) Convert all “character” variables to “factor”
data[sapply(data, is.character)] <- lapply(data[sapply(data, is.character)],
                                             as.factor)
str(data) #to check that all "character" variables are converted to "factor"

##4) Using ggplot2 package, create Barcharts for 5 factor variables of your choice in the dataset.
ggplot(data,aes(x=BusinessTravel))+
  geom_bar(color="green", fill=rgb(0.2,0.5,0.6,0.8) )

ggplot(data, aes(x=MaritalStatus, fill=MaritalStatus )) + 
  geom_bar( ) +
  scale_fill_brewer(palette = "Set1") +
  theme(legend.position="none")

ggplot(data, aes(x=JobRole, fill=JobRole )) + 
  geom_bar( ) +
  scale_fill_brewer(palette = "Set3") +
  theme(legend.position="none")

ggplot(data, aes(x=Gender, fill=Gender )) +  
  geom_bar( ) +
  scale_fill_manual(values = c("pink", "blue") ) +
  theme(legend.position="none")

ggplot(data, aes(x=OverTime, fill=OverTime )) + 
  geom_bar( ) +
  scale_fill_grey(start = 0.25, end = 0.75) +
  theme(legend.position="none")

##5) Get the mean HourlyRate and mean DailyRate for employees who left the company and for employees who didn’t leave the company.

Hourly_Rates <- select(data,HourlyRate,Attrition)
Hourly_Rates
View(Hourly_Rates)

Daily_Rates <- select(data,DailyRate,Attrition)
Daily_Rates
View(Daily_Rates)

# create subset of Hourly_Rates
Hourly_Rate_Left <- subset(Hourly_Rates, Attrition=="1")
Hourly_Rate_Left
# remove attrition column to run calculation
Hourly_Rate_Left <- Hourly_Rate_Left[,-2]
Hourly_Rate_Left
# calculate the mean
Avg_Hourly_Rate_Left <- mean(Hourly_Rate_Left)
Avg_Hourly_Rate_Left # $65.57 for Avg Hourly Rate of Employees who left

# create subset of Hourly_Rates
Hourly_Rate_Stay <- subset(Hourly_Rates, Attrition=="0")
Hourly_Rate_Stay
# remove attrition column to run calculation
Hourly_Rate_Stay <- Hourly_Rate_Stay[,-2]
Hourly_Rate_Stay
# calculate the mean
Avg_Hourly_Rate_Stay <- mean(Hourly_Rate_Stay)
Avg_Hourly_Rate_Stay # $65.95 for Avg Hourly Rate of Employees who stayed

# create subset of Daily_Rates
Daily_Rate_Left <- subset(Daily_Rates, Attrition=="1")
Daily_Rate_Left
# remove attrition column to run calculation
Daily_Rate_Left <- Daily_Rate_Left[,-2]
Daily_Rate_Left
# calculate the mean
Avg_Daily_Rate_Left <- mean(Daily_Rate_Left)
Avg_Daily_Rate_Left # $750.36 for Avg Daily Rate of Employees who left
# create subset of Daily_Rates
Daily_Rate_Stay <- subset(Daily_Rates, Attrition=="0")
Daily_Rate_Stay
# remove attrition column to run calculation
Daily_Rate_Stay <- Daily_Rate_Stay[,-2]
Daily_Rate_Stay
# calculate the mean
Avg_Daily_Rate_Stay <- mean(Daily_Rate_Stay)
Avg_Daily_Rate_Stay # $812.50 for Avg Daily Rate of Employees who stayed

#Part 2
data<-read.csv(file.choose(), header=TRUE)
data = subset(data, select = -c(EmployeeCount, EmployeeNumber, Over18, StandardHours))
data[sapply(data, is.character)] <- lapply(data[sapply(data, is.character)],
                                           as.factor)

##1) Split the dataset into Training and Testing Datasets using a 20/80 split criteria. Here, 20 is the test set and 80 is training set. (Set the seed as 123 before you perform the split)

set.seed(123)
indexes<-sample(1:nrow(data), size=0.2*nrow(data))
test<-data[indexes,]
train<-data[-indexes,]

##2) Train a logistic regression model, a decision tree model and a Random Forest model on the training dataset using Attrition as the dependent Variable and everything else as the independent variables. Save the fitted model as “fit_glm”, “fit_dtree” and “fit_rforest”. (Use default values for hyperparameters)

fit_glm<-glm(Attrition ~ ., data=train, family = "binomial")
fit_dtree<-rpart(Attrition ~ ., data=train)
fit_rforest<-randomForest(Attrition ~ ., data=train)

##3)Using the test data set, predict the dependent variable with Models “fit_glm”, “fit_dtree” and “fit_rforest”.

pred_glm<-predict(fit_glm, test)
pred_dtree<-predict(fit_dtree, test)
pred_rforest<-predict(fit_rforest, test)

##4) Build a Confusion Matrix for each model using the predictions on test dataset using predicted probability of 0.5 as the boundary condition for prediction, where predicted probability >= 0.5 signifies "Yes" or 1 and predicted probability < 0.5 signifies "No" or 1.

cm_glm<-confusionMatrix(pred_glm, test$Attrition)
cm_rforest<-confusionMatrix(pred_rforest, test$Attrition)
cm_dtree<-confusionMatrix(pred_dtree, test$Attrition)

##5) Report the a. Prediction accuracy on the testing dataset, b. Specificity on testing dataset, c. Sensitivity on testing dataset
cm$overall["Accuracy"]
cm$byClass[c("Sensitivity","Specificity", "Prevalence")]

##6) Which model performed best for predictions in your opinion? Which model performed the worst in your opinion?
#Random Forest model performed the best prediction and other two were the worst.

#Part 3
data<-read.csv(file.choose(), header=TRUE)
data[sapply(data, is.integer)] <- lapply(data[sapply(data, is.integer)],
                                             as.numeric)
str(data) #to check that all variables are converted to "numeric"

##1) Split the dataset into Training and Testing Datasets using a 20/80 split criteria. Here, 20 is the test set and 80 is training set. (Set the seed as 123 before you perform the split)

set.seed(123)
indexes<-sample(1:nrow(data), size=0.2*nrow(data))
test<-data[indexes,]
train<-data[-indexes,]

##2) Train a linear regression model on the training data set using “quality” as the dependent Variable and everything else as the independent variables. Save the fitted model as “fit_lm”.
fit_lm<-lm(quality~., data = train)

##3)Please report
pred_lm<-predict(fit_lm, test)
mse_lm<-MSE(pred_lm, test$quality)
print(mse_lm)

###a) RMSE (Root Mean Squared Error) on Testing Dataset
rmse<-sqrt(mse_lm) 
###b) MAPE (Mean Absolute Percent Error) on Testing Dataset
mape<-MAPE(pred_lm, test$quality)
###c) MAE (Mean Absolute Error) on Testing Dataset
mae<-MAE(pred_lm, test$quality)





