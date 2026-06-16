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
