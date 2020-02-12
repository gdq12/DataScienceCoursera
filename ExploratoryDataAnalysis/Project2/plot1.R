plot1 <- function(){

#package & file check-----  
##check for required packages/install if needed/load into R
if(!"dplyr" %in% installed.packages()){
  warning("dplyr required, installing now")
  install.packages("dplyr")}
library(dplyr)  

##verify that RDS files are in current working directory
if(!"Source_Classification_Code.rds" %in% dir()){
  warning("no RDS files in current directory, changing working directory")}

##download RDS files once in correct directory 
NEI <- readRDS("summarySCC_PM25.rds")

#total Emissions calculation------
##calculate total emissions from all sources for every year 
totalE <- NEI %>% group_by(year) %>% summarise(Emissions=sum(Emissions))

#graph production------
##open PNG device
png(file="plot1.png")

##build desired plot with customized x and y axes
plot(totalE, pch=19, ylim=c(0, 10e+06), xaxt="n", ylab="Emissions (in tons)", main="Total PM2.5 Emissions")
axis(1, at=c(1999,2002,2005,2008))

##calculate regression between year and emissions 
trend <- lm(totalE$Emissions ~ totalE$year, totalE)

##add regression line onto graph to visually emphasize relationship between year and emissions
abline(trend, lwd=2)

##close PNG device so graph can be saved and exported into working directory
dev.off()

}