Part 1 Getting Started
=======================

Managing the R Workspace
------------------
```R
# help function in R, we can use help() to find doc for functions and objects
help(kmeans) # give the explanation for kmeans clustering
help(pi) # pi is 3.141593
# get the current workspace directory 
getwd()
# set the workspace directory, case sensitive
setwd()
# create a directory 
dir.create(foldername) 
# run R script
source('file.R') 
# use print() to print anything you want to print to the console, for example 
a <- 2
print(a)
# print all commands to console
source('file.R', echo=TRUE)
# print characters and integers
i <- 10
cat(i, "th interation...\n", sep="") # sep="" means that there is no space between the input parameters 
# check the data structure of variables
vec <- c(1:10)
str(vec)
# find the first 6 and last 6 elements
head(vec)
tail(vec)
no <- c(1:3)
grade <- c(89, 95, 100)
data <- data.frame(no, grade)
head(data)
tail(data)
# get the type of variables
a <- c(1, 2)
class(a)
# remove variable in the workspace
x <- c(1,2)
rm(x)
# remove all variables in the workspace
rm(list=ls(all=T))
```
Common Mistakes in R
-----------------------------
1. Using the wrong case--R is case sensitive
2. Forgetting to use quote marks
3. Forgetting to include the parentheses in a function call
4. Using the \ in a pathname on Windows--use / or \\\
5. Using a funciton from a package that's not loaded

Run R Script in Windows CMD Prompt
---------------------------------------
```R
R.exe CMD BATCH filename.R
Rscript.exe filename.R
```
We need to specify the path of R.exe, Rscript.exe and the R file. 

