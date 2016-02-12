#Github User: DDWEQ
#Exploratory Data Analysis Project 1
#Feb 2016
#Plot 2

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


# Create PNG and plot
png(filename="Plot2.png", width=480, height=480, units = "px") 

with(sData, plot(x, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

dev.off()
