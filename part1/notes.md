Part 1 Getting Started
=======================

Managing the R Workspace
------------------
```R
# get the current workspace directory <br>
getwd()
# set the workspace directory, case sensitive
setwd() 
# run R script
source('file.R') 
# print the output to console
source('file.R', print.eval=TRUE) <br>
or use print() to print anything you want to print to the console, for example <br>
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
4. Using the \ in a pathname on Windows--use / or \\
5. Using a funciton from a package that's not loaded