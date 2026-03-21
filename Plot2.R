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


# plot2:
png("plot2.png", width = 480, height = 480)

plot(data$Datetime, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kw)",
     xaxt = "n" )

axis(
  1,
  at = as.POSIXct(c("2007-02-01", "2007-02-02", "2007-02-03")),
  labels = c("Thu", "Fri", "Sat")
)

dev.off()
