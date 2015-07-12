#load power dataset dataset
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerDF <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]	

#prepare x and y axis
datetime <- strptime(paste(powerDF$Date, powerDF$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
voltage <- as.numeric(powerDF$Voltage)
subMetering1 <- as.numeric(powerDF$Sub_metering_1)
subMetering2 <- as.numeric(powerDF$Sub_metering_2)
subMetering3 <- as.numeric(powerDF$Sub_metering_3)
globalActivePowerDF <- as.numeric(powerDF$Global_active_power)
globalReactivePowerDF <- as.numeric(powerDF$Global_reactive_power)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#plot global active Power, voltage, submetering graphs and reactive Power graph
plot(datetime, globalActivePowerDF, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")

lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

#set the legend.
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePowerDF, type="l", xlab="datetime", ylab="Global_reactive_power")

#close the device.
dev.off()