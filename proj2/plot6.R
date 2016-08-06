#!/usr/bin/Rscript
## Question 6
##
## Compare emissions from motor vehicle sources in Baltimore City with
## emissions from motor vehicle sources in Los Angeles County,
## California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes
## over time in motor vehicle emissions?
library(ggplot2)

plot6 <- function(nei, sccs, locations = c("24510","06037"))
{
    data <- aggregate(Emissions ~ year * fips, mean,
                      data=subset(nei, SCC %in% sccs & fips %in% locations))
    plt <- qplot(year, Emissions, facets=.~fips, data=data, geom="line", color=fips,
                 main="Baltimore City vs. Los Angeles County Motor Vehicle Emissions")
    print(plt)
}

main <- function()
{
    png(filename = "plot6.png", width=480, height=480)
    nei <- readRDS("summarySCC_PM25.rds")
    scc <- readRDS("Source_Classification_Code.rds")
    ind <- grep("Vehicle",scc$Short.Name)
    plot6(nei, scc[ind,]$SCC)
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
