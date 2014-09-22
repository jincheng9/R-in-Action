Part 2 Basic Methods
=======================

Basic Graphs
------------------
```R
# histogram
x <- c(1, 2, 3, 3.5, 6)
hist(x)
hist(x, breaks=5, col='red')  
hist(x, breaks=seq(min, max, step), col='red')
```
```R
# density 
x <- c(1, 2, 3)
plot(density(x), col='red', xlim=c(xmin, xmax), ylim=c(ymin, ymax))
```

Basic Statistics
------------------
```R

```
