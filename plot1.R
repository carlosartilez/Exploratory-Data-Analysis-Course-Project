NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(tidyr)
totalEmissions <- summarise(group_by(NEI, year),
                            Emissions = sum(Emissions)
                            )
plot(totalEmissions$year,
     totalEmissions$Emissions,
     type='l',
     main = expression('Total PM'[2.5]*' emissions in tons'),
     ylab='Emissions',
     xlab='Year'
     )
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()