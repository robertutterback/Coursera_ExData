## Utility function to read in data.
getData <- function(dataFile = "household_power_consumption.txt",
                    beginDate = as.POSIXct("2007-02-01 00:00:00"),
                    endDate = as.POSIXct("2007-02-03 00:00:00"))
{
    # This file is big enough that it would be worth turning it into a database...
    data <- read.table(text = grep("^[1,2]/2/2007", readLines(dataFile), value=TRUE),
                       sep=";", na.strings = '?',
                       col.names = c("Date", "Time", "Global_active_power",
                                     "Global_reactive_power", "Voltage",
                                     "Global_intensity", "Sub_metering_1",
                                     "Sub_metering_2", "Sub_metering_3"))

    data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

    unneeded <- c("Date", "Time")
    data <- data[, !(names(data) %in% unneeded)]
    return(data)
}
