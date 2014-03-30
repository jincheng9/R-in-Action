# build and save two graphs as pdf
attach(mtcars)

# the first graph
pdf('mygraph.pdf')
plot(wt, mpg)
abline(lm(mpg~wt))
title('Regression of MPG on Weight')
dev.off()

# the second graph
pdf('mygraph2.pdf')
plot(mpg, wt)
title('Regression of Weight on MPG')
dev.off()

detach(mtcars)

