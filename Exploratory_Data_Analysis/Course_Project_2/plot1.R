## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission 
## from all sources for each of the years 1999, 2002, 2005, and 2008.

# Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Create emission data
emission.data <- aggregate(NEI[, "Emissions"], by=list(NEI$year), FUN=sum)
x <- emission.data[, 1]
y <- emission.data[, 2] / 1000

# Save the required plot
png(filename="plot1.png")

bplt <- barplot(y, names.arg=x,
                main=expression(paste("Total Emission of PM",""[2.5], " (Kilotons)")),
                xlab="Year", 
                ylab=expression(paste("PM",""[2.5], " emissions")),
                ylim=c(0, max(y)*1.1))
text(bplt, y*1.05, labels=round(y,0), col="black")

dev.off()
