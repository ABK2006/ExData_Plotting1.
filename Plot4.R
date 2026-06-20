# 1. Read and subset the data
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 2. Extract and format all required variables
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

# 3. Open PNG device
png("plot4.png", width=480, height=480)

# 4. Set the parameters for a 2x2 grid
par(mfrow = c(2, 2)) 

# Plot 1 (Top-Left)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

# Plot 2 (Top-Right)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot 3 (Bottom-Left)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# Note: bty="n" removes the box around the legend to match the reference plot
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="n")

# Plot 4 (Bottom-Right)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# 5. Close device
dev.off()
