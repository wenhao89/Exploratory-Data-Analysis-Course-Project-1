library(data.table)
data <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

newdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007", ]
newdata$Date <- as.Date(newdata$Date, format="%d/%m/%Y")
newdata$DateTime <- as.POSIXct(paste(newdata$Date, newdata$Time), format="%Y-%m-%d %H:%M:%S")

png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(x = newdata$DateTime,
	y = newdata$Global_active_power,
	xlab = "",
	ylab = "Global Active Power",
	type = "l")
	
plot(x = newdata$DateTime,
	y = newdata$Voltage,
	xlab = "datetime",
	ylab = "Voltage",
	type = "l")

plot(x = newdata$DateTime,
	y = newdata$Sub_metering_1,
	xlab = "",
	ylab = "Energy sub metering",
	type = 'l')	
lines(newdata$DateTime, newdata$Sub_metering_2, col="red")
lines(newdata$DateTime, newdata$Sub_metering_3, col="blue")
legend(x = "topright",
		col = c("black", "red", "blue"),
		legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
		lty = 1,
		bty = "n")

plot(x = newdata$DateTime,
	y = newdata$Global_reactive_power,
	xlab = "datetime",
	ylab = "GLobal_reactive_power",
	type = "l")

dev.off()