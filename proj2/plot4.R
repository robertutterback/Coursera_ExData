#!/usr/bin/Rscript

## To avoid duplication, util.R contains the code to read in the
## data. This file is included in the repo, so all plots are still
## reproducible.
source("util.R")

main <- function()
{
    png(filename = "plot4.png", width=480, height=480)
    # Code here
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
