##Read data file (in local directory) into a DF
epcDF <- read.csv("./household_power_consumption.txt", header = TRUE, 
                  sep = ";", stringsAsFactors = FALSE)

## Sub-set to the required dates of 1st-2nd Feb 2007
epcdf1 <- subset(epcDF,(as.Date(epcDF$Date,"%d/%m/%Y")=="2007-02-01" | 
                          as.Date(epcDF$Date,"%d/%m/%Y")=="2007-02-02" ))

## Add a new column DateTime
epcdf1$DateTime <- strptime(paste(epcdf1$Date,epcdf1$Time),"%d/%m/%Y %H:%M:%S")

## Open PNG file in local directory
png(filename = "./plot3.png")

## Plot the data
with(epcdf1, plot(DateTime, Sub_metering_1, type="n", 
                  ylab = "Energy sub metering", xlab=""))
with(epcdf1, lines(DateTime, Sub_metering_1, col="black"))
with(epcdf1, lines(DateTime, Sub_metering_2, col="red"))
with(epcdf1, lines(DateTime, Sub_metering_3, col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Close the PNG file
dev.off()

