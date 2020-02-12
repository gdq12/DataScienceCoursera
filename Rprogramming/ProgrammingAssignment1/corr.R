corr <- function(directory, threshold=0){
	##define variable in function
	specdata <- getwd()
	directory <- specdata
	threshold <- threshold
	
	##calculate nobs for all files 
	nobsALL <- complete("specdata", 1:322)
	
	##make file name list according to threshold
	newTargetIndex <- matrix(data=1, ncol=1, byrow=FALSE)
	newTargetIndex <- nobsALL[nobsALL[2]>threshold]
	x <- length(newTargetIndex)/2
	newTargetIndex1 <- matrix(data=newTargetIndex, ncol=1, nrow=x)
	fileListVector <- list.files(directory)
	workingList <- fileListVector[newTargetIndex1]

	##use workingList to target specific CSV files, run cor(), then save into new matrix
	numFile <- length(workingList)
	corV <- c(1:numFile)
	for(i in corV){
		targetTable <- read.csv(workingList[i])
		corr <- cor(targetTable$sulfate, targetTable$nitrate, use="na.or.complete")
		corV[i] <- c(corr)	
	}
	return(corV)
}	

	
