library(readr)
library(dplyr)

#Read in the data, filtering by Date between 2007-02-01 and 2007-02-02.
suppressWarnings( #Suppress warnings due to missing "?" values. These will become NA.
	data <- 
		read_delim("./data/household_power_consumption.txt", ";", col_types = cols(Date = col_date(format = "%d/%m/%Y"))) %>%
		subset(Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
)

#Open png graphics device.
png("plot1.png")

#Create plot.
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")

#Close device.
dev.off()
