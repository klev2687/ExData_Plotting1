library(sqldf)
library(dplyr)

plotdata<-read.csv.sql("household_power_consumption.txt", 
                   sql = "select * from file
                   where Date in ('1/2/2007', '2/2/2007')", sep = ";")

png(filename = "plot1.png", width = 480, height = 480)

hist(plotdata$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")

dev.off()