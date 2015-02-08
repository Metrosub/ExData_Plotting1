#Reading dataset subsetting and adding a column with proper classes to $Date and $Time
data <- read.csv ("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = FALSE, header = TRUE)
data <- subset (data, Date == c("1/2/2007","2/2/2007"))
data$DT <- strptime (paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

#Creating and saving a plot
#!!! IMPORTANT NOTE!!! The plot indicates weekdays in Russian, since Russian is set as a system language
png (file = "plot2.png", width = 480, height = 480)
plot (data$DT, data[,3], type = "l", xlab="", ylab = "Global Active Power (kilowatts)")
dev.off ()