temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data<-read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep=";")
unlink(temp)

par(mfrow=c(2,2))
data1<-subset(data,data$Date=="2/2/2007" | data$Date=="1/2/2007")
data1$DateTime=paste(data1$Date," ",data1$Time)
data1$DateTime=as.POSIXct(strptime(data1$DateTime,format="%d/%m/%Y %H:%M:%S","GMT"))

plot(data1$DateTime,data1$Global_active_power,type = "l",ylab="Global Active Power (kilowatts)",xlab="DateTime")

plot(data1$DateTime,data1$Voltage,type = "l",ylab="Voltage",xlab="DateTime")

plot(data1$DateTime,data1$Sub_metering_1,type = "l",col="black",ylab = "Energy Sub Metering" , xlab = "DateTime")
lines(data1$DateTime,data1$Sub_metering_3,type = "l",col="blue")
lines(data1$DateTime,data1$Sub_metering_2,type = "l",col="red")
legend("topright",col=c("black","blue","red"),c("Sub metering 1","Sub metering 2","Sub metering 3"),lty=1)

plot(data1$DateTime,data1$Global_reactive_power,type = "l",ylab="Global Reactive Power",xlab="DateTime")

dev.copy(png,"Plot4.png",width="480",height="480")
dev.off()
