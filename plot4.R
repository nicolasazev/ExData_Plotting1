### read the data
data = read.table("household_power_consumption.txt", sep=";")
### changing the column classes to character
newData = sapply(data, as.character) 
### get the first row as column names
colnames(newData) = newData[1, ]
### transform to dataframe
dataf= as.data.frame(newData[-1,], stringsAsFactors=F)
#### subset data 
dataToUse = subset(dataf, Date =="1/2/2007" | Date == "2/2/2007")
### plot chart & save as png
png(filename = "plot4.png")
dateTime = as.POSIXct(paste(dataToUse$Date, dataToUse$Time), format="%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2))
# first plot
plot(dateTime,
     dataToUse$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
# second plot
plot(dateTime, dataToUse$Voltage, type="l", ylab="Voltage", xlab="datetime")
# third plot
plot(dateTime, dataToUse$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(dateTime, dataToUse$Sub_metering_2, type="l", col="red")
lines(dateTime, dataToUse$Sub_metering_3, type="l", col="blue")
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1,
       bty = "n")
# fourth plot
plot(dateTime,
     dataToUse$Global_reactive_power,
     type="l",
     ylab="Global_reactive_power",
     xlab="datetime")
dev.off()
