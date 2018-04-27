NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(tidyr)
emissionsBaltimoreOnRoad <- NEI[(NEI$fips == "24510") & (NEI$type == "ON-ROAD"), ]
emissionsBaltimoreOnRoadPerYear <- summarise(group_by(emissionsBaltimoreOnRoad, year),
                                             Emissions = sum(Emissions)
                                             )
emissionsLACOnRoad <- NEI[(NEI$fips == "06037") & (NEI$type == "ON-ROAD"), ]
emissionsLACOnRoadPerYear <- summarise(group_by(emissionsLACOnRoad, year),
                                             Emissions = sum(Emissions)
                                             )
emissionsBaltimoreOnRoadPerYear$County <- "Baltimore City, MD"
emissionsLACOnRoadPerYear$County <- "Los Angeles County, CA"
emissionsBothPerYear <- rbind(emissionsBaltimoreOnRoadPerYear, emissionsLACOnRoadPerYear)
ggplot(emissionsBothPerYear, aes(x = factor(year), y = Emissions, fill = County, label = round(Emissions, 2))) +
  geom_bar(stat = "identity") + 
  facet_grid( County ~ ., scales = "free") +
  ylab(expression("Total PM"[2.5]*" emissions in tons")) + 
  xlab("year") +
  ggtitle(expression("Motor vehicle emission variation in Baltimore and Los Angeles in tons")) +
  geom_label(aes(fill = County), colour = "white", fontface = "bold")
dev.copy(png, file = "plot6.png", width = 480, height = 480)
dev.off()