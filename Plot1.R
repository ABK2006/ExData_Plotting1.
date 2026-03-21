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


# plot 1
png("plot1.png", width = 480, height = 480)

hist(
  data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kw)"
)

dev.off()
