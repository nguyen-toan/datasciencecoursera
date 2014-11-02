## 3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? 
## Use the ggplot2 plotting system to make a plot answer this question.

# Reading data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Create emission data
baltimore.data <- subset(NEI, fips=="24510")
baltimore.data$year <- factor(baltimore.data$year)

# Save the required plot
require(ggplot2)

png(filename="plot3.png", height=600, width=600)

ggplot(data=baltimore.data, aes(x=year, y=log(Emissions))) + 
  facet_grid(. ~ type) + guides(fill=F) +
  geom_boxplot(aes(fill=type)) + 
  stat_boxplot(geom ="errorbar") +
  geom_jitter(alpha=0.10) + 
  xlab("Year") + ylab(expression(paste("Log", " of PM"[2.5], " Emissions"))) +
  ggtitle("Emissions per Type in Baltimore City")

dev.off()
