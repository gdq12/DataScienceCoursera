run_analysis <- function(){
## make sure that in desired directory via getwd() 
## and if not then use setwd() to get there

## check if file already there and/or downlaod necessary files 
if(!file.exists("UCI HAR Dataset")){
  URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(URL, destfile="./UCI.zip", method="curl")
  unzip("UCI.zip")}
  
##go into unzipped directory   
setwd("./UCI HAR Dataset")  

## check for required packages/install if needed/load into R
if(!"dplyr" %in% installed.packages()){
    warning("dplyr required, installing now")
    install.packages("dplyr")}
library(dplyr)

##import activity_label file and clean up observations
activities <- read.table("activity_labels.txt",col.names=c("activityID","activityName"),stringsAsFactors=FALSE)
activities[,2] <- sub("_","",activities[,2])

##import features and clean up feature labels
features <- read.table("features.txt", stringsAsFactors=FALSE)
features[,2] <- gsub("-","",features[,2])
features[,2] <- sub("\\(\\)","",features[,2])
features[,2] <- sub("mean","Mean",features[,2])
features[,2] <- sub("std","Stdev",features[,2])
features[,2] <- sub("BodyBody","Body",features[,2])

##creating index to subset mean and stdev column from test data
targetIndex <- grep("Mean|Stdev",features$V2,value=TRUE)
targetIndex <- grep("MeanFreq",targetIndex,value=TRUE,invert=TRUE)
targetIndex <- grep("angle",targetIndex,value=TRUE,invert=TRUE)
##convert TargetIndex from character to numerical
targetIndex <- match(targetIndex, features$V2)

##go into test directory 
setwd("./test")

##import subject_test file
subjectTest <- read.table("subject_test.txt",col.names=c("subTestID"),stringsAsFactors=FALSE)

##import test labels 
testLabels <- read.table("y_test.txt",col.names=c("activityID"),stringsAsFactors=FALSE)

##import test data and column labels
testSet <- read.table("X_test.txt",col.names=c(features$V2),stringsAsFactors=FALSE)

##subset desired column from testSet in accordance to #2 in assignment
testSet <- testSet[,targetIndex]

#add subjectID and activity label columns to testSet
testSet <- cbind(subjectID=subjectTest$subTestID,activityID=testLabels$activityID, testSet)

##go to train directory to cleanup that data as well 
setwd("../train")

##import subject_train file
subjectTrain <- read.table("subject_train.txt",col.names=c("subTrainID"),stringsAsFactors=FALSE)

##import train labels 
trainLabels <- read.table("y_train.txt",col.names=c("activityID"),stringsAsFactors=FALSE)

##import train data and add column labels
trainSet <- read.table("X_train.txt",col.names=c(features$V2),stringsAsFactors=FALSE)

##subset desired column from testSet in accordance to #2 in assignment
trainSet <- trainSet[,targetIndex]

#add subjectID and activity label columns to testSet
trainSet <- cbind(subjectID=subjectTrain$subTrainID,activityID=trainLabels$activityID, trainSet)

##go back to the UCI HAR Dataset directory
setwd("../")

##merge test and train data sets together
mergedData <- rbind(trainSet,testSet)

##merge activities into data frame according to activity index, activityName will be added as th 69th column 
mergedData <- merge(mergedData,activities,by.x="activityID",by.y="activityID")
##rearrange columns so subjectID, activityName, and target features are in that order and remove activityID column
mergedData <- mergedData[,c(2,69,3:68)]

##create a condensed data set that averages each activity and subject
meanVarSubData <- mergedData %>% group_by(subjectID,activityName) %>% summarise_all(funs(mean))

##write the new data frame into a text file and into UCI HAR Dataset directory
write.table(meanVarSubData,file="tidyData.txt",row.names=FALSE)
}


