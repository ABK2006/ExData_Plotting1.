# Load data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$DateTime <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")

# Subset data
data_subset <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Create PNG file
png("plot2.png", width=480, height=480)

# Create line plot
plot(data_subset$DateTime, data_subset$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")

# Close file
dev.off()
