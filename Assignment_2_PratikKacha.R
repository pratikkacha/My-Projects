##Task 1
num<-as.integer(readline(prompt="Enter a number: "))
if((num %% 2) == 0) {
  print(paste(num,"is Even"))
} else {
  print(paste(num,"is Odd"))
}
##Task 2
num1<- as.integer(readline("Enter the first number: "))
num2<- as.integer(readline("Enter the second number: "))
if(num1 >= num2) {
  print(num1, "is greater")
} else {
  print(num2, "is greater")
}
##Task 3
num<-c(1500:2700)

for (i in num){
  if(i%%5==0 | i%%7==0)
    print(i)
}
##Task 4
vector<-c(3,5,10,20,19,4)
sum=0
for (i in Vector){
  sum<-sum+i
}
print(sum)
##Task 5
library("dplyr")
#a)
titanic<- read.csv(url("http://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv"))
titanic
#b)
Class.3<-select(titanic, Pclass>=3, Fare)
Class.3
#c)
Class.2<-select(titanic, Pclass>=2, Fare)
Class.2
#d)
Class.1<-select(titanic, Pclass>=1, Fare)
Class.1
#e)
Avg<-select(Class.1,Class.2,Class.3, Fare)
Avg1<-mean(Avg)
##Task 6
i<-1
while (i<=10){
  print(i)
  i<-i+1
}
