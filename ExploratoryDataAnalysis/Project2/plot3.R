plot3 <- function(){
  
#package & file check-----  
##check for required packages/install if needed/load into R
if(!"ggplot2" %in% installed.packages()){
  warning("ggplot2 required, installing now")}
library(ggplot2)  
  
##verify that RDS files are in current working directory
if(!"Source_Classification_Code.rds" %in% dir()){
  warning("no RDS files in current directory, changing working directory")}  

##download RDS files once in correct directory 
NEI <- readRDS("summarySCC_PM25.rds") 

#Baltimore PM2.5 emissions subsetting------
BaltE <- subset(NEI, fips=="24510")
BaltE <- transform(BaltE, year=factor(year))

#graph production------
##open PNG device
png(file="plot3.png")

##build desired plot with custom ylimit for outlier exclusion and regression trend implementation
g <- ggplot(BaltE, aes(year, Emissions, group=1))
gBalt <-g + geom_point() + facet_grid(.~type) + coord_cartesian(ylim=c(0, 450)) + geom_smooth(method="lm") + labs(y="Emissions (in tons)", title="Baltimore PM2.5 Emission Comparison 1999-2008 by Type")  
print(gBalt)

##close PNG device so graph can be saved and exported into working directory
dev.off()
}