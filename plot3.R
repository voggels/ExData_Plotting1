data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?") 
data$Date<-strptime(data$Date, format="%d/%m/%Y")
datasubset<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

datasubset$datetime<-strptime(paste(datasubset$Date,datasubset$Time),"%Y-%m-%d %H:%M:%S")
datasubset$datetime<-as.POSIXct(datasubset$datetime)

plot(datasubset$Sub_metering_1~datasubset$datetime,
     ylab="Energy sub metering",xlab="",type="l") 
lines(datasubset$Sub_metering_2~datasubset$datetime, col="Red") 
lines(datasubset$Sub_metering_3~datasubset$datetime, col="Blue") 
legend("topright",x.intersp=2,cex=0.9,inset=0.03,lty=1,bty = "n",col=c("black", "red", "blue"),  
legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")) 

dev.copy(png,file="plot3.png",height=480,width=480) 
dev.off()