setwd("C:/Users/carlo_000/Documents/GitHub/Exploratory-Data-Analysis-Course-Project")
data <- read.csv("household_power_consumption.txt",
                 header = T,
                 sep = ';',
                 na.strings = "?",
                 nrows = 2075259,
                 check.names = F,
                 stringsAsFactors = F,
                 comment.char = "",
                 quote = '\"')
head(data)
dataSubset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
dataSubset$Date <- as.Date(dataSubset$Date, format="%d/%m/%Y")
hist(dataSubset$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)",
     ylab = "Frequency",
     col = "Red")
png("plot1.png", width=480, height=480)
hist(dataSubset$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (Kilowatts)",
     ylab = "Frequency",
     col = "Red")
dev.off()