In the Windows CMD prompt,the quote mark is not essential for the exe and R file.
```R
D:\Program Files\R\R-3.0.3\bin>"R.exe" CMD BATCH C:\Users\NDSL3\Dropbox\GitHub\R
-in-Action\part1\code\infant_age_weight.R
D:\Program Files\R\R-3.0.3\bin>Rscript "C:\Users\NDSL3\Dropbox\GitHub\R-in-Acti
n\part1\code\infant_age_weight.R"
[1] 7.06
[1] 2.077498
[1] 0.9075655
```
Data Structure
------------------------------
Vector: only have a single mode of data (numeric, character, logical.) 
```R
a <- c(1, 2, 5, 3, 6, -2, 4)
a[3]  # 5
a[c(1, 3, 5)] # 1 5 6
a[2:6] # 2 5 3 6 -2
b <- replicate(10, 2) # generate a vector with length 10, all elements are 2
b <- rep(2, 10) # generate a vector with length 10, all elements are 2
b <- seq(1,10) # b is 1, 2, 3, 4, 5, 6, 7, 8, 9 10
b <- seq(1, 10, 2) # b is 1, 3, 5, 7, 9
# add a element to vector: method 1
e <- 10
a <- c(a, e)
# add a element to vector: method 2
a <- append(a, e)
# add a element to vector: method 3
a[length(a)+1] <- e
# delete a element of a vector
index <- 2
a <- a[-index] # delete the 2nd element of vector a
index <- c(2, 5)
a <- a[-index] # delete the 2nd and 5th element of vector a
# find the first-matched index of an element
# for example, find 10's index in vector vec <- c(1, 10, 2, 10). 
# match(10, vec) will only return 2, the second index for 10 will not be returned 
vec <- c(2:10)
e <- 3
e2 <- c(3, 5)
index <- match(e, vec)
index2 <- match(e2, vec)
# check if an element is in a vector
e3 <- 1
is_in <- !is.na(match(e3, vec))
is_in <- e3 %in% vec

# the elements in vector c1, but not in vector c2
c1 <- c(1, 2, 3)
c2 <- c(2, 3, 5)
c1[!(c1 %in% c2)] # 1
setdiff(c1, c2) # 1

c2[!(c2 %in% c1)] # 5
setdiff(c2, c1) # 5

# compute how many different numbers in a vector
vec <- c(1, 2, 3, 2)
nlevels(factor(vec)) # return 3
length(unique(vec)) # return 3

# number of characters in a string
x <- 'abc'
num <- nchar(x)

# string-integer conversion
x <- 123
x <- paste(x) # x is '123'
x <- strtoi(x) # x is 123
```
Matrix: two dimensional array
```R
cells <- c(1, 26, 24, 68)
rnames <- c('R1', 'R2')
cnames <- c('C1', 'C2')
# fill in the matrix by row
mymatrix <- matrix(cells, nrow=2, ncol =2, byrow=TRUE,
                   dimnames=list(rnames, cnames))
# fill in the matrix by column, the default is by column
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=FALSE,
                   dimnames=list(rnames, cnames))
#Using matrix subscripts
x <- matrix(1:10, nrow=2)
x[2,]
x[,2]
x[1,4]
x[1,c(4,5)]
```
Array: Similar to matrix, but can have more than two dimensions
```R
dim1 <- c('A1','A2')
dim2 <- c('B1', 'B2', 'B3')
dim3 <- c('C1', 'C2', 'C3', 'C4')
z <- array(1:24, c(2,3,4), dimnames=list(dim1, dim2, dim3))
z[1,2,3]
```
Data Frame: Different columns can have different modes of data (numeric, character, etc.)
```R
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c('Type1', 'Type2', 'Type1','Type1')
status <- c('Poor', 'Improved', 'Excellent', 'Poor')
patientdata <- data.frame(patientID, age, diabetes, status)
x <- nrow(patientdata)
y <- ncol(patientdata)
size <- dim(patientdata) # size is a vector that has the number of rows and columns as its elements
# get the ij-th element of a data.frame
i <- 1
j <- 2
patientdata[i, j]
patientdata[[j]][i]
patientdata[, j][i]
as.datatype(patientdata[i, ][j]) # patientdata[i, ] is  the ith row, a sub data frame of patientdata
patientdata$age[i]
patientdata[i, 'age']  # the ith row at 'age' column

patientdata[1:2] # first 2 columns
patientdata[c('diabetes', 'status')]
patientdata$age
table(patientdata$diabetes, patientdata$status)
# add a column to data.frame: method 1
patientdata$new_col <- c(2:5)
# add a column to data.frame: method 2
patientdata <- transform(patientdata, new_col=c(2:5))
# add a row to data.frame
new_row <- data.frame(patientID=5, age=10, diabetes='Type3', status='Good')
patientdata <- rbind(patientdata, new_row)
# delete a column of data.frame: method 1
patientdata$new_col <- NULL
# delete a column of data.frame: method 2
patientdata <- transform(patientdata, new_col=NULL)
# delete a specific row of a data.frame
index <- 2
patientdata <- patientdata[-index, ]
# 
# attach, detach, and with 
# attach, detach will be bad when more than one object have the same name, use "with"
summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)
attach(mtcars) # add the data frame mtcars to the R search path
summary(mpg)
  plot(mpg, disp)
  plot(mpg, wt)
detach(mtcars) # remove the data frame from the search path
```
Factor: Categorical (nominal) and Categorical ordered (ordinal) variables
```R
# map categorical values as a vector of integers [1...k]
diabetes <- c('Type1', 'Type2', 'Type1', 'Type1')
diabetes <- factor(diabetes) # Type1-1 Type2-2
status <- c('Poor', 'Improved', 'Excellent', 'Poor') 
status <- factor(status, ordered=TRUE) # Excellent-1 Improved-2 Poor-3
status2 <- factor(status, ordered=TRUE, levels=c('Poor', 'Improved', 'Excellent')) # Excellent-3 Improved-2 Poor-1

# an example to show the factors
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", 'Type1', 'Type1')
status <- c('Poor', 'Improved', 'Excellent', 'Poor')
diabetes <- factor(diabetes)
status <- factor(status, ordered=TRUE)
patientdata <- data.frame(patientID, age, diabetes, status)
str(patientdata)
summary(patientdata)
```
List: ordered collections of objects
```R
g <- 'My First List'
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow=5)
k <- c('one', 'two', 'three')
mylist <- list(title=g, ages=h, j, k)
mylist
mylist[[2]]
mylist[['ages']]
mylist[[2]][1] # 25, the first element of the second element in list
```
A note for programmers
-----------------------------
1. The period(.) has no special significance in object names. But the 
dollar sign($) has a somewhat analogous meaning, identifying the parts of an object.
For example, A$x refers to variable x in data frame A
2. R doesn't provide multiline or block comments. You must start each line of a 
multiline comment with #.
3. Assigning a value to a nonexistent element of a vector, matrix, array, or list 
will expand that structure to accommodate the new value. For example, consider the following:
```R
> x <- c(8, 6, 4)
> x[7] <- 10
> x
[1] 8 6 4 NA NA NA 10
```
x <- x[1:3] would shrink it back to three elements again.<br>
4. Pay attention to package priority: for example, the function filter() exists in both 
package 'stats' and package 'dplyr', if we want to use the filter in dplyr, we need to use dplyr::filter()
or load package 'dplyr' later than package 'stats'. <br>
5. R doesn't have scalar values. Scalars are represented as one-element vectors.<br>
6. Indices in R start at 1, not at 0. <br>
7. Variables can't be declared. They come into existence on first assignment.
	
