suppressWarnings(library(data.table)) # For %between%
suppressWarnings(library(plyr)) # For rename

getData <- function(dataFile = "household_power_consumption.txt",
                    beginDate = as.POSIXct("2007-02-01 00:00:00"),
                    endDate = as.POSIXct("2007-02-03 00:00:00"))
{
    # This file is big enough that it would be worth turning it into a database...
    data <- read.csv(file=dataFile, sep=";", na.strings = "?", nrows=100000)

    # We only care about a 2-day range
    data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
    data <- subset(data, datetime %between% c(beginDate,endDate))

    unneeded <- c("Date", "Time")
    data <- data[, !(names(data) %in% unneeded)]
    return(data)
}

# This function only collects the lines that we need. Unfortunately,
# it is actually slower than the above, and I'm not going to spend any
# more time on it.
getDataAlt <- function(dataFile = "household_power_consumption.txt",
                    beginDate = as.POSIXct("2007-02-01 00:00:00"),
                    endDate = as.POSIXct("2007-02-03 00:00:00"))
{
    size <- 2881 # Luckily, I know this ahead of time...
    data <- data.frame(as.POSIXct(1:size, origin=Sys.Date()),
                       Global_active_power = numeric(size),
                       Global_reactive_power = numeric(size),
                       Voltage = numeric(size),
                       Global_intensity = numeric(size),
                       Sub_metering_1 = integer(size),
                       Sub_metering_2 = integer(size),
                       Sub_metering_3 = integer(size))

    ## Now let's actually read the file.
    con <- file(dataFile, open="r")
    while (length(line <- readLines(con, n=1, warn=FALSE)) > 0) {
        lineData <- strsplit(line, ";")[[i]]
        
        ## Read the components
        datetime <- as.POSIXct(paste(lineData[1], lineData[2]),
                               format="%d/%m/%Y %H:%M:%S")
        nums <- as.list(suppressWarnings(as.numeric(lineData[3:6])))
        ints <- as.list(suppressWarnings(as.integer(lineData[7:9])))

        tmp <- data.frame(datetime, nums, ints)
        names(tmp) <- names(data)
        data <- rbind(data, tmp)
    }
    close(con)
    return(data)
}



