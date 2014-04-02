mydates <- as.Date(c('2014-03-30', '2014-04-02'))

mydates2 <- as.Date(c('2014/03/30', '2014/04/02'), '%Y/%m/%d')

newdates <- format(mydates2, '%m %d %Y')

now <- Sys.Date()
birth <- as.Date('1990-06-07')
days <- difftime(now, birth, units='days')