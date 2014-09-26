setwd("/Users/nguyentoan/work/datasciencecoursera/Getting_and_Cleaning_Data/")
downloadMethod <- "curl"

Question 1
The American Community Survey distributes downloadable data about United States communities. Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv 

and load the data into R. The code book, describing the variable names is here: 
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf 

How many properties are worth $1,000,000 or more?

164
53
47
2076

Answer
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
destfile <- "quiz1_data.csv"
download.file(url=url, 
              destfile=destfile, 
              method=downloadMethod)
data <- read.csv(destfile)
#table(data$ST, data$VAL)
length(which(data$VAL==24))


Question 2
Use the data you loaded from Question 1. 
Consider the variable FES in the code book. 
Which of the "tidy data" principles does this variable violate?

Each variable in a tidy data set has been transformed to be interpretable.
Tidy data has variable values that are internally consistent.
Tidy data has one observation per row.
Tidy data has one variable per column.

Answer
Tidy data has one variable per column.(?)

table(data$FES)


Question 3
Download the Excel spreadsheet on Natural Gas Aquisition Program here: 
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx 

Read rows 18-23 and columns 7-15 into R and assign the result to a variable called:
  dat 
What is the value of:
  sum(dat$Zip*dat$Ext,na.rm=T) 
(original data source: http://catalog.data.gov/dataset/natural-gas-acquisition-program)

184585
36534720
154339
338924

Answer
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
destfile <- "quiz1_gov_NGAP.xlsx"
download.file(url=url,
              destfile=destfile,
              method=downloadMethod)
install.packages("xlsx")
library(xlsx)
colIndex <- 7:15
rowIndex <- 18:23
dat <- read.xlsx(file=destfile,
                 sheetIndex=1,
                 colIndex=colIndex,
                 rowIndex=rowIndex)
sum(dat$Zip*dat$Ext, na.rm=T)


Question 4
Read the XML data on Baltimore restaurants from here: 
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml 

How many restaurants have zipcode 21231?

156
130
127
181

Answer
install.packages("XML")
library(XML)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
# doc <- xmlTreeParse(url)
# Error: XML content does not seem to be XML: 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
destfile <- "restaurants.xml"
download.file(url=url,
              destfile=destfile,
              method=downloadMethod)
xml.data <- xmlTreeParse(destfile, useInternalNodes=TRUE)
rootNode <- xmlRoot(xml.data)
zipcodes <- xpathSApply(rootNode, "//zipcode", xmlValue)
length(which(zipcodes==21231))


Question 5
The American Community Survey distributes downloadable data about United States communities. 
Download the 2006 microdata survey about housing for the state of Idaho using download.file() from here: 
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv 

using the fread() command load the data into an R object
DT 
Which of the following is the fastest way to calculate the average value of the variable
pwgtp15 
broken down by sex using the data.table package?

tapply(DT$pwgtp15,DT$SEX,mean)
mean(DT$pwgtp15,by=DT$SEX)
sapply(split(DT$pwgtp15,DT$SEX),mean)
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
DT[,mean(pwgtp15),by=SEX]
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)

Answer
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
destfile <- "quiz1_q5.csv"
download.file(url=url,
              destfile=destfile,
              method=downloadMethod)
install.packages("data.table")
library(data.table)
DT <- fread(destfile)
DT[, mean(pwgtp15), by=SEX]