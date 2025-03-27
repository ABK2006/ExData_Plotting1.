# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Subset data
data_subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create PNG file
png("plot4.png", width=480, height=480)

# Set up a 2x2 plot layout
par(mfrow=c(2,2))

# Plot 1 (Top left) - Global Active Power
plot(data_subset$DateTime, data_subset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")

# Plot 2 (Top right) - Voltage
plot(data_subset$DateTime, data_subset$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Plot 3 (Bottom left) - Energy sub-metering
plot(data_subset$DateTime, data_subset$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(data_subset$DateTime, data_subset$Sub_metering_2, col="red")
lines(data_subset$DateTime, data_subset$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, bty="n")

# Plot 4 (Bottom right) - Global Reactive Power
plot(data_subset$DateTime, data_subset$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global Reactive Power")

# Close file
dev.off()

