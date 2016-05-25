#!/usr/bin/Rscript
## Question 2
##
## Have total emissions from PM2.5 decreased in the Baltimore City,
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting
## system to make a plot answering this question.

plot2 <- function(nei, location)
{
    ## Sum by year, only for the given location
    data <- aggregate(Emissions ~ year, sum,
                      data=subset(nei, fips == location))

    with(data, barplot(Emissions, names.arg=year))
            
    ## Line graph alternative:
    ## with(data, plot(year, Emissions))


    title(xlab="Year", ylab="PM2.5 Emissions (tons)",
          main="PM2.5 Emissions in Baltimore by Year")
}

main <- function()
{
    png(filename = "plot2.png", width=480, height=480)
    nei <- readRDS("summarySCC_PM25.rds")
    plot2(nei, "24510")
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}


