fileUrl <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = 
                    "./exdata-data-household_power_consumption.zip",
              mode = "wb")

file <- unzip(zipfile = "./exdata-data-household_power_consumption.zip")

pwrData <- read.table(file, header = TRUE, sep = ";", 
                      stringsAsFactors = FALSE, dec = ".")

subdata <- pwrData[pwrData$Date %in% c("1/2/2007", "2/2/2007"), ]

timestamp <- strptime(paste(subdata$Date, subdata$Time, sep=" "),
                     "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width = 480, height = 480)
plot(timestamp, as.numeric(subdata$Global_active_power), type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()

