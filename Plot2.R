#Plot 2

library(data.table)
library(lubridate)

## Read the data file and subset between dates 1/2/2007 & 2/2/2007
data <- fread("household_power_consumption.txt", na.strings= "?", sep=";", stringsAsFactors = FALSE, header = TRUE)
date1 <- as.Date("1/2/2007", format = "%d/%m/%Y")
date2 <- as.Date("2/2/2007", format = "%d/%m/%Y")
subdata <- subset(data, as.Date(Date,format = "%d/%m/%Y" )>= date1 & as.Date(Date,format = "%d/%m/%Y" )<= date2 )
remove(data)    ### Remove entire data set from memory 
time1 <-paste(subdata$Date, subdata$Time)  ###we combine date and time values


##Create the plot 2: Line plot of Global Active Power depending on time
plot(strptime(time1, "%d/%m/%Y %H:%M:%S"), subdata$Global_active_power, type= "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()