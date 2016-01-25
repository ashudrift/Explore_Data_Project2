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

NON_ROAD = subset(Baltimore_City,Baltimore_City$type=="NON-ROAD")
NONPOINT = subset(Baltimore_City,Baltimore_City$type=="NONPOINT")
ON_ROAD  = subset(Baltimore_City,Baltimore_City$type=="ON-ROAD")
POINT    = subset(Baltimore_City,Baltimore_City$type=="POINT")

## For NON-ROAD

## Calculate_PM2.5 levels
PM_2.5_1999_NR = subset(NON_ROAD,NON_ROAD$year==1999)
PM_2.5_2002_NR = subset(NON_ROAD,NON_ROAD$year==2002)
PM_2.5_2005_NR = subset(NON_ROAD,NON_ROAD$year==2005)
PM_2.5_2008_NR = subset(NON_ROAD,NON_ROAD$year==2008)

## Create year vector
Year = numeric(c(1999,2002,2005,2008))

## Create Total_PM2.5 vector
Total_PM_2.5_1999_NR = sum(PM_2.5_1999_NR$Emissions)
Total_PM_2.5_2002_NR = sum(PM_2.5_2002_NR$Emissions)
Total_PM_2.5_2005_NR = sum(PM_2.5_2005_NR$Emissions)
Total_PM_2.5_2005_NR = sum(PM_2.5_2008_NR$Emissions)

Total_PM2.5_NR = c(Total_PM_2.5_1999_NR,Total_PM_2.5_2002_NR,Total_PM_2.5_2005_NR,Total_PM_2.5_2005_NR)

## For NONPOINT

## Calculate_PM2.5 levels
PM_2.5_1999_NP = subset(NONPOINT,NONPOINT$year==1999)
PM_2.5_2002_NP = subset(NONPOINT,NONPOINT$year==2002)
PM_2.5_2005_NP = subset(NONPOINT,NONPOINT$year==2005)
PM_2.5_2008_NP = subset(NONPOINT,NONPOINT$year==2008)


## Create Total_PM2.5 vector
Total_PM_2.5_1999_NP = sum(PM_2.5_1999_NP$Emissions)
Total_PM_2.5_2002_NP = sum(PM_2.5_2002_NP$Emissions)
Total_PM_2.5_2005_NP = sum(PM_2.5_2005_NP$Emissions)
Total_PM_2.5_2005_NP = sum(PM_2.5_2008_NP$Emissions)

Total_PM2.5_NP = c(Total_PM_2.5_1999_NP,Total_PM_2.5_2002_NP,Total_PM_2.5_2005_NP,Total_PM_2.5_2005_NP)


## For ON_ROAD

## Calculate_PM2.5 levels
PM_2.5_1999_OR = subset(ON_ROAD,ON_ROAD$year==1999)
PM_2.5_2002_OR = subset(ON_ROAD,ON_ROAD$year==2002)
PM_2.5_2005_OR = subset(ON_ROAD,ON_ROAD$year==2005)
PM_2.5_2008_OR = subset(ON_ROAD,ON_ROAD$year==2008)


## Create Total_PM2.5 vector
Total_PM_2.5_1999_OR = sum(PM_2.5_1999_OR$Emissions)
Total_PM_2.5_2002_OR = sum(PM_2.5_2002_OR$Emissions)
Total_PM_2.5_2005_OR = sum(PM_2.5_2005_OR$Emissions)
Total_PM_2.5_2005_OR = sum(PM_2.5_2008_OR$Emissions)

Total_PM2.5_OR = c(Total_PM_2.5_1999_OR,Total_PM_2.5_2002_OR,Total_PM_2.5_2005_OR,Total_PM_2.5_2005_OR)

## For POINT

## Calculate_PM2.5 levels
PM_2.5_1999_P = subset(POINT,POINT$year==1999)
PM_2.5_2002_P = subset(POINT,POINT$year==2002)
PM_2.5_2005_P = subset(POINT,POINT$year==2005)
PM_2.5_2008_P = subset(POINT,POINT$year==2008)


## Create Total_PM2.5 vector
Total_PM_2.5_1999_P = sum(PM_2.5_1999_P$Emissions)
Total_PM_2.5_2002_P = sum(PM_2.5_2002_P$Emissions)
Total_PM_2.5_2005_P = sum(PM_2.5_2005_P$Emissions)
Total_PM_2.5_2005_P = sum(PM_2.5_2008_P$Emissions)

Total_PM2.5_P = c(Total_PM_2.5_1999_P,Total_PM_2.5_2002_P,Total_PM_2.5_2005_P,Total_PM_2.5_2005_P)
rep1 = (rep("Non_Road",4))
rep2 = (rep("Non_Point",4))
rep3 = (rep("On_Road",4))
rep4 = (rep("Point",4))
Sources = factor(c(rep1,rep2,rep3,rep4))
Year = rep(c(1999,2002,2005,2008),4)
Total_PM2.5_BC = c(Total_PM2.5_NR,Total_PM2.5_NP,Total_PM2.5_OR,Total_PM2.5_P)
Data = data.frame(Total_PM2.5_BC,Year,Sources)
png("plot3.png",width=480,height=480)
qplot(Year,Total_PM2.5_BC,data=Data,facets = .~Sources,geom = c("point","line"))+ggtitle("PM 2.5 emissions in Baltimore City by different Sources")
dev.off()
