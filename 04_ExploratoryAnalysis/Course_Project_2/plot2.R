## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Create emission data
baltimore.data <- subset(NEI, fips=="24510")
y <- tapply(X=baltimore.data$Emissions,
            INDEX=baltimore.data$year,
            FUN=sum)

# Save the required plot
png(filename="plot2.png")

bplt <- barplot(y, ylim=c(0, max(y)*1.1),
                xlab="Year", 
                ylab=expression(paste("PM",""[2.5], " emissions")),
                main=expression(paste("Total Emission of PM",""[2.5], " (tons) in Baltimore City")))
text(bplt, y*1.05, labels=round(y,0), col="black")

dev.off()
