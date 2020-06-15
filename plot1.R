data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=F, na.strings="?")
data$Date<-as.Date(data$Date,format='%d/%m/%Y')

head(data$Date)
data2<-subset(data,Date%in%as.Date(c("2007-02-01","2007-02-02")))
data2$DateTime=as.POSIXct(paste(data2$Date,data2$Time))

data2$Global_active_power<-as.numeric(data2$Global_active_power)
png("plot1.png", width=480, height=480)
hist(data2$Global_active_power,xlab="Global Active Power(kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.off()
