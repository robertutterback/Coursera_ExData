#!/usr/bin/Rscript

## To avoid duplication, util.R contains the code to read in the
## data. This file is included in the repo, so all plots are still
## reproducible.
source("util.R")

plot4 <- function(data)
{
    par(mfrow=c(2,2))

    ## Top left (same as plot 2 of the assignment)
    source("plot2.R")
    plot2(data)
    
    ## Top right
    with(data, plot(datetime, Voltage, type="n"))
    with(data, lines(datetime, Voltage))

    ## Bottom left (same as plot 3 of the assignment)
    source("plot3.R")
    plot3(data, legendBorder=FALSE)
    
    ## Bottom right
    with(data, plot(datetime, Global_reactive_power, type="n"))
    with(data, lines(datetime, Global_reactive_power))
}

main <- function()
{
    png(filename = "plot4.png", width=480, height=480)
    power <- getData()
    plot4(power)
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
