
#download ISLR package from cran projects
library(ISLR)

#Exercise 8
college<-College
fix(college)
#college=college [,-1]


summary(college)

jpeg("plot1.jpeg")
pairs(college)
dev.off()


jpeg("plot2.jpeg")
boxplot(college$Outstate~college$Private)
dev.off()


Elite=rep("No",nrow(college ))
Elite[college$Top10perc >50]=" Yes"
Elite=as.factor(Elite)
college=data.frame(college , Elite)

summary(college$Elite)


jpeg("plot3.jpeg")
boxplot(college$Outstate~college$Elite)
dev.off()


jpeg("plot4.jpeg")
par(mfrow=c(2,2))
hist(college$Enroll)
hist(college$Top10perc)
hist(college$PhD)
hist(college$S.F.Ratio)
dev.off()


#The End 