Data Input/Output Methods
------------------
1 Entering data from the keyboard

2 Importing data from a delimited text file
```R
# read csv data
signal <- read.table(fileDir, header=FALSE, sep=',')
# export data as csv format
write.table(data, 'data.csv', row.names=F, col.names=F, sep=',')
```
3 Importing data from Excel

4 Importing data from XML

5 Webscraping - importing data from web

6 Importing data from SPSS/SAS/Stata/netCDF/HDF5

7 Accessing RDBMS 

8 Stat/Transfer - a commercial product that can transfer data between 34 data formats

Getting started with graphs
-----------------------------
1 Save multiple graphs as pdf or other file formats
```R
# the first graph
pdf('graph1.pdf')
plot()
dev.off()

# the second graph
pdf('graph2.pdf')
plot()
dev.off()
```
2 Plot two lines in a single graph
```R
x <- c(1:5)
y1 <- 2*x
y2 <- 3*x
plot(x, y1, type='l', col='red', xlab='day', ylab='Net Value')
lines(x, y2, type='l', col='green')

# label each line using legend() function, lwd is line width, bty='n' means no borders for the legends
legend('topleft', legend=c('line 1', 'line 2'), col=c('red', 'green'), lwd=1, bty='n') 
```

3 Show multiple graphs at the same time <br>
```R
# the first graph
plot()
# the second graph
# open a new graph window, a little similar to 'figure' in matlab
dev.new()
# if there is no dev.new(), we can use previous (or left arrow), next (or right arrow) of GUI to see the two graphs separately 
plot() 
```
4 Graphical parameters <br>
--symbols and lines <br>
--colors <br>
--text characteristics <br>
--graph and margin dimensions <br>

5 Adding text, customized axes, and legends <br>

6 Combining graphs in a single graph <br>

Basic data management
-------------------------------------------
1 adding new variables to the data frame
```R
mydata <- data.frame(x1 = c(2, 2, 6, 4),
                     x2 = c(3, 4, 2, 8))
					 
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
```	
2 recoding variables
```R
mydata <- data.frame(x1 = c(2, 2, 6, 4),
                     x2 = c(3, 4, 2, 8))
# recoding variables
# method 1
#mydata$age[mydata$x1==2] <- 1
#mydata$tmp <- mydata$x1 * mydata$x2

# method 2
mydata <- within(mydata, {
  age <- NA # create a new variable age for data frame mydata and intialize it as NA
  age[x1==2] <- 1
  tmp <- x1*x2
})
```
3 renaming variables
```R
rename(dataframe, c(oldname1="newname1", oldname2="newname2",...))
#names[dataframe] returns the variable names of the data frame as a vector
names(dataframe)[2] <- "newname"
# or use fix(datafrmae) to rename variables in GUI
```
4 missing values
```r
leadership$age[leadership$age==99] <- NA
x < - c(1, 2, NA, 3)
y <- x[1] + x[2] + x[3] + x[4] # y will be NA
z <- sum(x) # z will be NA
z <- sum(x, na.rm=TRUE) # na.rm=TRUE removes the missing values
newdata <- na.omit(leadership) # na.omit() deletes any rows with missing data
```
5 Date values <br>
(1) store character date as a data variable
```R
# x is character date
# default input format is yyyy-mm-dd
mydate <- as.Date(x, 'input_format')
```
(2) transform date to a specific format and to extract portions of dates
```R
# x is a date variable
# default output format is yyyy-mm-dd
mydate <- format(x, format='output_format') 
```
(3) calculate a time interval and express it in seconds, minutes, hours, days, or weeks, 
```R
# dataX and dataY are data variables
interval <- difftime(dateX, dateY, units='weeks')
```
(4) Sys.Date() returns today's date and date() returns the current date and time <br>
```R
# record the running time of a program
t1 <- proc.time()
code 
t2 <- proc.time()
time_elapsed <- (t2-t1)[[3]] # the elapsed time
time_elapsed <- as.numeric((t2-t1)[3]) # the elapsed time, the same as the above value
```

