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
Time <- paste(as.Date(dataSubset$Date), dataSubset$Time)
dataSubset$Time <- as.POSIXct(Time)
with(dataSubset, plot(Global_active_power ~ Time,
                        type = "l",
                        ylab = "Global Active Power (kilowatts)",
                        xlab = "")
       )
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()