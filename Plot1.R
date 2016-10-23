#Plot 1

library(data.table)

## Read the data file and subset between dates 1/2/2007 & 2/2/2007
data <- fread("household_power_consumption.txt", na.strings= "?", sep=";", stringsAsFactors = FALSE, header = TRUE)
date1 <- as.Date("1/2/2007", format = "%d/%m/%Y")
date2 <- as.Date("2/2/2007", format = "%d/%m/%Y")
subdata <- subset(data, as.Date(Date,format = "%d/%m/%Y" )>= date1 & as.Date(Date,format = "%d/%m/%Y" )<= date2 )
remove(data)    ### Remove entire data set from memory 

##Create the plot 1: Histogram of Global Active Power and print it in png format
hist(subdata$Global_active_power, col= "red", main="Global Active Power", xlab= "Global Active Power (kilowatts)" )
dev.copy(png, "plot1.png", width=504, height=504)
dev.off()