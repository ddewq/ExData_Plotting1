#Github User: DDWEQ
#Exploratory Data Analysis Project 1
#Feb 2016
#Plot 1

#Import Libraries
library(dplyr)

#Read in Data - must copy R code into folder with the household_power_comsumption.txt file
file = "household_power_consumption.txt"
data = read.table(file, header = TRUE, sep = ";", dec = ".", colClasses = "character")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)


#Subset the data so it's only from Feb 1, 2007 to Feb 2, 2007
subset <- (filter(data, Date >= "2007-02-01" & Date <= "2007-02-02"))

# Create PNG and plot
png(filename="Plot1.png", width=480, height=480, units = "px")  

with(subset, hist(subset$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

dev.off()