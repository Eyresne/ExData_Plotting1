# code to load
p <- "../DataSets/household_power_consumption.txt"
PD <- read.table(p,sep = ";",header = T,na.strings = "?")
PD <- subset(PD,PD$Date %in% c("1/2/2007","2/2/2007"))
PD$DateTime <- strptime(paste(PD$Date,PD$Time),"%d/%m/%Y %H:%M:%S")
PD <- PD[,!names(PD)=="Time"]
PD <- PD[,!names(PD)=="Date"]

png(filename = "Plot4.png")

#plot4
par(mfcol= c(2,2))
with(PD,{
  plot(DateTime,Global_active_power,type = "l"
     ,xlab = ""
     ,ylab = "Global Active Power (kilowatts)"
     )
  plot(PD$DateTime,PD$Sub_metering_1,type = "n"
       ,xlab = ""
       ,ylab = "Energy sub metering"
  )
  points(PD$DateTime, PD$Sub_metering_1,col = "blue" , type = "l")
  points(PD$DateTime, PD$Sub_metering_2,col = "red"  , type = "l")
  points(PD$DateTime, PD$Sub_metering_3,col = "green", type = "l")
  legend("topright"
         ,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
         , lwd  = c(1,1,1),col = c("blue","red","green") # lines and colors
         , bty = "n", cex = 0.7 #remove the boc and shrink the legend
         
  )
  plot(DateTime, Voltage, type = "l")
  plot(DateTime, Global_active_power, type = "l")
})
  
dev.off()

