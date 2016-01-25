## Set working directory appropriate to your system
setwd("C:/Users/my lapy/Desktop/Data Science/coursera data scientist specilization/4----exploratory data analysis/week 4/NEI_data")

## Read Files & View for easy understanding
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(tidyr)
View(SCC)
View(NEI)

## Extract coal based SCC values
SCC$EI.Sector=as.character(SCC$EI.Sector)
SCC$SCC=as.character(SCC$SCC)
Coal_SCC = SCC$SCC[grep("Coal",SCC$EI.Sector)]
NEI$SCC = as.character(NEI$SCC)

## Subsetting function :
Coal_subset <- function (NEI,Coal_SCC)
{
  Coal_PM = c()
  for (i in Coal_SCC)
  {
    pm = subset(NEI,NEI$SCC==i)
    Coal_PM = rbind(Coal_PM,pm)
    
  }
  return(Coal_PM)
}

Coal_PM = Coal_subset(NEI,Coal_SCC)

## Calculate_PM2.5 levels
PM_2.5_1999 = subset(Coal_PM,Coal_PM$year==1999)
PM_2.5_2002 = subset(Coal_PM,Coal_PM$year==2002)
PM_2.5_2005 = subset(Coal_PM,Coal_PM$year==2005)
PM_2.5_2008 = subset(Coal_PM,Coal_PM$year==2008)

## Create year vector
Year = c(1999,2002,2005,2008)

## Create Total_PM2.5 vector
PM_2.5_1999 = sum(PM_2.5_1999$Emissions)
PM_2.5_2002 = sum(PM_2.5_2002$Emissions)
PM_2.5_2005 = sum(PM_2.5_2005$Emissions)
PM_2.5_2005 = sum(PM_2.5_2008$Emissions)

Total_PM25 = c(PM_2.5_1999,PM_2.5_2002,PM_2.5_2005,PM_2.5_2005)

png("plot4.png",width=480,height=480)
plot(Year,Total_PM25,type="b",main="Total PM 2.5 by Year from Coal Source",col="red",pch=2)
dev.off()