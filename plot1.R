png(file="plot1.png", width=480, height=480)
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
newdata <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007", ]
with(newdata, hist(as.numeric(levels(newdata$Global_active_power))[newdata$Global_active_power], breaks=16, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()
