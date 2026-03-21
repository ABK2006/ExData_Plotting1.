library(dplyr)

# read in data and clean
data <- read.table("household_power_consumption.txt",  header = TRUE, sep = ";",  
                   na.strings = "?",  stringsAsFactors = FALSE) %>%
  mutate(
    Date = as.Date(Date, format = "%d/%m/%Y"),
    Datetime = strptime(
      paste(Date, Time),
      format = "%Y-%m-%d %H:%M:%S"
    )
  ) %>%
  filter(Date %in% as.Date(c("2007-02-01", "2007-02-02")))


# plot 3:
png("plot3.png", width = 480, height = 480)

plot(
  data$Datetime,
  data$Sub_metering_1,
  type = "l",
  col = "black",
  xlab = "",
  ylab = "Energy sub metering",
  xaxt = "n" 
)

lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")

axis(
  1,
  at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
  labels = c("Thu", "Fri", "Sat")
)

legend(
  "topright",
  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  col = c("black", "red", "blue"),
  lty = 1
)

dev.off()
