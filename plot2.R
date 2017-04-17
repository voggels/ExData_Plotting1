data<-read.table("household_power_consumption.txt",header=TRUE,sep =";",na.strings="?") 
data$Date<-strptime(data$Date,format="%d/%m/%Y")
datasubset<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")

datasubset$datetime<-strptime(paste(datasubset$Date,datasubset$Time),"%Y-%m-%d %H:%M:%S")
datasubset$datetime<-as.POSIXct(datasubset$datetime)

plot(datasubset$Global_active_power~datasubset$datetime,
     ylab="Global Active Power (kilowatts)",xlab="",type="l") 
dev.copy(png,file="plot2.png",height=480,width=480) 
dev.off() 
