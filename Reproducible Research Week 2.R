library("ggplot2")
setwd("C:/Users/admin/Downloads/repdata_data_activity")
getwd()
t <-read.csv("C:/Users/admin/Downloads/repdata_data_activity/activity.csv",header = T)
t$date <- as.Date(t$date)
class(t$date)
t2 <- subset(t,t$steps!= 'NA')
summary(t2)

y <- unique(t2$date)
x<- data.frame(date =y[1], steps =0)
sum(t2$steps[t2$date ==y[1]])

for (i in 1: length(y))
{
  
  x1 <- data.frame(date <- unique(t2$date[t2$date == y[i]]),
  steps <- sum(t2$steps[t2$date == y[i]]))
  names(x1) <- c("date","steps")
  x<- rbind(x,x1)
  
}
x
names(x1)
x <- x[2:nrow(x),]
plot(x$date,x$steps,main="test",xlab="Dates",ylab="frequency",type = "h",lwd=4)
y1 <-data.frame(date =y[1], mean_steps =0,median_steps=0)
for (i in 1: length(y))
{
  
  x1 <- data.frame(date <- unique(t2$date[t2$date == y[i]]),
                   mean_steps <- mean(t2$steps[t2$date == y[i]]),
                   median_steps <- median(t2$steps[t2$date == y[i]]))
  names(x1) <- c("date","mean_steps","median_steps")
  y1<- rbind(y1,x1)
  
}
y1 <- y1[2:nrow(y1),]
y1
head(t2,6)

z <- unique(t2$interval)
y2 <- data.frame(interval=0,average_steps=0)
for (i in 1: length(z))
{
  
  x1 <- data.frame(interval <- unique(t2$interval[t2$interval == z[i]]),
                   average_steps <- mean(t2$steps[t2$interval == z[i]]))
  
  names(x1) <- c("interval","average_steps")
  y2<- rbind(y2,x1)
  
}

y2 <- y2[2:nrow(y2),]

plot(y2$interval,y2$average_steps,type="l",xlab="Time Seriesinterval of 5 minutes", ylab= "Average Steps")
max(y2$average_steps)
y2$interval[y2$average_steps ==max(y2$average_steps)]
c <- which(is.na(t$steps))
length(c)
t$steps[is.na(t$steps) == TRUE] <- y2$average_steps[y2$interval == 5]
# including NA`s 
## Histogram to show number of steps per day`
y <- unique(t$date)
x<- data.frame(date =y[1], steps =0)
sum(t$steps[t$date ==y[1]])

for (i in 1: length(y))
{
  
  x1 <- data.frame(date <- unique(t$date[t$date == y[i]]),
                   steps <- sum(t$steps[t$date == y[i]]))
  names(x1) <- c("date","steps")
  x<- rbind(x,x1)
  
}
x
names(x1)
x <- x[2:nrow(x),]
x$steps <- ceiling(x$steps)
x$steps
plot(x$date,x$steps,main="test",xlab="Dates",ylab="frequency",type = "h",lwd=4)

y3 <-data.frame(date =y[1], mean_steps =0,median_steps=0)
for (i in 1: length(y))
{
  
  x1 <- data.frame(date <- unique(t$date[t$date == y[i]]),
                   mean_steps <- mean(t$steps[t$date == y[i]]),
                   median_steps <- median(t$steps[t$date == y[i]]))
  names(x1) <- c("date","mean_steps","median_steps")
  y3<- rbind(y3,x1)
  
}
y3 <- y3[2:nrow(y3),]

t3 <- subset(t,weekdays(t$date) == c("Sunday","Saturday"))
t4 <- subset(t,weekdays(t$date) != c("Sunday","Saturday"))

# Weekdays Intervals

z <- unique(t4$interval)
y2 <- data.frame(interval=0,average_steps=0)
for (i in 1: length(z))
{
  
  x1 <- data.frame(interval <- unique(t4$interval[t4$interval == z[i]]),
                   average_steps <- mean(t4$steps[t4$interval == z[i]]))
  
  names(x1) <- c("interval","average_steps")
  y2<- rbind(y2,x1)
  
}

y2 <- y2[2:nrow(y2),]

z <- unique(t3$interval)
y4 <- data.frame(interval=0,average_steps=0)
for (i in 1: length(z))
{
  
  x1 <- data.frame(interval <- unique(t3$interval[t3$interval == z[i]]),
                   average_steps <- mean(t3$steps[t3$interval == z[i]]))
  
  names(x1) <- c("interval","average_steps")
  y4<- rbind(y4,x1)
  
}

y4 <- y4[2:nrow(y4),]

par(mfrow=c(2,1),mar =c(4,4,2,1))

plot(y4$interval,y4$average_steps,type="l",xlab="Time Series interval of 5 minutes", ylab= "Average Steps Weekends",main="Weekends")

plot(y2$interval,y2$average_steps,type="l",xlab="Time Series interval of 5 minutes", ylab= "Average Steps Weekdays",main ="Weekdays")




