#Plot 4

library(data.table)

## Read the data file and subset between dates 1/2/2007 & 2/2/2007
data <- fread("household_power_consumption.txt", na.strings= "?", sep=";", stringsAsFactors = FALSE, header = TRUE)
date1 <- as.Date("1/2/2007", format = "%d/%m/%Y")
date2 <- as.Date("2/2/2007", format = "%d/%m/%Y")
subdata <- subset(data, as.Date(Date,format = "%d/%m/%Y" )>= date1 & as.Date(Date,format = "%d/%m/%Y" )<= date2 )
remove(data)    ### Remove entire data set from memory 
time1 <-paste(subdata$Date, subdata$Time)  ###we combine date and time values



##Create the plot 4: multiple graphics in one file
png("plot4.png", width=504, height=504)

###define 4 plots
par(mfrow= c(2,2))

###Graphics on top-left side
plot(strptime(time1, "%d/%m/%Y %H:%M:%S"), subdata$Global_active_power, type= "l", xlab="", ylab="Global Active Power")

###Graphics on top-right side
plot(strptime(time1, "%d/%m/%Y %H:%M:%S"), subdata$Voltage, type= "l", xlab="datetime", ylab="Voltage")

###Graphics on bottom-left side
plot(strptime(time1, "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_1, type= "l", xlab="", ylab="Energy sub metering")
lines(strptime(time1, "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_2, col="red")
lines(strptime(time1, "%d/%m/%Y %H:%M:%S"), subdata$Sub_metering_3, col="blue")
legend("topright" ,bty="n", col=c("black", "red", "blue"), legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

###Graphics on bottom-right side
plot(strptime(time1, "%d/%m/%Y %H:%M:%S"), subdata$Global_reactive_power, type= "l", xlab="datetime", ylab="Global_reactive_power")

dev.off()



