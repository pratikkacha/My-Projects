#Task 1
showEmployee<-function(name,salary){
  paste("Employee",name,"salary is:", salary)
}

showEmployee("Ben", 9000)
showEmployee("John", 10000)

#Task 2
max_num_in_vec<-function(vec){
  num=vec[1]
  for(i in vec){
    if(i>num){
      
    }
  }
  return(max)
}


#Task 3
vec<-c(8, 2, 3, -1, 7)

multiply<-function(vec){
  total=1
  for(i in vec){
    total=total*i
  }
  return(total)
}

#Task 4
num = as.integer(readline(prompt="Enter a number: "))
flag = 0
if(num > 1) {
  flag = 1
  for(i in 2:(num-1)) {
    if ((num %% i) == 0) {
      flag = 0
      break
    }
  }
} 
if(num == 2)    flag = 1
if(flag == 1) {
  print(paste(num,"is a prime number"))
} else {
  print(paste(num,"is not a prime number"))
}
#Task 5
data1<-read.csv(file.choose(), header=TRUE)
## Load the dataset in R as a DataFrame
## Use the following code to make some small modifications to the data types:
for ( i in 1:ncol(house_prices)){
  if (class(house_prices[,i]) == character){
    house_prices[,i] <- as.factor(house_prices[,i])
  }else if (class(house_prices[,i]) == integer){
    house_prices[,i] <- as.numeric(house_prices[,i])
  }
}
##a)
library(dplyr)
#(A) LotArea
data(data1)
hist(data1$LotArea)
#(B) Lot Shape
barplot(height = data1$LotArea ,names.arg = data1$LotShape, 
        xlab="LotShape", ylab="Lot Area",
        col="blue",main="bar chart")
#(C) LandContour
barplot(height = data1$SalePrice ,names.arg = data1$LandContour, 
        xlab="LandContour", ylab="SalesPrice",
        col="blue",main="bar chart")
#(D) Utilities
barplot(height = data1$LotArea ,names.arg = data1$Utilities, 
        xlab="Utilities", ylab="LotArea",
        col="blue",main="bar chart")
#(E) BldgType
barplot(height = data1$LotArea ,names.arg = data1$BldgType, 
        xlab="BldgType", ylab="LotArea",
        col="blue",main="bar chart")
#(F) SaleCondition
barplot(height = data1$SalePrice ,names.arg = data1$SaleCondition, 
        xlab="SalesCondition", ylab="SalesPrice",
        col="blue",main="bar chart")
#(H) YearRemodAdd
hist(data1$YearRemodAdd)
#(I) SalePrice
hist(data1$SalePrice)

##b)
#(A) Plot SaleCondition using a bar plot and color the bars by BldgType
barplot(height = data1$SalePrice ,names.arg = data1$SaleCondition, 
        xlab="SalesCondition", ylab="SalesPrice",
        col="BldgType",main="bar chart")
#(B) Plot Neighborhood using a bar plot and color the bars by HouseStype
barplot(height = data1$SalePrice ,names.arg = data1$Neighborhood, 
        xlab="Neighborhood", ylab="SalesPrice",
        col="HouseStype",main="bar chart")