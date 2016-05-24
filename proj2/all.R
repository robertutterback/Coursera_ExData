#!/usr/bin/Rscript
## Produce all plots for project 2.

nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")


for (i in 1:6) {
    name <- paste0("plot", i)
    png(filename = paste0(name, ".png"), width=480, height=480)

    source(paste0(name, ".R"))
    get(name)(nei)
    
    dev.off()

}
