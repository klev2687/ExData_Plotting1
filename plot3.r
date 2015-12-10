library(sqldf)
library(dplyr)
library(lubridate)

plotdata<-read.csv.sql("household_power_consumption.txt", 
                       sql = "select * from file
                       where Date in ('1/2/2007', '2/2/2007')", sep = ";")

plotdata<-mutate(plotdata, Date.Time=paste(Date, Time))

plotdata$Date.Time<-dmy_hms(plotdata$Date.Time)

png(filename = "plot3.png", width = 480, height = 480)
plot(plotdata$Sub_metering_1~plotdata$Date.Time, type = "l", ylab = "Energy sub metering", xlab="")
lines(plotdata$Sub_metering_2~plotdata$Date.Time, type = "l", col="red")
lines(plotdata$Sub_metering_3~plotdata$Date.Time, type = "l", col="blue")
legend(x="topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"),lty = 1)

dev.off()





