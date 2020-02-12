plot5 <- function(){
  
#package & file check/download------
##verify that RDS files are in current working directory
if(!"Source_Classification_Code.rds" %in% dir()){
  warning("no RDS files in current directory, changing working directory")}
  
##download RDS files once in correct directory 
NEI <- readRDS("summarySCC_PM25.rds")   
SCC <- readRDS("Source_Classification_Code.rds") 

#Motor PM2.5 emission calculation------
##keep only necessary variables in SCC data frame
SCC <- SCC[-c(2,4:15)]

##merge SCC codes into NEI data frame
NEI <- merge(NEI, SCC, by.x="SCC", by.y="SCC")

##subsetting Motor emissions in Baltimore 
BaltE <- subset(NEI, fips=="24510")
mBaltE <- BaltE[grepl("motor", BaltE$Short.Name, ignore.case=TRUE),]
mBaltE <- transform(mBaltE, year=factor(year))

#graph production-----
##open png device
png(file="plot5.png")

##build graphs examine Motor emissions in Baltimore 1999-2008
g <- ggplot(mBaltE, aes(x=year, y=Emissions, fill=type))
gMotor <- g + geom_bar(stat="identity", position="stack") + labs(y="PM2.5 Emissions (in tons)", title="Motor-Combustion Source in Baltimore 1999-2008")
print(gMotor)

##close PNG device so graph can be saved and exported into working directory
dev.off()
}