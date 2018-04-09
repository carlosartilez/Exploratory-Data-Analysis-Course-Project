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
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(dataSubset, plot(Global_active_power ~ Time,
                      type = "l",
                      ylab = "Global Active Power (Kilowatts)",
                      xlab = ""))
with(dataSubset, plot(Voltage ~ Time,
                      type = "l",
                      ylab = "Voltage (Volts)",
                      xlab = ""))
with(dataSubset, plot(Sub_metering_1 ~ Time,
                      type = "l",
                      ylab = "Global Active Power (Kilowatts)",
                      xlab = ""))
lines(dataSubset$Sub_metering_2 ~ dataSubset$Time, col = "Red")
lines(dataSubset$Sub_metering_3 ~ dataSubset$Time, col = "Blue")
legend("topright",
       col = c("black", "red", "blue"),
       lty = 1,
       lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(dataSubset, plot(Global_reactive_power ~ Time,
                      type = "l",
                      ylab = "Global Rective Power (Kilowatts)",
                      xlab = ""))
dev.copy(png, file = "plot4.png", height=480, width=480)
dev.off()