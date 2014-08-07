setwd("C:/Users/d2i2k/Documents/GitHub/RepData_PeerAssessment1")
ActivityData <- read.csv("activity.csv", header=TRUE)          # 17,568 row by 3 column array
x <- ifelse(is.na(ActivityData$steps), 0, ActivityData$steps)  # 17,568 row vector
y <- ActivityData$interval                                     # 17,568 row vector

library(chron)
w <- is.weekend(ActivityData$date)                             # 17,568 row vector
xyw <- data.frame(x,y,w)                                       # 17,568 row by 3 column array

xyw1 <- subset(xyw,w=="TRUE")                                  #  4,608 row by 3 column array for weekends
x <- tapply(xyw1$x,INDEX=xyw1$y,FUN=mean,na.rm=TRUE)           #    288 row vector of steps
y <- tapply(xyw1$y,INDEX=xyw1$y,FUN=mean,na.rm=TRUE)           #    288 row vector of intervals
z <- vector(mode = "character",length=288)                     #    288 row vector of weekends
   for (i in 1:288) {z[i] <- "Weekend"}
xy1 <- cbind(as.data.frame(x),as.data.frame(y),as.data.frame(z))    #    288 row by 3 column array for weekends

xyw2 <- subset(xyw,w=="FALSE")                                 #  4,608 row by 3 column array for weekdays
x <- tapply(xyw2$x,INDEX=xyw2$y,FUN=mean,na.rm=TRUE)           #    288 row vector of steps
y <- tapply(xyw2$y,INDEX=xyw2$y,FUN=mean,na.rm=TRUE)           #    288 row vector of intervals
z <- vector(mode = "character",length=288)                     #    288 row vector of weekdays
   for (i in 1:288) {z[i] <- "Weekday"}
xy2 <- cbind(as.data.frame(x),as.data.frame(y),as.data.frame(z))    #    288 row by 3 column array for weekdays

xy <- rbind(xy1,xy2)                                           #    576 row by 3 column array

library(ggplot2)
qplot(y,x,data=xy,facets=z~.,main="Multiple Time Series Plots",geom=c("line"),xlab="Time Interval",ylab="Average Number of Steps")