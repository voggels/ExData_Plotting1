data<-read.table("household_power_consumption.txt",header=TRUE,sep =";",na.strings="?") 
data$Date<-strptime(data$Date,format="%d/%m/%Y")
datasubset<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

hist(datasubset$Global_active_power,main=paste("Global Active Power"),
     xlab="Global Active Power (kilowatts)",col="Red")

dev.copy(png, file="plot1.png",height=480,width=480)
dev.off()