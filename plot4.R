library(readr)
library(dplyr)

#Read in the data, filtering by Date between 2007-02-01 and 2007-02-02.
suppressWarnings( #Suppress warnings due to missing "?" values. These will become NA.
	data <- 
		read_delim("./data/household_power_consumption.txt", ";", col_types = cols(Date = col_date(format = "%d/%m/%Y"))) %>%
		subset(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
)

#Open png graphics device.
png("plot4.png")

#Create plot.
par(mfcol = c(2,2))

plot(as.POSIXlt(paste(data$Date, data$Time)), data$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")

plot(as.POSIXlt(paste(data$Date, data$Time)), data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
points(as.POSIXlt(paste(data$Date, data$Time)), data$Sub_metering_2, col = "red", type = "l")
points(as.POSIXlt(paste(data$Date, data$Time)), data$Sub_metering_3, col = "blue", type = "l")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")

plot(as.POSIXlt(paste(data$Date, data$Time)), data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")

plot(as.POSIXlt(paste(data$Date, data$Time)), data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")

#Close device.
dev.off()
