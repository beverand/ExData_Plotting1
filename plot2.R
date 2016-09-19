datafile <- "household_power_consumption.txt"

dat<- fread(datafile, na.strings = c("NA", "N/A", "null", '?'))
datset<-subset(dat, Date %in% c('2/1/2007','2/2/2007'))
datset<- mutate(datset, dt= paste(datset$Date, datset$Time, sep=" " ))
datset$dt<-strptime(datset$dt,format="%m/%d/%Y %H:%M:%S")

plot(datset$dt, datset$Voltage, type='l', col='black', xlab="datetime", ylab="Voltage")
dev.copy(png, file="plot2.png", width=480, height=480)