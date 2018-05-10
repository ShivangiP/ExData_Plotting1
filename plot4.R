data_file<-"C:/Users/pande/Desktop/Coursera/household_power_consumption/household_power_consumption.txt"
data<-read.table(data_file,header=TRUE,sep=";", stringsAsFactors = FALSE, dec=".")

data_sub<-data[data$Date %in% c("1/2/2007","2/2/2007") ,]

datetime<-strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalactivepower<-as.numeric(data_sub$Global_active_power)
globalreactivepower<-as.numeric(data_sub$Global_reactive_power)
voltage<-as.numeric(data_sub$Voltage)

submetering1<-as.numeric(data_sub$Sub_metering_1)
submetering2<-as.numeric(data_sub$Sub_metering_2)
submetering3<-as.numeric(data_sub$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(datetime,globalactivepower,xlab="", type="l",ylab="Global Active Power")

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, submetering1<-as.numeric(data_sub$Sub_metering_1), type="l", xlab="", ylab="Energy Submetering")
lines(datetime,submetering2, type="l",col="red")
lines(datetime,submetering3, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")

plot(datetime,globalreactivepower,xlab="datetime", type="l",ylab="Global_Reactive_Power")

dev.off()