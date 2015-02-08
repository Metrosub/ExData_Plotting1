#Reading dataset, adding proper class to $Date and subsetting
data <- read.csv ("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE, header = TRUE)
data$Date <- as.Date (data$Date, "%d/%m/%Y")
data <- subset (data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

#Creating and saving a plot
par (mfrow = c(1,1))
png (file = "plot1.png", width = 480, height = 480)
hist (data[,3], main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
dev.off ()