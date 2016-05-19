#!/usr/bin/Rscript
## Question 1:
## 
## Have total emissions from PM2.5 decreased in the United
## States from 1999 to 2008? Using the base plotting system, make a
## plot showing the total PM2.5 emission from all sources for each of
## the years 1999, 2002, 2005, and 2008.


## To avoid duplication, util.R contains the code to read in the
## data. This file is included in the repo, so all plots are still
## reproducible.
source("util.R")

main <- function()
{
    png(filename = "plot1.png", width=480, height=480)
    # Code here
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
