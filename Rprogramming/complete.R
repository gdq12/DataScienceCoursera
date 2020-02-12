complete <- function(directory, id=1:332){
	##define variable in function 
	specdata <- getwd()
	directory <- specdata
	##make list of desired csv files based on id
	fileListVector <- list.files(directory)
	needIndex <- c(id)
	workingList <- fileListVector[needIndex]
	##make id# and nobs vector 
	idV <- c(id)
	nobsV <- id
	dim(nobsV) <- c(length(idV), 1)
	## extract files from folder 
	newIndex <- c(1:length(workingList))
	for(i in newIndex){
		wholeTable <- read.csv(workingList[i])
		nobsCol <- wholeTable[2]
		NAclean <- na.exclude(nobsCol)
		nobs <- nrow(NAclean)
		nobsV[i] <- c(nobs)
	}
	obsMatrix <- data.frame(idV, nobsV)
	obsMatrix	
}