6 Type conversion (page 84)<br>
is.datatype() return TRUE or FALSE <br>
as.datatype() converts the argument to that type <br>

7 Sort data frame (By default, the sorting order is ascending)
```R
# sort the rows from youngest to oldest
newdata <- leadership[order(leadership$age),]

# sort the rows from female to male, and from youngest to oldest within each gender
attach(leadership)
newdata <- leadership[order(gender, age), ]
detach(leadership)

# sort the rows from female to male, and from oldest to youngest within each gender
attach(leadership)
newdata <- leadership[order(gender, -age), ]
detach(leadership)
```
8 Merge data sets <br>
(1) add columns <br>
```R
# merge dataframeA and dataframeB by ID (inner join)
total <- merge(dataframeA, dataframeB, by="ID")
# merge dataframeA and dataframeB by ID and Country (inner join)
total <- merge(dataframeA, dataframeB, by=c('ID', 'Country'))
# horizontally concatenate dataframeA and dataframeB
# dataframeA and dataframeB must have the same number of rows and the row order should be the same
total <- cbind(dataframeA, dataframeB)
```
(2) add rows <br>
```R
# the two data frames must have the same variables
total <- rbind(dataframeA, dataframeB)
``` 
9 Subsetting data sets <br>
(1) Keeping variables
```R
c1 <- c(1, 2, 3)
c2 <- c(4, 5, 6)
c3 <- c(7, 8, 9)
data <- data.frame(c1, c2, c3)
newdata <- data[1]
newdata <- data['c1']
x <- c('c1', 'c2)
newdata <- data[x]
newdata <- data[, 1]
newdata <- data[, 1:2]
newdata <- data[, c(1:2)]
newdata <- data[1,]
newdata <- data[1:2,]
```
(2) Excluding variables
```R
# delete variables q3 and q4
myvars <- names(leadership) %in% c('q3', 'q4')
newdata <- leadership[!myvars]
# delete the 8th and 9th variables
newdata <- leadership[c(-8, -9)]
# delete variables q3 and q4
leadership$q3 <- leadership$q4 <- NULL
```
(3) Selecting observations
```R
newdata <- leadership[1:3,]
newdata <- leadership[which(leadership$gender=='M' & leadership$age>30),]
attach(leadership)
newdata <- leadership[which(gender=='M' & age>30),]

leadership$date <- as.Date(leadership$date, '%m/%d/%y')
startdate <- as.Date('2009-01-01')
enddate <- as.Date('2009-10-31')
newdata <- leadership[which(leadership$date>=startdate & leadership$date<=enddate),]

# use package dplyr (install first)
newdata <- filter(leadership, gender=='M' & age>30)
```
(4) The subset() function
```R
newdata <- subset(leadership, age>=35 | age<24, select=c(q1, q2, q3, q4))
newdata <- subset(leadership, gender=='M' | age>25, select=gender:q4)
```
(5) Random samples
```R
mysample <- leadership[sample(1:nrow(leadership), 3, replace=FALSE), ]
```
(6) Using SQL to manipulate data frames
```R
library('sqldf')
newdf <- sq1df('select * from mtcars where carb=1 order by mpg', row.names=TRUE)
newdf <- sqldf('select avg(mpg) as avg_mpg, avg(disp) as avg_disp, gear from mtcars where cyl in (4, 6) group by gear')
```

