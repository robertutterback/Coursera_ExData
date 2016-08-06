#!/usr/bin/Rscript
## Produce all plots for project 2.

options(run.main=FALSE)
nei <- readRDS("summarySCC_PM25.rds")
scc <- readRDS("Source_Classification_Code.rds")

plot1.helper <- function() { plot1(nei) }
plot2.helper <- function() { plot2(nei) }
plot3.helper <- function() { plot3(nei) }
plot4.helper <- function()
{
    ind <- grep("Coal",scc$Short.Name)
    plot4(nei, scc[ind,]$SCC)
}
plot5.helper <- function()
{
    ind <- grep("Vehicle",scc$Short.Name)
    plot5(nei, scc[ind,]$SCC)
}
plot6.helper <- function()
{
    ind <- grep("Vehicle",scc$Short.Name)
    plot6(nei, scc[ind,]$SCC)
}

for (i in 1:6) {
    print(paste("Plotting", i))
    name <- paste0("plot", i)
    png(filename = paste0(name, ".png"), width=480, height=480)

    source(paste0(name, ".R"))
    get(paste0(name,".helper"))()
    dev.off()

}
