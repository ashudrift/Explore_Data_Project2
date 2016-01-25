## Set working directory appropriate to your system
setwd("C:/Users/my lapy/Desktop/Data Science/coursera data scientist specilization/4----exploratory data analysis/week 4/NEI_data")

## Read Files & View for easy understanding
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(tidyr)
View(SCC)
View(NEI)
## Calculate_PM2.5 levels
PM_2.5_1999 = subset(NEI,NEI$year==1999)
PM_2.5_2002 = subset(NEI,NEI$year==2002)
PM_2.5_2005 = subset(NEI,NEI$year==2005)
PM_2.5_2008 = subset(NEI,NEI$year==2008)

## Create year vector
Year = c(1999,2002,2005,2008)

## Create Total_PM2.5 vector
PM_2.5_1999 = sum(PM_2.5_1999$Emissions)
PM_2.5_2002 = sum(PM_2.5_2002$Emissions)
PM_2.5_2005 = sum(PM_2.5_2005$Emissions)
PM_2.5_2005 = sum(PM_2.5_2008$Emissions)

Total_PM2.5 = c(PM_2.5_1999,PM_2.5_2002,PM_2.5_2005,PM_2.5_2005)

png("plot1.png",width=480,height=480)
plot(Year,Total_PM2.5,type="b",main="Total PM 2.5 by Year",col="red",pch=2)
dev.off()

