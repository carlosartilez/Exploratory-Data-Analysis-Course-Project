NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(tidyr)
library(data.table)
mergedData <- merge(NEI,SCC, by = "SCC")
newTable <- data.table(mergedData)
coalData <- grepl("coal", newTable$Short.Name, ignore.case = TRUE)
coalData <- data.table(mergedData[coalData, ])
coalDataByYear <- coalData[, list(Emissions = sum(Emissions)), by = c('year')]
ggplot(data = coalDataByYear, aes(x = year, y = Emissions)) +
  geom_line() +
  geom_point() +
  ggtitle("Emissions from Coal Sources in the US")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()