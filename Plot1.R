# 1. Read the full dataset
# Note: missing values are coded as '?'
dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings="?")

# 2. Subset the data for the required dates
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 3. Extract the required variable
globalActivePower <- as.numeric(subSetData$Global_active_power)

# 4. Open the PNG device, create the plot, and close the device
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
