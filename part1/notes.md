Part 1 Getting Started
=======================

Change Workspace
------------------
```R
getwd() # get the current workspace directory <br>
setwd() # set the workspace directory, case sensitive
```
Run R script
-----------------
```R
source('file.R')
```
Print the output to console
------------------------------
```R
source('file.R', print.eval=TRUE)
```
or use print() to print anything you want to print to the console, for example <br>
```R
a <- 2
print(a)
```

Print all commands to console
------------------------------
```R
source('file.R', echo=TRUE)
```
Get the type of variables
------------------------------
```R
a <- c(1, 2)
class(a)
```
