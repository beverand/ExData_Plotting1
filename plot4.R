datafile <- "household_power_consumption.txt"

dat<- fread(datafile, na.strings = c("NA", "N/A", "null", '?'))
datset<-subset(dat, Date %in% c('2/1/2007','2/2/2007'))
datset<- mutate(datset, dt= paste(datset$Date, datset$Time, sep=" " ))
datset$dt<-strptime(datset$dt,format="%m/%d/%Y %H:%M:%S")

par(mfrow=c(2,2))
#4a
plot(datset$dt, datset$Global_active_power, xlab="Day", ylab="Global Active Power (kilowatts)", type="l")
#4b
plot(datset$dt, datset$Sub_metering_3, type='l', col='blue', xlab="", ylab="Energy sub metering", ylim = c(0,40))
legend("topright", pch="_", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n", inset=c(0,-1.5),cex = 0.75)
lines(datset$dt, datset$Sub_metering_2, col="red")
lines(datset$dt, datset$Sub_metering_1, col="black")
#4c
plot(datset$dt, datset$Voltage, type='l', col='black', xlab="datetime", ylab="Voltage")

#4d
plot(datset$dt, datset$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")


dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
