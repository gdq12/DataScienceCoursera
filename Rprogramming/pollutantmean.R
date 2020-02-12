pollutantmean <- function(directory, pollutant, id= 1:332){
	## define variable in function
	specdata <- getwd()
	directory <- specdata
	pollutant <- pollutant
	## make list of desired csv files based on id
	fileListVector <- list.files(directory)
	needIndex <- c(id)
	workingList <- fileListVector[needIndex]
	##empty matrix
	num <- id
	colnum <- length(num)
	dataMatrix <- matrix(data=id, ncol=colnum, byrow=FALSE)
	##extract desired column and insert into matrix
	newIndex <- c(1:length(workingList))
	for(i in newIndex){
		wholeTable <-read.csv(workingList[i])
		if(pollutant == "sulfate"){
			sVector <- subset(wholeTable, select=sulfate)}
		else if(pollutant =="nitrate"){
			sVector <- subset(wholeTable, select=nitrate)}
		dataMatrix[i] <- cbind(sVector)
		dataMatrix1 <- unlist(dataMatrix)
	}
	## calculate matrix mean and print result 
	pMean <- mean(dataMatrix1, trim=0, na.rm=TRUE)
	pMean
}