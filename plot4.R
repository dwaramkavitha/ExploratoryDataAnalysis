library(data.table)
library(dplyr)

powerConsumptionData<-fread("./household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",na.strings = "?")[Date %in% c("1/2/2007","2/2/2007")]

powerConsumptionData<-mutate(powerConsumptionData,DateTime=paste(powerConsumptionData$Date,powerConsumptionData$Time))
powerConsumptionData$DateTime<-strptime(powerConsumptionData$DateTime,"%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png",width=480,height = 480)
par(mfrow=c(2,2))
with(powerConsumptionData,{
  plot(DateTime,Global_active_power,type="s",xlab = "",ylab = "Global Active Power")
  plot(DateTime,Voltage,type="s",xlab = "datetime",ylab = "Voltage")
  plot(DateTime,Sub_metering_1,type="n",xlab = "",ylab = "Energy Sub Metering")
  points(DateTime,Sub_metering_1,col="black",type="l")
  points(DateTime,Sub_metering_2,col="red",type="l")
  points(DateTime,Sub_metering_3,col="blue",type="l")
  legend("topright",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(DateTime,Global_reactive_power,type="l",xlab = "datetime")})
dev.off()

