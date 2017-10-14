## assumes you've downloaded and unzipped the file in your working directory.

## read, subset and clean data
pdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
pdata$powerDate <- as.Date(pdata$powerDate, format="%d/%m/%Y")  ## convert dates
pdata <- subset(pdata, powerDate=="2007-02-01" | powerDate=="2007-02-02")  ## subset data

pdata$Time <- as.character(pdata$Time)  ## convert times.


## Plot of Graph 1 and write to png file
png(filename="plot1.png")
hist(as.numeric(pdata$Global_active_power)*.002, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts")
dev.off()

