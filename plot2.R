# code to load
p <- "../DataSets/household_power_consumption.txt"
PD <- read.table(p,sep = ";",header = T,na.strings = "?")
PD <- subset(PD,PD$Date %in% c("1/2/2007","2/2/2007"))
PD$DateTime <- strptime(paste(PD$Date,PD$Time),"%d/%m/%Y %H:%M:%S")
PD <- PD[,!names(PD)=="Time"]
PD <- PD[,!names(PD)=="Date"]


png(filename = "Plot2.png")

##plot 2
plot(PD$DateTime,PD$Global_active_power,type = "l"
     ,xlab = ""
     ,ylab = "Global Active Power (kilowatts)"
)

dev.off()

