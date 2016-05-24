#!/usr/bin/Rscript
## Question 1:
## 
## Have total emissions from PM2.5 decreased in the United
## States from 1999 to 2008? Using the base plotting system, make a
## plot showing the total PM2.5 emission from all sources for each of
## the years 1999, 2002, 2005, and 2008.

plot1 <- function(nei)
{
    ## Sum by year
    data <- aggregate(Emissions ~ year, sum, data=nei)

    ## Scale data
    data <- transform(data, Emissions = Emissions / 1000)
    
    barplot(data$Emissions, names.arg=data$year,
            xlab="Year", ylab="PM2.5 Emissions (thousands of tons)",
            main="Total PM2.5 Emissions by Year")    
}

main <- function()
{
    png(filename = "plot1.png", width=480, height=480)
    nei <- readRDS("summarySCC_PM25.rds")
    plot1(nei)
    dev.off()
}

if (getOption('run.main', default=TRUE)) {
    options(run.main=FALSE)
    main()
}
