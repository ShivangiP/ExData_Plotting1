data_file<-"C:/Users/pande/Desktop/Coursera/household_power_consumption/household_power_consumption.txt"
data<-read.table(data_file,header=TRUE,sep=";",stringsAsFactors = FALSE, dec=".")

#Subsetting data

data_sub<-data[data$Date %in% c("1/2/2007","2/2/2007") , ]

datetime1 <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

submetering1<-as.numeric(data_sub$Sub_metering_1)
submetering2<-as.numeric(data_sub$Sub_metering_2)
submetering3<-as.numeric(data_sub$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime1, submetering1<-as.numeric(data_sub$Sub_metering_1), type="l", xlab="", ylab="Energy Submetering")
lines(datetime1,submetering2, type="l",col="red")
lines(datetime1,submetering3, type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()