10 Conversion between string and variable name <br>
```R
# string to variable name
assign('test', 10) # same as test <- 10
x <- 'test'
assign(x, 5) # same as test <- 5

# variable name to string
x <- 5
var.name <- deparse(substitute(x)) # var.name will be "x"
```  

Advanced data management
-------------------------------
1 Numerical and character functions <br>
- Mathematical functions <br>
  sqrt(x), floor(x), log(x), exp(x)
- Statistical functions <br>
  mean(x), median(x), sd(x), var(x), range(x), sum(x), scale(x, center=TRUE, scale=TRUE)
- Probability functions (page 96)<br>
  [dpqr]distribution_abbrebiation (d=density, p=distribution function, q=quantile function, r=random generation)<br> 
   runif(): uniform distribution on the interval 0 to 1 <br>
   set.seed(5): set seed to make the results reproducible
- Character functions<br>
  nchar(x), nzchar(x), substr(x, start, stop), grep(pattern, x, ignore.case=FALSE, fixed=FALSE) <br>
  sub(pattern, replacement, x, ignore.case=FALSE, fixed=FALSE), strsplit(x, split, fixed=FALSE) <br>
  paste(..., sep=""), toupper(x), tolower(x)
- Other useful functions<br>
  length(x), seq(from, to, by), rep(x, n), cut(x, n), pretty(x, n), cat(.., file='myfile', append=FALSE)
- Apply functions to matrices and data frames<br>
  apply(x, MARGIN, FUN, ...)<br> 
  x is the data object, MARGIN is the dimension index, 1 indicates rows, 2 indicates columns, FUN is a function you specify, and ... are any parameters you want to pass to FUN <br>
  
2 Control flow
- if/else, ifelse, switch
```R
score <- 0.6
if (score > 0.5) {
  outcome2 <- 'passed' 
} else {
  outcome2 <- 'not passed'
}
outcome <- ifelse(score>0.5, 'passed', 'not passed')
switch(expr, ...)
```
Note: <br>
"... When the if statement is not in a block the else, if present,
must appear on the same line as statement1. Otherwise the new line at
the end of statement1 yields a syntactically complete statement that
is evaluated. ..."

- for, while <br>
  for (var in seq) statement <br>
  while (cond) statement
```R
for (i in 1:10) {
  print('hello world')
}
# pay attention to the following example, it will print 1 and 0
for (i in 1:0) {
	print(i)
}

i <- 10
while(i>=0) {
  print('hello world')
  i <- i-1
}
```
3 User-defined functions <br>
myfunction <- function(arg1, arg2, ...) { <br>
	statements <br>
	return(object) <br>
}
```R
mystats <- function(x, parametric=TRUE, print=FALSE) {
  if (parametric) {
    center <- mean(x)
    spread <- sd(x)
  } else {
    center <- median(x)
    spread <- mad(x)
  }
  if(print&parametric) {
    cat('Mean=', center, '\n', 'SD=', spread, '\n')
  } else if(print&!parametric){
    cat('Median=', center, '\n', 'MAD=', spread, '\n')
  }
  result <- list(center = center, spread=spread)
  return(result)
}
```
4 Aggregation and restructuring <br>
- aggregate(x, by, FUN) <br>
x is the data object to be collapsed, by is a list of variables that will be crossed to form the 
new observations, and FUN is the scalar function used to calculate summary statistics that will 
make up the new observation values.
- reshape <br>
install.packages('reshape'), library('reshape') <br>
melt(data, id=(c('id', 'time'))), cast(md, id~variable, mean)

Clustering in R
----------------------------------
1. K-means clustering
```R
signal.return <- data.frame(signal.value, return.rate)
kmeans.res <- kmeans(signal.return, 3) # 3 clusters, give each observation a label
plot(signal.return, xaxt='n', yaxt='n', xlab='Signal Value', ylab='Return')
axis(1, pos=0)
axis(2, pos=0)
abline(v=0, h=0)
kmeans.cluster <- factor(kmeans.res$cluster)
# need to install package 'ade4' to visualize the clusters
s.class(signal.return, fac=kmeans.cluster, add.plot=TRUE, col=seq(1, nlevels(kmeans.cluster), 1))
```
