Part 1 Getting Started
=======================

Managing the R Workspace
------------------
```R
# get the current workspace directory 
getwd()
# set the workspace directory, case sensitive
setwd()
# create a directory 
dir.create(foldername) 
# run R script
source('file.R') 
# print the output to console
source('file.R', print.eval=TRUE) 
# or use print() to print anything you want to print to the console, for example 
a <- 2
print(a)
# print all commands to console
source('file.R', echo=TRUE)
# get the type of variables
a <- c(1, 2)
class(a)
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
patientdata[1:2] # first 2 columns
patientdata[c('diabetes', 'status')]
patientdata$age
table(patientdata$diabetes, patientdata$status)

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
Factor: Categorical (nomial) and Categorical ordered (ordinal) variables
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
For example, A$x refers to variable x in data fram A
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
4. R doesn't have scalar values. Scalars are represented as one-element assignment.<br>
5. Indices in R start at 1, not at 0. <br>
6. Variables cann't be declared. They come into existence on first assignment.

Data Input Methods
------------------
1. Entering data from the keyboard
2. Importing data from a delimited text file
3. Importing data from Excel
4. Importing data from XML
5. Webscraping - importing data from web
6. Importing data from SPSS/SAS/Stata/netCDF/HDF5
7. Accessing RDBMS 
8. Stat/Transfer - a commercial product that can transfer data between 34 data formats

Getting started with graphs
-----------------------------
1 Save multiple graphs as pdf or other file formats
```R
# the first graph
pdf('graph1.pdf)
plot()
dev.off()

# the second graph
pdf('graph2.pdf)
plot()
dev.off()
```
2 Show multiple graphs at the same time <br>
```R
# the first graph
plot()
# the second graph
# open a new graph window, a little similar to 'figure' in matlab
dev.new()
# if there is no dev.new(), we can use previous (or left arrow), next (or right arrow) of GUI to see the two graphs separately 
plot() 
```
3 Graphical parameters <br>
--sysmbols and lines <br>
--colors <br>
--text characteristics <br>
--graph and margin dimensions <br>
