rankhospital <- function(state, outcome, num="best"){
	##read outcome data
	data <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors=FALSE)
	
	##isolate desired outcome 
	outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
	nOutcome <- data[,c(2,7,outcomes[outcome])]
	
	##isolate desired state 
	subsettedR <- which(nOutcome[,"State"]==state)
	tOutcome <- nOutcome[subsettedR,]
	
	##rank list according to outcome 
	library(plyr)
	tOutcome1 <- tOutcome[,c(1,3)]
	tOutcome2 <- arrange(tOutcome1, tOutcome1[,2], tOutcome1[,1], na.last=TRUE)
	tOutcome3 <- cbind(tOutcome2, Rank=order(tOutcome2[,2]))
	tOutcome4 <- na.omit(tOutcome3)
	
	
	hRank <- which(tOutcome4[,3]==num)
	HospitalA <- tOutcome4[hRank,]
	Hospital <- HospitalA[1,1]
	
	if(num=="best"){Hospital <- tOutcome4[1,1]}
	if(num=="worst"){
		Hospital1 <- nrow(tOutcome4) 
		Hospital <- tOutcome4[Hospital1,1]
	}
	Hospital
	
}