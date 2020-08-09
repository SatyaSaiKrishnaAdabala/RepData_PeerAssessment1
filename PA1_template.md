R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax
for authoring HTML, PDF, and MS Word documents. For more details on
using R Markdown see
<a href="http://rmarkdown.rstudio.com" class="uri">http://rmarkdown.rstudio.com</a>.

When you click the **Knit** button a document will be generated that
includes both content as well as the output of any embedded R code
chunks within the document. You can embed an R code chunk like this:

``` r
knitr::opts_chunk$set(echo = TRUE)
# code for filtering NA`s and ploting the histogram
t$date <- as.Date(t$date)
#class(t$date)
t2 <- subset(t,t$steps!= 'NA')
#summary(t2)
y <- unique(t2$date)
x<- data.frame(date =y[1], steps =0)
#sum(t2$steps[t2$date ==y[1]])

for (i in 1: length(y))
{
  
  x1 <- data.frame(date <- unique(t2$date[t2$date == y[i]]),
  steps <- sum(t2$steps[t2$date == y[i]]))
  names(x1) <- c("date","steps")
  x<- rbind(x,x1)
  
}
x <- x[2:nrow(x),]
plot(x$date,x$steps,xlab="Dates",ylab="frequency",type = "h",lwd=4,main="Histogram of steps vs each date")
```

![](PA1_template_files/figure-markdown_github/code-1.png)

``` r
knitr::opts_chunk$set(echo = TRUE)
mean(x$steps)
```

    ## [1] 10766.19

``` r
median(x$steps)
```

    ## [1] 10765

``` r
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

plot(y2$interval,y2$average_steps,type="l",xlab="Time Seriesinterval of 5 minutes", ylab= "Average Steps",main="Average steps per interval")
```

![](PA1_template_files/figure-markdown_github/code%20to%20find%20mean%20and%20median%20for%20a%20day%20and%20average%20steps%20per%20interval-1.png)

``` r
#max(y2$average_steps)
y2$interval[y2$average_steps ==max(y2$average_steps)]
```

    ## [1] 835

``` r
knitr::opts_chunk$set(echo = TRUE)
c <- which(is.na(t$steps))
length(c)
```

    ## [1] 2304

``` r
t$steps[is.na(t$steps) == TRUE] <- y2$average_steps[y2$interval == 5]
```

``` r
knitr::opts_chunk$set(echo = TRUE)
# including NA`s 
## Histogram to show number of steps per day`
y <- unique(t$date)
x<- data.frame(date =y[1], steps =0)
#sum(t$steps[t$date ==y[1]])

for (i in 1: length(y))
{
  
  x1 <- data.frame(date <- unique(t$date[t$date == y[i]]),
                   steps <- sum(t$steps[t$date == y[i]]))
  names(x1) <- c("date","steps")
  x<- rbind(x,x1)
  
}
#x
#names(x1)
x <- x[2:nrow(x),]
x$steps <- ceiling(x$steps)
#x$steps
plot(x$date,x$steps,main="Histogram of steps vs each date",xlab="Dates",ylab="frequency",type = "h",lwd=4)
```

![](PA1_template_files/figure-markdown_github/code%20to%20plot%20histogram%20after%20imputing%20the%20NA%60s%20for%20number%20of%20steps%20per%20day%20and%20to%20calculate%20meand%20and%20median-1.png)

``` r
mean(x$steps)
```

    ## [1] 9367.082

``` r
median(x$steps)
```

    ## [1] 10395

``` r
knitr::opts_chunk$set(echo = TRUE)
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
```

![](PA1_template_files/figure-markdown_github/code%20for%20calculating%20the%20time%20series%20with%20average%20steps%20for%20weekdays%20and%20weekends-1.png)
