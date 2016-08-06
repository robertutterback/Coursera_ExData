#!/usr/bin/Rscript
## Question 3
##
## Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point,
## nonpoint, onroad, nonroad) variable, which of these four sources
## have seen decreases in emissions from 1999–2008 for Baltimore City?
## Which have seen increases in emissions from 1999–2008? Use the
## ggplot2 plotting system to make a plot answer this question.
library(ggplot2)

plot3 <- function(nei, location = "24510")
{
    ## The question does not specify that we should find the *total*
    ## emission, so I've used the mean, since it handles the fact that
    ## we have different numbers of sources throughout the years.

    ##  Mean by year
    data <- aggregate(Emissions ~ year * type, mean, 
                      data=subset(nei, fips == location))

    ## plt <- qplot(year, Emissions, facets = . ~ type, data = data)
    plt <- qplot(year, Emissions, data = data, color=type, geom="line",
                 main="Emissions in Baltimore City by Source Type")
    print(plt)
}

main <- function()
{
    png(filename = "plot3.png", width=480, height=480)
    nei <- readRDS("summarySCC_PM25.rds")
    plot3(nei)
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
