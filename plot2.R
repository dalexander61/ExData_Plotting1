## assumes you've downloaded and unzipped the file in your working directory.

## read, subset and clean data
pdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
pdata$powerDate <- as.Date(pdata$powerDate, format="%d/%m/%Y")  ## convert dates
pdata <- subset(pdata, powerDate=="2007-02-01" | powerDate=="2007-02-02")  ## subset data

pdata$Time <- as.character(pdata$Time)  ## convert times.
dateTime <- as.POSIXct(paste(pdata$powerDate, pdata$Time), format("%Y%m%d %H:%M:%S"))


## Plot of Graph 2 and write to png file
png(filename="plot2.png")
plot(x=dateTime, y=as.numeric(pdata$Global_active_power)/500, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
