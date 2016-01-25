## Set working directory appropriate to your system
setwd("C:/Users/my lapy/Desktop/Data Science/coursera data scientist specilization/4----exploratory data analysis/week 4/NEI_data")

## Read Files & View for easy understanding
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
library(tidyr)
View(SCC)
View(NEI)

## Subset data
Baltimore_City = subset(NEI,NEI$fips== "24510")

Vehicle_source_BC = subset(Baltimore_City,Baltimore_City$type=="NON-ROAD"|Baltimore_City$type=="ON-ROAD")

## Calculate_PM2.5 levels
PM_2.5_1999_BC = subset(Vehicle_source_BC,Vehicle_source_BC$year==1999)
PM_2.5_2002_BC = subset(Vehicle_source_BC,Vehicle_source_BC$year==2002)
PM_2.5_2005_BC = subset(Vehicle_source_BC,Vehicle_source_BC$year==2005)
PM_2.5_2008_BC = subset(Vehicle_source_BC,Vehicle_source_BC$year==2008)




## Create Total_PM2.5 vector
PM_2.5_1999_BC = sum(PM_2.5_1999_BC$Emissions)
PM_2.5_2002_BC = sum(PM_2.5_2002_BC$Emissions)
PM_2.5_2005_BC = sum(PM_2.5_2005_BC$Emissions)
PM_2.5_2005_BC = sum(PM_2.5_2008_BC$Emissions)

Total_PM25_BC = c(PM_2.5_1999_BC,PM_2.5_2002_BC,PM_2.5_2005_BC,PM_2.5_2005_BC)



Los_Angeles = subset(NEI,NEI$fips== "06037")

Vehicle_source_LA = subset(Los_Angeles,Los_Angeles$type=="NON-ROAD"|Los_Angeles$type=="ON-ROAD")

## Calculate_PM2.5 levels
PM_2.5_1999_LA = subset(Vehicle_source_LA,Vehicle_source_LA$year==1999)
PM_2.5_2002_LA = subset(Vehicle_source_LA,Vehicle_source_LA$year==2002)
PM_2.5_2005_LA = subset(Vehicle_source_LA,Vehicle_source_LA$year==2005)
PM_2.5_2008_LA = subset(Vehicle_source_LA,Vehicle_source_LA$year==2008)



## Create Total_PM2.5 vector
PM_2.5_1999_LA = sum(PM_2.5_1999_LA$Emissions)
PM_2.5_2002_LA = sum(PM_2.5_2002_LA$Emissions)
PM_2.5_2005_LA = sum(PM_2.5_2005_LA$Emissions)
PM_2.5_2005_LA = sum(PM_2.5_2008_LA$Emissions)

Total_PM25_LA = c(PM_2.5_1999_LA,PM_2.5_2002_LA,PM_2.5_2005_LA,PM_2.5_2005_LA)

## Create  vector
Year = rep(c(1999,2002,2005,2008),2)

Total_PM25 = c(Total_PM25_BC,Total_PM25_LA)
BC = rep("Baltimore City",4)
LA = rep("Los Angeles",4)
City = c(BC,LA)
data=data.frame(Total_PM25,Year,City)

library(ggplot2)
png("plot6.png",width=480,height=480)
ggplot(data=data,aes(x=Year,y=Total_PM25,color=City))+geom_line()+ggtitle("Total PM25 emissions by vehicles in both cities")
dev.off()