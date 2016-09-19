### read the data
data = read.table("household_power_consumption.txt", sep=";")
### changing the column classes to character
newData = sapply(data, as.character) 
### get the first row as column names
colnames(newData) = newData[1, ]
### transform to dataframe
dataf= as.data.frame(newData[-1,], stringsAsFactors=F)
### subset data 
dataToUse = subset(dataf, Date =="1/2/2007" | Date == "2/2/2007")
### plot chart & save as png
png(filename = "plot2.png")
dateTime = as.POSIXct(paste(dataToUse$Date, dataToUse$Time), format="%d/%m/%Y %H:%M:%S")
plot(dateTime,
     dataToUse$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")
dev.off()
