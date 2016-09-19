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
### histogram chart & save as png
png(filename = "plot1.png")
hist(as.numeric(dataToUse$Global_active_power),
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()
