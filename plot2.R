#load power dataframe
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerDF <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]	

datetime <- strptime(paste(powerDF$Date, powerDF$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePowerDF <- as.numeric(powerDF$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePowerDF, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()