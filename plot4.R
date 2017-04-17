data<-read.table("household_power_consumption.txt",header=TRUE,sep =";",na.strings="?") 
data$Date<-strptime(data$Date,format="%d/%m/%Y")
datasubset<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

datasubset$datetime<-strptime(paste(datasubset$Date,datasubset$Time),"%Y-%m-%d %H:%M:%S")
datasubset$datetime<-as.POSIXct(datasubset$datetime)

par(mfrow = c(2, 2))

plot(datasubset$Global_active_power~datasubset$datetime,ylab="Global Active Power",
     xlab="",type="l") 

plot(datasubset$Voltage~datasubset$datetime,ylab="Voltage",xlab="datetime",type="l") 

plot(datasubset$Sub_metering_1~datasubset$datetime,ylab="Energy sub metering",
     xlab="",type="l") 
lines(datasubset$Sub_metering_2~datasubset$datetime,col="Red") 
lines(datasubset$Sub_metering_3~datasubset$datetime,col="Blue") 
legend("topright",x.intersp=2,cex=0.8,inset=0.06,lty=1,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty = "n") 

plot(datasubset$Global_reactive_power~datasubset$datetime,ylab="Global_reactive_power",
     xlab="datetime",type="l") 


dev.copy(png, file = "plot4.png", height = 480, width = 480) 
dev.off()