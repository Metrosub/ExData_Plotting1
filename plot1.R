#Reading dataset and adding proper classes to $Date and $Time
data <- read.csv ("household_power_consumption.txt", sep = ";", na.strings = c("NA", "N.A.", "?"))
data$Date <- as.Date (data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

#Subsetting data for Feb 1 and 2 2007
data_short <- subset (data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Creating and saving a plot
png (file = "plot1.png")
hist (data_short[,3], main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off ()