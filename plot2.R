# This R script plots the Global Active Powers against datetime in 2/1/2007 ~ 2/2/2007

## Import text file and subset the appropriate dates
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
HPC <- HPC[which(HPC$Date == "1/2/2007" | HPC$Date == "2/2/2007"),]

## change class of data values for easier handling
HPC$Global_active_power <- as.numeric(as.character(HPC$Global_active_power))
HPC$DateTime <- paste(as.character(HPC$Date), as.character(HPC$Time), sep = " ")

## create a datetime column in the dataframe
library(lubridate)
HPC$DateTime <- parse_date_time(HPC$DateTime, 'dmyHMS')

## plot Global active powers against datetime
plot(HPC$DateTime, HPC$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## create a png file
dev.copy(png, file = "plot2.png")
dev.off()
