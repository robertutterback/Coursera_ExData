#!/usr/bin/Rscript

## To avoid duplication, util.R contains the code to read in the
## data. This file is included in the repo, so all plots are still
## reproducible.
source("util.R")

plot2 <- function(data)
{
    with(data, plot(datetime, Global_active_power, type="l",
                    xlab="", ylab="Global Active Power (kilowatts)"))
}

main <- function()
{
    png(filename = "plot2.png", width=480, height=480)
    power <- getData()
    plot2(power)
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
