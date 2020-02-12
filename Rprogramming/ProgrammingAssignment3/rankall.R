rankall <- function(outcome, num="best"){
	##read outcome data
	data <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors=FALSE)
	
	##isolate desired outcome
	outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
	nOutcome <- data[,c(2,7,outcomes[outcome])]
		
	library(plyr)
	nOutcome1 <- arrange(nOutcome, nOutcome[,2], nOutcome[,3], nOutcome[,1], na.last=TRUE)
	nOutcome2 <- na.omit(nOutcome1)
	
	splitState <<- split(nOutcome2, nOutcome2$State)

	if(num=="best"){
		ranks <- lapply(splitState, function(x){x[1,1:2]})
		hospitals <- do.call(rbind, ranks )
		}
	else if(num=="worst"){
		ranks <- lapply(splitState, function(x){x[nrow(x),1:2]})
		hospitals <- do.call(rbind, ranks)	
		}	
	else{	
		ranks <- lapply(splitState, function(x){x[num,1:2]})
		hospitals <- do.call(rbind, ranks )
	}
	
	hospitals
}