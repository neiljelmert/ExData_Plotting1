fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl, destfile = 
                  "./exdata-data-household_power_consumption.zip",
                  mode = "wb")

file <- unzip(zipfile = "./exdata-data-household_power_consumption.zip")

pwrData <- read.table(file, header = TRUE, sep = ";", 
                   stringsAsFactors = FALSE, dec = ".")

subdata <- pwrData[pwrData$Date %in% c("1/2/2007", "2/2/2007"), ]

png("plot1.png", width = 480, height = 480)
hist(as.numeric(subdata$Global_active_power), 
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
