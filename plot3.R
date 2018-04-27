NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(tidyr)
library(ggplot2)
emissionsBaltimorePerYear <- summarise(group_by(filter(NEI, fips == "24510"),
                                                year,
                                                type),
                                       Emissions = sum(Emissions)
                                       )
ggplot(emissionsBaltimorePerYear, aes(x = factor(year), y = Emissions, fill = type, label = round(Emissions, 2))) +
  geom_bar(stat = "identity") +
  facet_grid(. ~ type) + xlab("Year") + ylab(expression("Total PM"[2.5]*" emission in tons")) +
  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ", "City by various source types", sep=""))) +
  geom_label(aes(fill = type), colour = "white", fontface = "bold")
dev.copy(png, file="plot3.png", width=1080, height=680)
dev.off()