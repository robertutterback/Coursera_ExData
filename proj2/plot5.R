#!/usr/bin/Rscript
## Question 5
##
## How have emissions from motor vehicle sources changed from
## 1999–2008 in Baltimore City?
library(ggplot2)

plot5 <- function(nei, sccs, location = "24510")
{
    data <- aggregate(Emissions ~ year, mean,
                      data=subset(nei, SCC %in% sccs & fips == location))
    plt <- qplot(year, Emissions, data=data, geom="line",
                 main="Motor Vehicle Emissions in Baltimore City")
    print(plt)
}

main <- function()
{
    png(filename = "plot5.png", width=480, height=480)
    nei <- readRDS("summarySCC_PM25.rds")
    scc <- readRDS("Source_Classification_Code.rds")
    ind <- grep("Vehicle",scc$Short.Name)
    plot5(nei, scc[ind,]$SCC)
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
