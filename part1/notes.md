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
Print all commands to console
------------------------------
```R
source('file.R', echo=TRUE)
```