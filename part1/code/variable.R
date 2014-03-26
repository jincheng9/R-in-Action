# define vector and access elements
a <- c(1, 2, 5, 3, 6, -2, 4)
a[3]  # 5
a[c(1, 3, 5)] # 1 5 6
a[2:6] # 2 5 3 6 -2

# matrices: two-dimensional
y <- matrix(1:20, nrow=5, ncol=4)
cells <- c(1, 26, 24, 68)
rnames <- c('R1', 'R2')
cnames <- c('C1', 'C2')
# fill in the matrix by row
mymatrix <- matrix(cells, nrow=2, ncol =2, byrow=TRUE,
                   dimnames=list(rnames, cnames))
mymatrix
# fill in the matrix by column, the default is by column
mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=FALSE,
                   dimnames=list(rnames, cnames))
mymatrix

#Using matrix subscripts
x <- matrix(1:10, nrow=2)
x
x[2,]
x[,2]
x[1,4]
x[1,c(4,5)]

# Array
dim1 <- c('A1','A2')
dim2 <- c('B1', 'B2', 'B3')
dim3 <- c('C1', 'C2', 'C3', 'C4')
z <- array(1:24, c(2,3,4), dimnames=list(dim1, dim2, dim3))
z
z[1,2,3]

# data frame
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c('Type1', 'Type2', 'Type1','Type1')
status <- c('Poor', 'Improved', 'Excellent', 'Poor')
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
patientdata[1:2] # first 2 columns
patientdata[c('diabetes', 'status')]
patientdata$age
table(patientdata$diabetes, patientdata$status)

# attach, detach, and with
summary(mtcars$mpg)
plot(mtcars$mpg, mtcars$disp)
plot(mtcars$mpg, mtcars$wt)
attach(mtcars) # add the data frame mtcars to the R search path
summary(mpg)
  plot(mpg, disp)
  plot(mpg, wt)
detach(mtcars) # remove the data frame from the search path

# attach and detach have limitations when more than one object has the same name
#With(mtcars, summary(mpg))


# factors: categorical(nominal) and ordered categorical(ordinal) are factors
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

# list
g <- 'My First List'
h <- c(25, 26, 18, 39)
j <- matrix(1:10, nrow=5)
k <- c('one', 'two', 'three')
mylist <- list(title=g, ages=h, j, k)
mylist
mylist[[2]]
mylist[['ages']]
mylist[[2]][1] # 25, the first element of the second element in list
