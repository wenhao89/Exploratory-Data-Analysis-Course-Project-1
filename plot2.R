library(data.table)
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

newdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007", ]
newdata$Date <- as.Date(newdata$Date, format="%d/%m/%Y")
newdata$DateTime <- as.POSIXct(paste(newdata$Date, newdata$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot2.png", width=480, height=480)
plot(x = newdata$DateTime,
	y = newdata$Global_active_power,
	xlab = "",
	ylab = "Global Active Power (kilowatts)",
	type = "n")
lines(newdata$DateTime, newdata$Global_active_power, type="S")

dev.off()
