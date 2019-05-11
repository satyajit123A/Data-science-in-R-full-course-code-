lm.fit<-lm(mpg~horsepower,data=Auto)

#printing results
summary(lm.fit)

#p value is significantly small hence we can reject null hypothesis
#There is a strong relational indication based on F score
#the relation is quite strong as the R2 is .6059


#relationship direction
plot(Auto$mpg,Auto$horsepower)
#-ve corelation 
#see plot1 to understand

#prediction
predict (lm.fit ,data.frame(horsepower=c(98)),interval ="prediction")


