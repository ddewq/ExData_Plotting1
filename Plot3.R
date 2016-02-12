#Github User: DDWEQ
#Exploratory Data Analysis Project 1
#Feb 2016
#Plot 3

#Import Libraries
library(dplyr)

#Read in Data - must copy R code into folder with the household_power_comsumption.txt file
file = "household_power_consumption.txt"
data = read.table(file, header = TRUE, sep = ";", dec = ".", colClasses = "character")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)


#Subset the data so it's only from Feb 1, 2007 to Feb 2, 2007
sData <- (filter(data, Date >= "2007-02-01" & Date <= "2007-02-02"))

#Combine Date and Time together for the x-axis
x <- strptime(paste(sData$Date, sData$Time), format = "%Y-%m-%d %H:%M:%S")


# Create PNG and plot with multiple lines
png(filename="Plot3.png", width=480, height=480, units = "px") 

with(sData, plot(x, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
lines(x, sData$Sub_metering_2, type = "l", col = 2)
lines(x, sData$Sub_metering_3, type = "l", col = 4)
legend("topright", lty = c(1,1,1) , col = c("black", "red", "Blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
