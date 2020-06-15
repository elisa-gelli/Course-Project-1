data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F, na.strings="?")
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

data2<-subset(data,Date%in%as.Date(c("2007-02-01","2007-02-02")))
head(data2)
data2$DateTime=as.POSIXct(paste(data2$Date,data2$Time))
data2$Global_active_power<-as.numeric(data2$Global_active_power)
DateTime<-data2$DateTime

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(x=DateTime,y=data2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(x=DateTime,y=data2$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(x=DateTime,y=data2$Sub_metering_1,xlab="",type="l",ylab="Energy sub metering")
lines(x=DateTime,y=data2$Sub_metering_2,col="red")
lines(x=DateTime,y=data2$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(x=DateTime,y=data2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
