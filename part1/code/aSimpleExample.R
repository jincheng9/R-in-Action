# A simple example
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
# type='b' indicates that both points and lines should be plotted
plot(dose, drugA, type='b')

# opar records current graphical settings
opar <- par(no.readonly=TRUE)
# modify the graphical settings
par(lty=2, pch=17)
plot(dose, drugA, type='b')
# recover previous graphical settings
par(opar)

# put all parameters in plot
plot(dose, drugA, type='b', lty=2, pch=17)

