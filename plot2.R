library(readr)
library(dplyr)

#Read in the data, filtering by Date between 2007-02-01 and 2007-02-02.
suppressWarnings( #Suppress warnings due to missing "?" values. These will become NA.
	data <- 
		read_delim("./data/household_power_consumption.txt", ";", col_types = cols(Date = col_date(format = "%d/%m/%Y"))) %>%
		subset(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
)

#Open png graphics device.
png("plot2.png")

#Create plot.
plot(as.POSIXlt(paste(data$Date, data$Time)), data$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "l")

#Close device.
dev.off()
