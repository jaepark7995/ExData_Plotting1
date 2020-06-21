# This R script creates a histogram of the Global Active Powers in 2/1/2007 ~ 2/2/2007

## Import text file and subset the appropriate dates
HPC <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
HPC <- HPC[which(HPC$Date == "1/2/2007" | HPC$Date == "2/2/2007"),]

## change class of data values to numeric and create histogram
HPC$Global_active_power <- as.numeric(as.character(HPC$Global_active_power))
hist(HPC$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## create a png file
dev.copy(png, file = "plot1.png")
dev.off()