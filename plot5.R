NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(tidyr)
emissionsBaltimoreOnRoad <- NEI[(NEI$fips == "24510") & (NEI$type == "ON-ROAD"), ]
emissionsBaltimoreOnRoadPerYear <- summarise(group_by(emissionsBaltimoreOnRoad, year),
                                             Emissions = sum(Emissions)
                                             )
ggplot(data = emissionsBaltimoreOnRoadPerYear, aes(x = year, y = Emissions)) +
  geom_line() +
  geom_point() +
  ggtitle("Emissions in Baltimore City from Motor Vehicles")
dev.copy(png, file="plot5.png", width=480, height=480)
dev.off()