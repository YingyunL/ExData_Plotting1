
a=read.table("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", as.is=TRUE)
a=a[a[,1]=="2/2/2007" | a[,1]=="1/2/2007", ] #subset to these rows
datetime <- paste(a[,1], a[,2])
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
a <- cbind(datetime, a[,3:9])

png(filename="plot1.png")
hist(a[,2], col="red", main="Global Active Power", xlab="Global Active Powerr (kilowatts)")
dev.off()
