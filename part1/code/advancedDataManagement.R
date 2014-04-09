for (i in 1:10) {
  if (i<5) {
    print('hello')
  }
  else {
    print('world')
  }
}
i <- 10
while(i>=0) {
  print('hello world')
  i <- i-1
}

score <- 0.6
outcome <- ifelse(score>0.5, 'passed', 'not passed')

if (score > 0.5) {
  outcome2 <- 'passed' 
} else {
  outcome2 <- 'not passed'
}

feelings <- c('sad', 'afraid')
for (i in feelings) {
  print(switch(
    i,
    sad = 'cheer up',
    afraid = 'there is nothing to fear'))
}
set.seed(1234)
x <- rnorm(500)
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
y <- mystats(x)

mydate <- function(type='long') {
  switch(type,
         long = format(Sys.time(), '%A %B %d %Y'),
         short = format(Sys.time(), '%m-%d-%Y'),
         cat(type, 'is not a recognized type\n'))
}

i <- 10
if (i <10) {
  print('i<10')
} else if(i==10) {
  print('i==10')
} else{
  print('i>10')
}