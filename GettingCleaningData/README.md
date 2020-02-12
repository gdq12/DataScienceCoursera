Getting and Cleaning Data: README
================

Overview
----------------

This Github repository includes all required files by the Getting and Cleaning Data course by John Hopkin’s School of Public Health via Coursera during October 2019. The main objective of this course was to convert the initial “messy” data provided by [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), into a more tidy format in accordance to the Project guidelines provided by the course: 

Create in R script (r_analysis.R) that does the following: 

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set.

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

UCI Project Summary
-------------------

The project, Human Activity Recognition Using Smartphones Dataset, consists of experiments that were carried out with a group of 30 volunteers 19-48 years old. While wearing a Samsung Galaxy S II on their waist, each participant performed six activities (walking, walking_upstairs, walking_downstairs, sitting, standing and laying). By using the smartphones’ embedded accelerometer and gyroscope, the experimenters recorded 3-axial(X/Y/Z) linear acceleration and 3-axial(X/Y/Z) angular velocity at a constant rate of 50Hz. The experiments were video recorded for manual data labelling. Then, the acquired dataset was randomly partitioned into 2 sets: 70% for generating training data and 30% for test data. 
	
Through the embedded accelerometer and gyroscope in the smartphones’, the signals went through a series of pre-processing via sample fixed time windows and 2 low filter applications. From this,  33 features were estimated from the 3 axial directions with time and frequency domains. Along with this, 17 other features were calculated for each of the additional 33 features, making it a total of 561 features recorded for each participant for each activity.
	
Through this UCI repository, along with various text files providing extensive background information, there are another 2 main directories (train and test) which in consists of 9 inertial signal files,  561 features vector with time/frequency variables, activity label and subject identifier. Along with the train and test directories, there are additional text files that provide additional information along with labels files that are associated with the train/test directories: activity_labels, features_info, features and README. 

Key files from UCI needed for data Cleaning
-------------------------------------------

What was needed and not was not explicitly explained, rather the following indicated files are based on the support documents provided by the UCI folder and from the course forum discussion:

activity_labels.txt: 
a 6 row and 2 column data file, which denotes the activity name along with its corresponding index number. It will be needed to convert the train and test label files from index number to activity name. 

features.txt: a 561 row and 1 column data file, denoting a list of the 561 different features recorded from every participants smartphone. Will be use to provide column labels to the |train and test data sets. 

X_test.txt: a 2944 row and 561 column data file, containing the 561 feature measurements for each of the 6 activities for the test data set.

y_test.txt: a 2947 row and 1 column data files, consisting of the activity index number that corresponds to the X_test.txt file.

subject_test: a 2947 row and 1 column data file, containing the subject ID number that corresponds to the rows of X_test.txt.

X_train.txt: a 7352 row and 561 column data file, containing the 561 feature measurements for each of the 6 activities for the train data set.

Y_train.txt: a 7352 row and 1 column data files, consisting of the activity index number that corresponds to the X_train.txt file.

subject_train.txt: a 7352 row and 1 column data file, containing the subject ID number that corresponds to the rows of X_train.txt.

*for following the data cleaning guidelines of this assignments, files in the inertial signals folders were not used. 

Processing steps
----------------
Here, an outline is provided of the processing steps executed in run_analysis.R. This outline is intended to be concise and briefly justifies certain defined parameters in the process:

1. Verify that in desired directory via getwd() and if not change directory via setwd(). 

2. Download the UCI HAR Dataset zip file into present directory if not already done so.

3. Go into the UCI HAR Dataset directory with setwd().

4. Verify the dplyr package is installed and load onto R console.

5. Import the activity_labels.txt file as “activities”, add appropriate column names, and clean up the character names a little by removing “_”.

6. Import the features.txt file as “features” and cleanup the feature character names by removing unnecessary character and repeated words 

7. As per the assignment requirements, the mean and standard deviation measurements must be extracted. This is done by extracting column names from “features” that contain Mean and Stdev only and saved into “targetIndex”. Due to these requirements, the list of calculated features is 66. To convert “targetIndex” from a character to a numerical index, it is matched back to the second column of “features”.

8. The test data set must be first retrieved and cleaned up, so go into the test directory via setwd()

9. Import the subject_test.txt file as “subjectTest” with the appropriate column name 
10. Import the y_test.txt file as “testLabels” with the appropriate column name.

11. Import the X_test.txt file as “testSet” with the second column of “features” as “testSet” column labels, subset the target column using “targetIndex”, and bind “subjectTest” and “testLabels” to the testSet data frame.

12. Switch into the train directory to import and clean up the train data set with setwd().

13. Import the subject_train.txt data file as “subjectTrain” with the appropriate column name.

14. Import the y_train.txt data file as “trainLabels” with appropriate column name.

15.  Import the X_train.txt file as “trainSet” with the second column of “features” as “trainSet” column labels, subset the target column using “targetIndex”, and bind “subjectTrain” and “trainLabels” to the testSet data frame.

16. Go back to the UCI HAR Dataset directory using setwd().

17. Merge the “testSet” and “trainSet” data together to “mergedData” using rbind(). Must verify that both data sets have the same column names.

18. To incorporate the activity name into “mergedData”, use merge(). Then rearrange the column so that subjectID, activityName and the measured target features are in that respective order. 

19. Calculate the averages for each measured feature column for each activity and subject using group_by() and summarize_all() and save the new data frame as “meanVarSubData”.

20. Export this new data frame as “tidyData.txt” into the UCI HAR Dataset.



