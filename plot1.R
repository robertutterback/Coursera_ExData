#!/usr/bin/Rscript

## To avoid duplication, util.R contains the code to read in the
## data. This file is included in the repo, so all plots are still
## reproducible.
source("util.R")

plot1 <- function(data)
{
    hist(data$Global_active_power, col="red",
         xlab="Global Active Power (kilowatts)",
         main="Global Active Power")
}


main <- function()
{
    png(filename = "plot1.png", width=480, height=480)
    power <- getData()
    plot1(power)
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}

