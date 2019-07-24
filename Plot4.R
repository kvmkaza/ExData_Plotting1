library(sqldf)

##Read data file (in local directory) into a DF for the selected dates of 1st/2nd Feb 2007
epcDF <- read.csv.sql("./household_power_consumption.txt",
                         sql="select * from file where Date='1/2/2007' OR Date='2/2/2007' ", 
                         header=TRUE, sep=";")

## Add a new column DateTime
epcDF$DateTime <- strptime(paste(epcDF$Date,epcDF$Time),"%d/%m/%Y %H:%M:%S")

## Open PNG file in local directory
png(filename = "./plot4.png")

## Set to draw 2/2 plots
par("mfrow"=c(2,2))

## Plot the data
with(epcDF,{
  
  plot(DateTime,Global_active_power,type="l", 
       ylab = "Global Active Power", xlab="") })

with(epcDF,plot(DateTime,Voltage, type="l", ylab="Voltage",xlab="datetime"))

with(epcDF, {
  plot(DateTime, Sub_metering_1, type="n", 
       ylab = "Energy sub metering", xlab="")
  
  lines(DateTime, Sub_metering_1, col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", lty=1, col=c("black","red","blue"),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
})

with(epcDF,plot(DateTime,Global_reactive_power,type="l", 
                 ylab = "Global Reactive Power", xlab="datetime"))


## Close the PNG file
dev.off()
