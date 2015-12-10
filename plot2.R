library(sqldf)
library(dplyr)
library(lubridate)

plotdata<-read.csv.sql("household_power_consumption.txt", 
                       sql = "select * from file
                       where Date in ('1/2/2007', '2/2/2007')", sep = ";")

plotdata<-mutate(plotdata, Date.Time=paste(Date, Time))

plotdata$Date.Time<-dmy_hms(plotdata$Date.Time)

png(filename = "plot2.png", width = 480, height = 480)

plot(plotdata$Global_active_power~plotdata$Date.Time, type = "l", ylab = "Global Active Power (kilowatts)", xlab="")

dev.off()