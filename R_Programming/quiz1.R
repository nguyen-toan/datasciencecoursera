setwd("/Users/nguyentoan/work/datasciencecoursera/R_Programming")
system('curl "https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fquiz1_data.zip" -o quiz1_data.zip')
system('unzip quiz1_data.zip')

x <- 4L
class(x)

x <- c(4, "a", TRUE)
class(x)

x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x,y)

x <- list(2, "a", "b", TRUE)
x[[1]]

x <- 1:4
y <- 2:3
x+y

x <- c(3, 5, 1, 10, 12, 6)
x[x<6] <- 0
x

data <- read.csv("hw1_data.csv")
names(data)
data[1:2,]
rows <- nrow(data)
data[(rows-1):rows,]
data[47, "Ozone"]
summary(data$Ozone)
mean(data$Ozone, na.rm = TRUE)
mean(data[data$Ozone > 31 & data$Temp > 90, "Solar.R"], na.rm=TRUE)
mean(data[data$Month==6,"Temp"], na.rm=TRUE)
max(data[data$Month==5, "Ozone"], na.rm=TRUE)

install.packages("swirl")
library("swirl")
swirl()
