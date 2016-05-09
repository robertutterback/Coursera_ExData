#!/usr/bin/Rscript

## To avoid duplication, util.R contains the code to read in the
## data. This file is included in the repo, so all plots are still
## reproducible.
source("util.R")

plot3 <- function(data, legendBorder = TRUE)
{
    plotLines <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
    colors <- c("black", "red", "blue")
    
    with(data, plot(datetime, Sub_metering_1, type="n",
                   xlab="", ylab="Energy sub metering"))
    for (i in 1:length(plotLines)) {
        with(data, lines(datetime, data[,plotLines[i]], col=colors[i]))
    }
    if (legendBorder) {
        legend("topright", lty=1, col=colors, legend=plotLines)
    } else {
        legend("topright", lty=1, col=colors, legend=plotLines,
               box.lwd = 0, box.col = "white", bg = "white")
    }
}

main <- function()
{
    png(filename = "plot3.png", width=480, height=480)
    power <- getData()
    plot3(power)
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
