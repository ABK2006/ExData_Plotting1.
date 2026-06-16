png("plot2.png", width=480, height=480)
plot(plot_data$DateTime, plot_data$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()
