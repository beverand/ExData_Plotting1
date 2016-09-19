datafile <- "household_power_consumption.txt"

dat<- fread(datafile, na.strings = c("NA", "N/A", "null", '?'))
datset<-subset(dat, Date %in% c('2/1/2007','2/2/2007'))
datset<- mutate(datset, dt= paste(datset$Date, datset$Time, sep=" " ))
datset$dt<-strptime(datset$dt,format="%m/%d/%Y %H:%M:%S")

plot(datset$dt, datset$Sub_metering_3, type='l', col='blue', xlab="", ylab="Energy sub metering", ylim = c(0,40))
lines(datset$dt, datset$Sub_metering_2, col="red")
lines(datset$dt, datset$Sub_metering_1, col="black")

legend("topright", pch="_", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="n")

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()