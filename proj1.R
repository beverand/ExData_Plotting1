datafile <- "household_power_consumption.txt"

dat<- fread(datafile, na.strings = c("NA", "N/A", "null", '?'))
datset<-subset(dat, Date %in% c('2/1/2007','2/2/2007'))
datset<- mutate(datset, dt= paste(datset$Date, datset$Time, sep=" " ))
datset$dt<-strptime(datset$dt,format="%m/%d/%Y %H:%M:%S")

#datset$Date<- as.Date(datset$Date, "%m/%d/%Y")
#datset$Time<- as.Date(datset$time, strptime(datset$Time, "%H:%M:%S"))
#dev.copy(png, file="plot1.png")
#hist(datset$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
#dev.off

#plot 2
plot(datset$dt, datset$Global_active_power, xlab="Day", ylab="Global Active Power (kilowatts)", type="l")

#plot 3
plot(datset$dt, datset$Sub_metering_3, type='l', col='blue', xlab="", ylab="Energy sub metering")
lines(datset$dt, datset$Sub_metering_2, col="red")
lines(datset$dt, datset$Sub_metering_1, col="black")
legend("topright", pch=c(0,0,0), col=c("black","red","blue"), c("Sub_metering_1","Sub_metering2","Submetering_3"),bty="n")

#plot4
par(mfrow=c(2,2))
plot(datset$dt, datset$Global_active_power, xlab="Day", ylab="Global Active Power (kilowatts)", type="l")

plot(datset$dt, datset$Sub_metering_3, type='l', col='blue', xlab="", ylab="Energy sub metering")
lines(datset$dt, datset$Sub_metering_2, col="red")
lines(datset$dt, datset$Sub_metering_1, col="black")
legend("topright", pch=c(0,0,0), col=c("black","red","blue"), c("Sub_metering_1","Sub_metering2","Submetering_3"),bty="n")

#plot 4b
plot(datset$dt, datset$Voltage, type='l', col='black', xlab="datetime", ylab="Voltage")

#plot 4d
plot(datset$dt, datset$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")