##Read data file (in local directory) into a DF
epcDF <- read.csv("./household_power_consumption.txt", header = TRUE, 
                  sep = ";", stringsAsFactors = FALSE)

## Sub-set to the required dates of 1st-2nd Feb 2007
epcdf1 <- subset(epcDF,(as.Date(epcDF$Date,"%d/%m/%Y")=="2007-02-01" | 
                          as.Date(epcDF$Date,"%d/%m/%Y")=="2007-02-02" ))

## Open PNG file in local directory
png(filename = "./plot1.png")

## Plot the histogram
hist(as.numeric(epcdf1$Global_active_power), col="red", main = "Global Active Power", 
     xlab = "Global Active Power(kilowatts)",ylab = "Frequency",ylim = c(0,1200))

## Close the PNG file
dev.off()
