## assumes you've downloaded and unzipped the file in your working directory.

## read, subset and clean data
pdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
pdata$powerDate <- as.Date(pdata$powerDate, format="%d/%m/%Y")  ## convert dates
pdata <- subset(pdata, powerDate=="2007-02-01" | powerDate=="2007-02-02")  ## subset data

pdata$Time <- as.character(pdata$Time)  ## convert times.
dateTime <- as.POSIXct(paste(pdata$powerDate, pdata$Time), format("%Y%m%d %H:%M:%S"))


## Plot of Graph 3 and write to png file
png(filename="plot3.png")
with(pdata, plot(x=dateTime, y=as.numeric(Sub_metering_1), main = "", xlab="", ylab="Energy sub metering", type="l"))
with(pdata, lines(x=dateTime, y=as.numeric(Sub_metering_2), col="red", type='l'))
with(pdata, lines(x=dateTime, y=as.numeric(Sub_metering_3), col="blue", type='l'))
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), lwd=c(1,1))

dev.off()
