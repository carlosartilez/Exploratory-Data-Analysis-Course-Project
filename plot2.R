NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(dplyr)
library(tidyr)
emissionsBaltimore <- filter(NEI, fips == "24510")
totalBaltimore <- summarise(group_by(emissionsBaltimore, year),
                            Emissions = sum(Emissions)
                            )
plot(totalBaltimore$year,
     totalBaltimore$Emissions,
     type='l',
     main = expression('Total PM'[2.5]*' emissions in Baltimore (in tons)'),
     ylab='Emissions',
     xlab='Year'
     )
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()