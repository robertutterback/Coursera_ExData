#!/usr/bin/Rscript
## Question 4
##
## Across the United States, how have emissions from coal
## combustion-related sources changed from 1999–2008?
library(ggplot2)

plot4 <- function(nei, sccs)
{
    data <- aggregate(Emissions ~ year, mean,
                      data=subset(nei, SCC %in% sccs))
    plt <- qplot(year, Emissions, data=data, geom="line",
                 main="Coal Combustion-Related Emissions")
    print(plt)
}

main <- function()
{
    png(filename = "plot4.png", width=480, height=480)
    nei <- readRDS("summarySCC_PM25.rds")
    scc <- readRDS("Source_Classification_Code.rds")
    ind <- grep("Coal",scc$Short.Name)
    plot4(nei, scc[ind,]$SCC)
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
