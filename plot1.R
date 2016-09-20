datafile <- "household_power_consumption.txt"

dat<- fread(datafile, na.strings = c("NA", "N/A", "null", '?'))
datset<-subset(dat, Date %in% c('2/1/2007','2/2/2007'))
datset<- mutate(datset, dt= paste(datset$Date, datset$Time, sep=" " ))
datset$dt<-strptime(datset$dt,format="%m/%d/%Y %H:%M:%S")
par(mfrow=c(1,1))
hist(datset$Global_active_power, ylim=c(0,1200), xlim=c(0,6),col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()