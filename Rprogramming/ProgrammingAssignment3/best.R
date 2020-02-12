best <- function(state, outcome){
		##Read outcome data
		data <- read.csv("outcome-of-care-measures.csv", na.strings="Not Available", stringsAsFactors=FALSE)
		
		##isolate desired outcome 
		outcomes <- c("heart attack"=11, "heart failure"=17, "pneumonia"=23)
		nOutcome <- data[,c(2,7,outcomes[outcome])]
		
		##Check that state and outcome are valid
		if(any(nOutcome$State==state)==FALSE){stop("invalid state")}
		if(any(names(outcomes)==outcome)==FALSE){stop("invalid outcome")}
		
		##isolate desired state 
		subsettedR <- which(nOutcome[,"State"]==state)
		tOutcome <- nOutcome[subsettedR,]
		
		## Return hospital name in that state with lowest 30-day death rate
		Hospital <- tapply(tOutcome[,1], tOutcome[,3], min, na.rm=TRUE)
		Hospital[1]
}