temp<-tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data<-read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep=";")
unlink(temp)


par(mfrow=c(1,1))
hist(as.numeric(data$Global_active_power),xlab = "Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
dev.copy(png,"Plot1.png")
dev.off()
