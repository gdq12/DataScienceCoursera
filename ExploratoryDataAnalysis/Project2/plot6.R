plot6 <- function(){
  
#package & file check/download------
##verify that RDS files are in current working directory
if(!"Source_Classification_Code.rds" %in% dir()){
  warning("no RDS files in current directory, changing working directory")}
  
if(!"dplyr" %in% installed.packages()){
  warning("dplyr required, installing now")
  install.packages("dplyr")}
library(dplyr)   
  
##download RDS files once in correct directory 
NEI <- readRDS("summarySCC_PM25.rds")   
SCC <- readRDS("Source_Classification_Code.rds")   

#Motor emissions in Baltimore and LA-----
##keep only necessary variables in SCC data frame
SCC <- SCC[-c(2,4:15)]

##merge SCC codes into NEI data frame
NEI <- merge(NEI, SCC, by.x="SCC", by.y="SCC")

##subsetting Baltimore and LA motor emissions
BaltE <- subset(NEI, fips=="24510")
LaE <- subset(NEI, fips=="06037")
CityE <- rbind(BaltE, LaE)
CityE <- CityE[grepl("motor", CityE$Short.Name, ignore.case=TRUE),]
CityE <- transform(CityE, year=factor(year))
CityE$fips <- sub("24510", "Baltimore", CityE$fips)
CityE$fips <- sub("06037", "Los Angeles", CityE$fips)

#graph production-----
##open png device
png(file="plot6.png")

##build graph to examine motor emissionsin Baltimore nad LA 1999-2008
g <- ggplot(CityE, aes(x=year, y=Emissions, fill=type))
gCitym <- g + geom_bar(stat="identity", position="stack") + facet_grid(.~fips) + labs(y="PM2.5 Emissions (in tons)", title="Motor-Combustion Source in Baltimore & LA 1999-2008")
print(gCitym)

##close PNG device so graph can be saved and exported into working directory
dev.off()
}