library(data.table)
library(dplyr)
powerConsumptionData<-fread("./household_power_consumption.txt",stringsAsFactors=FALSE,header=TRUE,sep=";",na.strings = "?")[Date %in% c("1/2/2007","2/2/2007")]
## powerConsumptionData$Date<-as.Date(powerConsumptionData$Date,"%d/%m/%Y")
powerConsumptionData<-mutate(powerConsumptionData,DateTime=paste(powerConsumptionData$Date,powerConsumptionData$Time))
powerConsumptionData$DateTime<-strptime(powerConsumptionData$DateTime,"%d/%m/%Y %H:%M:%S")
png(filename = "plot1.png",width=480,height = 480)
hist(powerConsumptionData$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (Kilowatts)")
dev.off()
  

