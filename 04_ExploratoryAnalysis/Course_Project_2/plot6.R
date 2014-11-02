## 6. Compare emissions from motor vehicle sources in Baltimore City with 
## emissions from motor vehicle sources in Los Angeles County, California (fips == 06037). 
## Which city has seen greater changes over time in motor vehicle emissions?

# Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Motor vehicle sources data in Baltimore City and Los Angeles County
NEI$year <- factor(NEI$year)
BC.data <- subset(NEI, fips == "24510" & type == "ON-ROAD")
LA.data <- subset(NEI, fips == "06037" & type == "ON-ROAD")

BC.df <- aggregate(BC.data[, "Emissions"], by=list(BC.data$year), FUN=sum)
names(BC.df) <- c("year", "emissions")
BC.df$city <- "BC"
LA.df <- aggregate(LA.data[, "Emissions"], by=list(LA.data$year), FUN=sum)
names(LA.df) <- c("year", "emissions")
LA.df$city <- "LA"

merge.data <- data.frame(rbind(BC.df, LA.df))
merge.data$city <- factor(merge.data$city)

# Save the required plot
png(filename="plot6.png", height=600, width=600)

ggplot(merge.data, aes(x=year, y=emissions, group=city, colour=city)) +
  geom_line() +
  geom_point(size=3, fill="white") +
  xlab("Year") +
  ylab(expression(paste("PM",""[2.5], " emissions"))) +
  ggtitle(expression(paste("Total Emission of PM",""[2.5], " of Baltimore City (BC) and Los Angeles County (LA)"))) +
  geom_text(aes(x=year, y=emissions, label=round(emissions,0), hjust=0.5, vjust=-1))

dev.off()
