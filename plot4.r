library(sqldf)
library(dplyr)
library(lubridate)

plotdata<-read.csv.sql("household_power_consumption.txt", 
                       sql = "select * from file
                       where Date in ('1/2/2007', '2/2/2007')", sep = ";")

plotdata<-mutate(plotdata, Date.Time=paste(Date, Time))

plotdata$Date.Time<-dmy_hms(plotdata$Date.Time)

png(filename = "plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

#plot#1
plot(plotdata$Global_active_power~plotdata$Date.Time, type = "l", ylab = "Global Active Power", xlab="")

#plot#2
plot(plotdata$Sub_metering_1~plotdata$Date.Time, type = "l", ylab = "Energy sub metering", xlab="")
lines(plotdata$Sub_metering_2~plotdata$Date.Time, type = "l", col="red")
lines(plotdata$Sub_metering_3~plotdata$Date.Time, type = "l", col="blue")
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"),lty = 1, bty =  "n")

#plot#3
plot(plotdata$Voltage~plotdata$Date.Time, type="l", xlab="datetime", ylab="Voltage")

#plot#4
plot(plotdata$Global_reactive_power~plotdata$Date.Time, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()