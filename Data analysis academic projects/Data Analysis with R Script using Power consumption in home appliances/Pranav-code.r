setwd("C:/Users/AV KALI PRANAV/Desktop/SIT718_Assessment-Task_3-T1_2019-data and script")
the.data <- as.matrix(read.table("Energy19.txt "))
my.data <- the.data[sample(1:671,300),c(1:6)]
plot.default(my.data[,1],my.data[,6],xlab="temperature in kitchen in clecius",ylab="energy use of appliances in whatt",col="orange")
plot.default(my.data[,2],my.data[,6],xlab="Humidity in kitchen area given as a percentage",ylab="energy use of appliances in whatt",col="blue")
plot.default(my.data[,3],my.data[,6],xlab="Temperature outside (from weather station) in Celsius",ylab="energy use of appliances in whatt",col="red")
plot.default(my.data[,4],my.data[,6],xlab="Humidity outside (from weather station) given as a percentage ",ylab="energy use of appliances in whatt",col="green")
plot.default(my.data[,5],my.data[,6],xlab="Visibility (from weather station) in km",ylab="energy use of appliances in whatt",col="yellow")
hist.default(my.data[,1], col="green",main="Temperature in kitchen area, in Celsius")
hist.default(my.data[,2], col="green",main="Humidity in kitchen area, given as a percentage")
hist.default(my.data[,3], col="green",main="Temperature outside (from weather station), in Celsius")
hist.default(my.data[,4], col="green",main="Humidity outside (from weather station), given as a percentage")
hist.default(my.data[,5], col="green",main="Visibility (from weather station), in km")
hist.default(my.data[,6], col="green",main="Energy use of appliances, in Wh")


X1trnf=(my.data[,1]-min(my.data[,1]))/(max(my.data[,1])-min(my.data[,1]))
X1trnfnew=X1trnf^0.8
X3trnf=(my.data[,3]-min(my.data[,3]))/(max(my.data[,3])-min(my.data[,3]))
X3trnfnew=X3trnf^0.5 
X4trnf=(my.data[,4]-min(my.data[,4]))/(max(my.data[,4])-min(my.data[,4])) 
X5trnf=(my.data[,5]-min(my.data[,5]))/(max(my.data[,5])-min(my.data[,5]))
X5trnfnew=X5trnf^0.6
x6trnf=(my.data[,6]-min(my.data[,3]))/(max(my.data[,3])-min(my.data[,3]))
x6trnfnew=x6trnf^0.4
vector1<-c(X1trnfnew,X3trnfnew,X4trnf,X5trnfnew,x6trnfnew)
result<-array(c(vector1))
cbind(X1trnf,X3trnf,X4trnf,X5trnf,x6trnf)
transformations.data=cbind(X1trnf,X3trnf,X4trnf,X5trnf,x6trnf)
write.table(transformations.data,"pranav-tranformed.txt")

install.packages("lpSolve")
source("AggWaFit718.R")
fit.QAM(transformations,"OUPUTOFWAM1.txt","STATOFWAM1.txt")
fit.QAM(transformations,"OUTPUTWAM1.txt","STATOFWAM1.txt",g=PM05,g.inv = invPM05)
fit.QAM(transformations,"OUTPUTWAM2.txt","STATOFWAM2.txt",g=QM,g.inv = invQM)
fit.choquet(transformations,"OUTPUTOFWAM3.txt","STATOFWAM3.txt")
fit.OWA(transformations,"OUTPUTOFWAM4.txt","STATOFWAM4.txt")


input.data<-c(18,4,74.8,31.4)
input.data[1]<-(input.data[1]-min(my.data[,1]))/(max(my.data)-min(my.data))
input.datanew1<-input.data[1]^0.5
input.data[3]<-(input.data[3]-min(my.data[,3]))/(max(my.data)-min(my.data))
input.datanew1<-input.data[1]^0.6
input.data[4]<-(input.data[4]-min(my.data[,4]))/(max(my.data)-min(my.data))
input.datanew1<-input.data[1]^0.6
input.data[5]<-(input.data[5]-min(my.data[,5]))/(max(my.data)-min(my.data))
input.datanew1<-input.data[1]^0.5


