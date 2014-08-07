setwd("C:/Users/d2i2k/Documents/GitHub/RepData_PeerAssessment1")
ActivityData <- read.csv("activity.csv", header=TRUE) 
x <- is.na(ActivityData$steps)
x.sub <- subset(x,x="TRUE")
length(x.sub)
y <- ifelse(is.na(ActivityData$steps),0,ActivityData$steps)
z <- data.frame(y,ActivityData$date)
w <- tapply(z$y,INDEX=z$ActivityData.date,FUN=sum,na.rm=TRUE)
hist(w,main="Histogram of Daily Steps",xlab="Daily Number of Steps",ylab="Frequency",)
summary(w)


