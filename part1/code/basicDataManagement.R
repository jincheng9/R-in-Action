mydata <- data.frame(x1 = c(2, 2, 6, 4),
                     x2 = c(3, 4, 2, 8))
# sumx and meanx are both a vector
sumx <- mydata$x1 + mydata$x2
meanx <- (mydata$x1 + mydata$x2)/2

# add variables to the data frame mydata
# gernerally we have three methods

# method 1
#mydata$sumx <-  mydata$x1 + mydata$x2
#mydata$meanx <- (mydata$x1 + mydata$x2)/2

# method 2
#attach(mydata)
#mydata$sumx <-  x1 + x2
#mydata$meanx <- (x1 + x2)/2
#detach(mydata)

# method 3
mydata <- transform(mydata, sumx = x1 + x2, meanx = (x1+x2)/2)

# recoding variables
# method 1
#mydata$age[mydata$x1==2] <- 1
#mydata$tmp <- mydata$x1 * mydata$x2

# method 2
mydata <- within(mydata, {
  age <- NA
  age[x1==2] <- 1
  tmp <- x1*x2
})

# rename
names(mydata)[6] <- 'tmp2'

# missing values
newdata <- na.omit(mydata)