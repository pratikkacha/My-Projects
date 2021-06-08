##Task 1
#a)
vecx<-c(1,2,3,4,5,6,7,8,9,10)
vecx
#b)
vecx<-c(vecx,11:15)
vecx
#c)
vecy<-c(vecx)
vecy[vecy>=6]
#d)
min(vecx)
max(vecx)
#e)
vecz<-c(vecx,vecy)
vecz
##Task 2
#a)
vecx<-c(1:15)
vecx
#b)
vecx<-(1:15)
mx<-matrix(vecx,nrow=5,ncol=3)
mx
#c)
class(x)
#d)
my<-matrix(nrow=3,ncol=3)
my
#e)
mx[1:3]<-c(15,21,12)
mx
#f)
my[,2]<-c(43,12,987)
my
#g)
m3[,3]<-c(897,13,NA)
m3
#h)
mz<-rbind(mx,c(my))
mz
##Task 3
#a)
myData<-matrix(nrow=10,ncol=3)
myData
#b)
DF = as.data.frame(t(myData))
DF
#c)
class(myData)
#d)
nrow(myData)
#e)
ncol(myData)
##Task 4
help(readline)
name<-readline("What is your name?:")
age<-as.numeric(readline("That is your current age:"))
Year<-((2021-Age)+100)
print(paste(Name, "will turn 100 in the year",Year))
