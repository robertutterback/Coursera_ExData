#!/usr/bin/Rscript
## Question 3
##
## Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point,
## nonpoint, onroad, nonroad) variable, which of these four sources
## have seen decreases in emissions from 1999–2008 for Baltimore City?
## Which have seen increases in emissions from 1999–2008? Use the
## ggplot2 plotting system to make a plot answer this question.

## To avoid duplication, util.R contains the code to read in the
## data. This file is included in the repo, so all plots are still
## reproducible.
source("util.R")

main <- function()
{
    png(filename = "plot3.png", width=480, height=480)
    # Code here
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
