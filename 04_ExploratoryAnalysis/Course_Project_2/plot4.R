## 4. Across the United States, how have emissions from coal 
## combustion-related sources changed from 1999-2008?

# Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Coal combustion-related sources
SCC.coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE), ]
coal.merge.data <- merge(x=NEI, y=SCC.coal, by="SCC")
coal.aggregate.data <- aggregate(coal.merge.data[, "Emissions"], 
                                 by=list(coal.merge.data$year), 
                                 FUN=sum)
x <- coal.aggregate.data[, 1] # year
y <- coal.aggregate.data[, 2] / 1000 # emissions in kilotons

# Save the required plot
png(filename="plot4.png")

plot(x, y, type="l", col="blue",
     ylim=c(0, max(y)*1.1),
     xlab="Year", 
     ylab=expression(paste("PM",""[2.5], " emissions")),
     main=expression(paste("Total Emission of PM",""[2.5], " (kilotons) in Baltimore City")),)
text(x, y*0.95, round(y,0), cex=1)

dev.off()