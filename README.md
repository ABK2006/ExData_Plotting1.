# Exploratory Data Analysis: Course Project 1

This repository contains the R code and resulting PNG plots for Course Project 1 of the **Exploratory Data Analysis** course (Johns Hopkins University) on Coursera.

## Dataset
The data used in this project is the **Individual household electric power consumption Data Set** from the UC Irvine Machine Learning Repository.
* **Description:** Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years.
* **Missing Values:** Coded as `?`.

## Data Preparation (Step 1)
The scripts process the data by performing the following steps:
1. Reading the dataset into R.
2. Subsetting the data to only include dates from **February 1, 2007** to **February 2, 2007**.
3. Converting the `Date` and `Time` variables into standard POSIXct Date/Time classes.
4. Converting required character variables into numeric format for plotting.

```R
# Example Data Loading Step
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", stringsAsFactors=FALSE)
plot_data <- subset(data, Date=="1/2/2007" | Date=="2/2/2007")
plot_data$DateTime <- as.POSIXct(paste(plot_data$Date, plot_data$Time), format="%d/%m/%Y %H:%M:%S")
