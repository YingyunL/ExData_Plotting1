
a=read.table("household_power_consumption.txt", 
             header=TRUE, 
             na.strings="?", 
             sep=";", 
             as.is=TRUE)
a=a[a[,1]=="2/2/2007" | a[,1]=="1/2/2007", ] #subset to these rows
datetime <- paste(a[,1], a[,2])
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
a <- cbind(datetime, a[,3:9])

png(filename="plot3.png")
plot(a[,1], a[,6], 
     type="l", 
     xlab="", 
     ylab="Energy sub metering")
lines(a[,1], a[,7], 
      type="l", 
      col="red")
lines(a[,1], a[,8], 
      type="l", 
      col="blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2","Sub_metering_3" ), 
       lty=1, 
       col=c("black", "red", "blue"))
dev.off()
