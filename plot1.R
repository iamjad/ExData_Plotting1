#load power dataframe
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
powerDF <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]	
	
globalActivePowerDF <- as.numeric(powerDF$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePowerDF, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()