library(MASS)
library(ISLR)
#load dataset
fix(Boston)

#see names
names(Boston)

#structure of data frame
str(Boston)

#No of observation
length(names(Boston))

#simple linear model
lm.fit<-lm(medv~lstat,data=Boston)

#call model
lm.fit

#summary of it
summary(lm.fit)


#names function to find out peice of information stored in model
names(lm.fit)

#confidence interval
confint(lm.fit)


#using model to predict on different value
predict (lm.fit ,data.frame(lstat=c(5,10 ,15)),interval ="confidence")
predict (lm.fit ,data.frame(lstat=c(5,10 ,15)),interval ="prediction")



#plotting
attach(Boston)
plot(lstat ,medv)
#see plot1 to understand

abline(lm.fit,col = "blue")
#see plot2 to understand



plot(predict (lm.fit), residuals (lm.fit))
#see plot3 to understand


plot(predict (lm.fit), rstudent (lm.fit))
#see plot4 to understand



#Multiple Linear Regression

lm.fit=lm(medv~lstat+age ,data=Boston )
summary(lm.fit)



#taking all 

lm.fit=lm(medv~. ,data=Boston )
summary(lm.fit)

summary(lm.fit)$r.sq
summary(lm.fit)$sigma


# change the model
lm.fit1=update(lm.fit , ~.-age)


#compare between two models
anova(lm.fit ,lm.fit1)


par(mfrow=c(2,2))
plot(lm.fit1)
#see plot5 to understand



par(mfrow=c(2,2))
plot(lm.fit)
#see plot6 to understand



#automate task with functions
LoadLibraries= function (){
  library(ISLR)
  library(MASS)
  print("The libraries have been loaded .")
}

LoadLibraries()
