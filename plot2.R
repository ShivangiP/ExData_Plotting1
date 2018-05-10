data_file<-"C:/Users/pande/Desktop/Coursera/household_power_consumption/household_power_consumption.txt"
data<-read.table(data_file,header=TRUE,sep=";",stringsAsFactors = FALSE, dec=".")

#Subsetting data

data_sub<-data[data$Date %in% c("1/2/2007","2/2/2007") , ]
global_active_power1<-as.numeric(data_sub$Global_active_power)
datetime1 <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(datetime1, global_active_power1, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()