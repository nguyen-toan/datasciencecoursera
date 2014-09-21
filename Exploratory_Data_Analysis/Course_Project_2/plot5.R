## 5. How have emissions from motor vehicle sources changed 
## from 1999-2008 in Baltimore City? 

# Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Motor vehicle sources data in Baltimore City
vehicle.data <- subset(NEI, fips == 24510 & type == "ON-ROAD")
vehicle.df <- aggregate(vehicle.data[, "Emissions"], 
                        by=list(vehicle.data$year), 
                        FUN=sum)
y <- vehicle.df[, 1] # year
y <- vehicle.df[, 2] # emissions
names(y) <- x

# Save the required plot
png(filename="plot5.png")

bplt <- barplot(y, ylim=c(0, max(y)*1.1),
                col=c("cyan", "orange", "gold", "indianred"),
                xlab="Year", 
                ylab=expression(paste("PM",""[2.5], " emissions")),
                main=expression(paste("Total Emission of PM",""[2.5], " (tons) in Baltimore City")))
text(bplt, y*1.05, labels=round(y,0), col="black")

dev.off()