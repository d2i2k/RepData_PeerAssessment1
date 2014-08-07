setwd("C:/Users/d2i2k/Documents/GitHub/RepData_PeerAssessment1")
ActivityData <- read.csv("activity.csv", header=TRUE) 
x <- tapply(ActivityData$steps,INDEX=ActivityData$date,FUN=sum,na.rm=TRUE)
y <- subset(x, x>0)
hist(y,main="Histogram of Daily Steps",xlab="Daily Number of Steps",ylab="Frequency")
summary(y)


