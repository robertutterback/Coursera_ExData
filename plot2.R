#!/usr/bin/Rscript
source("util.R")

plot2 <- function(data)
{
    with(data, plot(datetime, Global_active_power, type="n",
                   xlab="", ylab="Global Active Power (kilowatts)"))
    with(data, lines(datetime, Global_active_power))
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
