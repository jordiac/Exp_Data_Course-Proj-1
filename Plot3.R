#Plot 3

library(data.table)

## Read the data file and subset between dates 1/2/2007 & 2/2/2007
data <- fread("household_power_consumption.txt", na.strings= "?", sep=";", stringsAsFactors = FALSE, header = TRUE)
date1 <- as.Date("1/2/2007", format = "%d/%m/%Y")
date2 <- as.Date("2/2/2007", format = "%d/%m/%Y")
subdata <- subset(data, as.Date(Date,format = "%d/%m/%Y" )>= date1 & as.Date(Date,format = "%d/%m/%Y" )<= date2 )
remove(data)    ### Remove entire data set from memory 
time1 <-paste(subdata$Date, subdata$Time)  ###we combine date and time values


##Create the plot 3: Line plot of all sub_metering s depending on time
png("plot3.png", width=504, height=504)
plot(strptime(time1, "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_1, type= "l", xlab="", ylab="Energy sub metering")
lines(strptime(time1, "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_2, col="red")
lines(strptime(time1, "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_3, col="blue")
legend("topright" , col=c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()