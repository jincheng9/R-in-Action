# sink only stores the output of script2.R
source('script1.R', print.eval=TRUE)
sink('myoutput', append=TRUE, split=TRUE)
pdf('graph.pdf')
source('script2.R', print.eval=TRUE)
sink()
dev.off()
source('script3.R', print.eval=TRUE)