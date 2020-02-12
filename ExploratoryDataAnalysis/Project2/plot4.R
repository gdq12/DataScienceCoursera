plot4 <- function(){
  
#package & file check/download------
##verify that RDS files are in current working directory
if(!"Source_Classification_Code.rds" %in% dir()){
  warning("no RDS files in current directory, changing working directory")}
  
##download RDS files once in correct directory 
NEI <- readRDS("summarySCC_PM25.rds")   
SCC <- readRDS("Source_Classification_Code.rds")

#Coal PM2.5 emission calculation------
##keep only necessary variables in SCC data frame
SCC <- SCC[-c(2,4:15)]

##merge SCC codes into NEI data frame
NEI <- merge(NEI, SCC, by.x="SCC", by.y="SCC")

##subsetting Coal emissions in Short.Name variable 
CoalE <- NEI[grepl("coal", NEI$Short.Name, ignore.case=TRUE),]
CoalE <- transform(CoalE, year=factor(year))

#graph production-----
##open png device
png(file="plot4.png")

#bar plot on Coal PM2.5 comparing year and type
g <- ggplot(CoalE, aes(x=year, y=Emissions, fill=type))
gCoal <- g + geom_bar(stat="identity", position="stack") + coord_cartesian(ylim=c(0, 7e+05)) + labs(y="PM2.5 Emissions (in tons)", title="Coal-Combustion Sources in USA 1999-2008")
print(gCoal)

##close PNG device so graph can be saved and exported into working directory
dev.off()
}