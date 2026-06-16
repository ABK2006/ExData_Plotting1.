##Step-01

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings="?", stringsAsFactors=FALSE)

# Subset Feb 1-2, 2007
plot_data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")

# Create DateTime + convert columns to numeric
plot_data$DateTime <- as.POSIXct(paste(plot_data$Date, plot_data$Time), 
                                 format="%d/%m/%Y %H:%M:%S")

cols <- c("Global_active_power", "Global_reactive_power", "Voltage",
          "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot_data[cols] <- lapply(plot_data[cols], as.numeric)


##Step-02 Plotting One by One Plot

##Plot1
png("plot1.png", width=480, height=480)
hist(plot_data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()

##Plot2
png("plot2.png", width=480, height=480)
plot(plot_data$DateTime, plot_data$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()

##Plot3

png("plot3.png", width=480, height=480)
plot(plot_data$DateTime, plot_data$Sub_metering_1, 
     type="l", 
     xlab="", 
     ylab="Energy sub metering")
lines(plot_data$DateTime, plot_data$Sub_metering_2, col="red")
lines(plot_data$DateTime, plot_data$Sub_metering_3, col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()

##Plot4

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(plot_data$DateTime, plot_data$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")

plot(plot_data$DateTime, plot_data$Voltage, 
     type="l", xlab="datetime", ylab="Voltage")

plot(plot_data$DateTime, plot_data$Sub_metering_1, 
     type="l", xlab="", ylab="Energy sub metering")
lines(plot_data$DateTime, plot_data$Sub_metering_2, col="red")
lines(plot_data$DateTime, plot_data$Sub_metering_3, col="blue")
legend("topright", bty="n", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)

plot(plot_data$DateTime, plot_data$Global_reactive_power, 
     type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
