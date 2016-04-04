fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = 
                    "./exdata-data-household_power_consumption.zip",
              mode = "wb")

file <- unzip(zipfile = "./exdata-data-household_power_consumption.zip")

pwrData <- read.table(file, header = TRUE, sep = ";", 
                      stringsAsFactors = FALSE, dec = ".")

subdata <- pwrData[pwrData$Date %in% c("1/2/2007", "2/2/2007"), ]

timestamp <- strptime(paste(subdata$Date, subdata$Time, sep=" "),
                      "%d/%m/%Y %H:%M:%S") 

submet1 <- as.numeric(subdata$Sub_metering_1)
submet2 <- as.numeric(subdata$Sub_metering_2)
submet3 <- as.numeric(subdata$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

plot(timestamp, as.numeric(subdata$Global_active_power), type = "l",
     xlab = "", ylab = "Global Active Power")

plot(timestamp, as.numeric(subdata$Voltage), type = "l", 
     xlab = "datetime",
     ylab = "Voltage")

plot(timestamp, submet1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(timestamp, submet2, col = "red")
lines(timestamp, submet3, col = "blue")

legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), 
       lty = 1, lwd = 2, bty = "n")

plot(timestamp, as.numeric(subdata$Global_reactive_power), type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()






