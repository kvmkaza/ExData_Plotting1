##Read data file (in local directory) into a DF
epcDF <- read.csv("./household_power_consumption.txt", header = TRUE, 
                  sep = ";", stringsAsFactors = FALSE)

## Sub-set to the required dates of 1st-2nd Feb 2007
epcdf1 <- subset(epcDF,(as.Date(epcDF$Date,"%d/%m/%Y")=="2007-02-01" | 
                          as.Date(epcDF$Date,"%d/%m/%Y")=="2007-02-02" ))

## Add a new column DateTime
epcdf1$DateTime <- strptime(paste(epcdf1$Date,epcdf1$Time),"%d/%m/%Y %H:%M:%S")

## Open PNG file in local directory
png(filename = "./plot2.png")

## Plot the data
plot(epcdf1$DateTime,epcdf1$Global_active_power,type="l", 
     ylab = "Global Active Power(kilowatts)", xlab="")

## Close the PNG file
dev.off()

