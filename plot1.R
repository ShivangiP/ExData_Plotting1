data_file<-"C:/Users/pande/Desktop/Coursera/household_power_consumption/household_power_consumption.txt"
data<-read.table(data_file,header=TRUE,sep=";",stringsAsFactors = FALSE, dec=".",na.strings="?")

#Defining date column format

data$Date<-as.Date(data$Date,format="%d/%m/%Y")

#Subsetting data

data_sub<-subset(data,subset=(Date>="2007-02-01" & Date<="2007-02-02"))
globalactivepower<-as.numeric(data_sub$Global_active_power)

#png("plot1.png", width=480, height=480)
hist(globalactivepower,main="Global Active Power", xlab="Global Active Power (kilowatts)",ylab="Frequency",col="Red")

##saving graph to a file 
dev.copy(png,file="plot1.png",height=480,width=480)
dev.off()