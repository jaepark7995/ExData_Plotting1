# This R script plots the Energy Sub Meterings against datetime in 2/1/2007 ~ 2/2/2007

## Import text file and subset the appropriate dates
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
HPC <- HPC[which(HPC$Date == "1/2/2007" | HPC$Date == "2/2/2007"),]

## change class of data values for easier handling
HPC$Sub_metering_1 <- as.numeric(as.character(HPC$Sub_metering_1))
HPC$Sub_metering_2 <- as.numeric(as.character(HPC$Sub_metering_2))
HPC$Sub_metering_3 <- as.numeric(as.character(HPC$Sub_metering_3))
HPC$DateTime <- paste(as.character(HPC$Date), as.character(HPC$Time), sep = " ")

## create a datetime column in the dataframe
library(lubridate)
HPC$DateTime <- parse_date_time(HPC$DateTime, 'dmyHMS')

## plot energy sub meterings against datetime
plot(HPC$DateTime, HPC$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Meeting")
lines(HPC$DateTime, HPC$Sub_metering_2, col = "red")
lines(HPC$DateTime, HPC$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.5)

## create a png file
dev.copy(png, file = "plot3.png")
dev.off()
