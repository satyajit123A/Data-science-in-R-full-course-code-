# Setup
options(scipen=999)  # turn off scientific notation like 1e+06
library(ggplot2)
data("midwest", package = "ggplot2")  # load the data
# midwest <- read.csv("http://goo.gl/G1K41K") # alt source 

# Init Ggplot

ggplot(midwest, aes(x=area, y=poptotal))  # area and poptotal are columns in 'midwest'
#see plot1 for understanding

#How to Make a Simple Scatterplot
ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()
#see plot2 for understanding

#How to Make a Simple Scatterplot with better versioning
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands
plot(g)
#see plot3 for understanding

#Adjusting the X and Y axis limits
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")  # set se=FALSE to turnoff confidence bands

# Delete the points outside the limits
g + xlim(c(0, 0.1)) + ylim(c(0, 1000000)) 
#see plot4 for understanding


#Zooming In
g1 <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))  # zooms in
plot(g1)
#see plot5 for understanding
#improvice
g1 + ggtitle("Area Vs Population", subtitle="From midwest dataset") + xlab("Area") + ylab("Population")
#see plot6 for understanding







# Full Plot call
library(ggplot2)
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() + 
  geom_smooth(method="lm") + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")






#How to Change the Color and Size of Points
library(ggplot2)
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(col="steelblue", size=3) +   # Set static color and size for points
  geom_smooth(method="lm", col="firebrick") +  # change the color of line
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

#see plot7 for understanding



#How to Change the Color To Reflect Categories in Another Column
library(ggplot2)
gg <- ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(aes(col=state), size=3) +  # Set color to vary based on state categories.
  geom_smooth(method="lm", col="firebrick", size=2) + 
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")
plot(gg)

#see plot8 for understanding



gg + scale_colour_brewer(palette = "Set2")  # change color palette
plot(gg)
#see plot9 for understanding


#More of such palettes can be found in the RColorBrewer package
library(RColorBrewer)
head(brewer.pal.info, 10) 




# Change breaks
gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01))
#see plot10 for understanding



# Reverse X Axis Scale
gg + scale_x_reverse()
#see plot11 for understanding


# Change Axis Texts
gg + scale_x_continuous(breaks=seq(0, 0.1, 0.01), labels = sprintf("%1.2f%%", seq(0, 0.1, 0.01))) + 
  scale_y_continuous(breaks=seq(0, 1000000, 200000), labels = function(x){paste0(x/1000, 'K')})

#see plot12 for understanding



# go to http://r-statistics.co/Complete-Ggplot2-Tutorial-Part2-Customizing-Theme-With-R-Code.html for more
