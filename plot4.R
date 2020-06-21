# This R script creates 4 plots for the data in 2/1/2007 ~ 2/2/2007:
# Global active power, voltage, energy sub metering, and global reactive power data against datetime.

## Import text file and subset the appropriate dates
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
HPC <- HPC[which(HPC$Date == "1/2/2007" | HPC$Date == "2/2/2007"),]

## change class of data values for easier handling
HPC$Global_active_power <- as.numeric(as.character(HPC$Global_active_power))
HPC$Global_reactive_power <- as.numeric(as.character(HPC$Global_reactive_power))
HPC$Voltage <- as.numeric(as.character(HPC$Voltage))
HPC$Sub_metering_1 <- as.numeric(as.character(HPC$Sub_metering_1))
HPC$Sub_metering_2 <- as.numeric(as.character(HPC$Sub_metering_2))
HPC$Sub_metering_3 <- as.numeric(as.character(HPC$Sub_metering_3))
HPC$DateTime <- paste(as.character(HPC$Date), as.character(HPC$Time), sep = " ")

## create a datetime column in the dataframe
library(lubridate)
HPC$DateTime <- parse_date_time(HPC$DateTime, 'dmyHMS')

## create layout of 2 by 2 plots
par(mfrow = c(2, 2))
plot(HPC$DateTime, HPC$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
plot(HPC$DateTime, HPC$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(HPC$DateTime, HPC$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Meeting")
lines(HPC$DateTime, HPC$Sub_metering_2, col = "red")
lines(HPC$DateTime, HPC$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), col = c("black", "red", "blue"), lty = 1, cex = 0.4, bty = "n")
plot(HPC$DateTime, HPC$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power (kilowatts)")

## create a png file
dev.copy(png, file = "plot4.png")
dev.off()
