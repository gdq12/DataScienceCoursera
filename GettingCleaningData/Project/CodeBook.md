Getting and Cleaning Data: Codebook
===================================

Overview
--------

The purpose of this codebook is to briefly elaborate on variables present in the tinyData.txt file in the cleaningdata repository. For more elaboration on the background information of on the resulting tidyData.txt, refer to the README.md file in this repositry. 

The final tidyData set consists of 180 observations and 68 variables. This is derived from calculating the mean value for each activity and each participant for the extracted mean and standard deviations from the original 561 feature variables. 

Variables in tidyData Set
-------------------------

The following is a list of all the variables present in tidyData.txt dataset along with a brief description of each variable. Since in the original data all the calculated results were normalized to a range of -1 to 1, the tidyData set also consists of normalized data. 

1. subjectID: numerical identifier of all 1-30 participants.

2. activityName: character string consisting of the 6 different activities performed by the participants (laying, sitting, standing, walking, walking downstairs, walking upstairs)

3. tBodyAccMeanX: numerical mean of time domain body acceleration in the X dimension. 

4. tBodyAccMeanY: numerical mean of time domain body acceleration in the Y dimension. 

5. tBodyAccMeanZ: numerical mean of time domain body acceleration in the Z dimension.  

6. tGravityAccMeanX: numerical mean of time domain gravity acceleration in the X dimension.  

7. tGravityAccMeanY: numerical mean of time domain gravity acceleration in the Y dimension.  

8. tGravityAccMeanZ: numerical mean of time domain gravity acceleration in the Z dimension.  

9. tBodyAccJerkMeanX: numerical mean of time domain jerk acceleration in the X dimension.  

10. tBodyAccJerkMeanY:numerical mean of time domain jerk acceleration in the Y dimension.  

11. tBodyAccJerkMeanZ: numerical mean of time domain jerk acceleration in the Z dimension.  

12. tBodyGyroMeanX:numerical mean of time domain body gyroscope in the X dimension.

13. tBodyGyroMeanY: numerical mean of time domain body gyroscope in the Y dimension.

14. tBodyGyroMeanZ: numerical mean of time domain body gyroscope in the Z dimension.

15. tBodyGyroJerkMeanX: numerical mean of time domain body gyroscope jerk in the X dimension.

16. tBodyGyroJerkMeanY: numerical mean of time domain body gyroscope jerk in the Y dimension.

17. tBodyGyroJerkMeanZ: numerical mean of time domain body gyroscope jerk in the Z dimension.

18. tBodyAccMagMean: numerical mean of time domain body acceleration magnitude. 

19. tGravityAccMagMean: numerical mean of time domain gravity acceleration magbitude. 

20: tBodyAccJerkMagMean: numerical mean of time domain body acceleration jerk magnitude 

21: tBodyGyroMagMean: numerical mean of time domain body gyroscope magnitude. 

22: tBodyGyroJerkMagMean: numerical mean of time domain body gyroscope jerk magbitude 

23: fBoddyAccMeanX: numerical mean of frequency domain body acceleration in X dimension. 

24: fBodyAccMeanY: numerical mean of frequency domain body acceleration in Y dimension. 

25: fBodyAccMeanZ: numerical mean of frequency domain body acceleration in Z dimension. 

26: fBodyAccJerkMeanX: numerical mean of frequency domain body acceleration jerk in X dimension. 

27: fBodyAccJerkMeanY: numerical mean of frequency domain body acceleration jerk in Y dimension. 

28: fBodyAccJerkMeanZ: numerical mean of frequency domain body acceleration jerk in Z dimension. 

29: fBodyGyroMeanX: numerical mean of frequency domain body gyroscope in X dimension. 

30: fBodyGyroMeanY: numerical mean of frequency domain body gyroscope in Y dimension. 

31: fBodyGyroMeanZ: numerical mean of frequency domain body gyroscope in Z dimension. 

32: fBodyAccMeagMean: numerical mean of frequency doman body accceleration magnitude. 

33: fBodyAccJerkMagMean: numerical mean of frequency domain body accelerationjerk magnitude. 

34. fBodyGyroMagMean: numerical mean of frequency domain body gyroscope magitude.

35. fBodyGyroJerkMagMean: numerical mean of frequency domain body gyroscope jerk magnitude. 

36. tBodyAccStdevX: numerical mean of time domain body acceleration standard deviations in X dimension. 

37. tBodyAccStdevY: numerical mean of time domin body acceleration standard deviations in Y dimension. 

38: tBodyAccStdevZ: numerical mean of time domin body acceleration standard deviations in Z dimension.

39. tGravityAccStdevX: numerical mean of time domain gravity acceleration standard deviations in X dimension. 

40: tGravityAccStdevY: numerical mean of time domain gravity acceleration standard deviations in Y dimension.

41: tGravityAccStdevZ: numerical mean of time domain gravity acceleration standard deviations in Z dimension.

42: tBodyAccJerkStdevX: numerical mean of time domain body acceleration jerk standard deviation in X dimension. 

43. tBodyAccJerkStdevY: numerical mean of time domain body acceleration jerk standard deviation in Y dimension. 

44. tBodyAccJerkStdevZ: numerical mean of time domain body acceleration jerk standard deviation in Z dimension. 

45. tBodyGyroStdevX: numerical mean of time domain body gyroscope standard deviation in X dimension. 

46. tBodyGyroStdevY: numerical mean of time domain body gyroscope standard deviation in Y dimension.

47. tBodyGyroStdevZ: numerical mean of time domain body gyroscope standard deviation in Z dimension.

48. tBodyGyroJerkStdevX: numerical mean of time domain body gyroscope jerk standard deviations in the X dimension. 

49: tBodyGyroJerkStdevY: numerical mean of time domain body gyroscope jerk standard deviations in the Y dimension.

50: tBodyGyroJerkStdevZ: numerical mean of time domain body gyroscope jerk standard deviations in the Z dimension.

51: tBodyAccMagStdev: numerical mean of time domain body acceleration magnitude standard deviations. 

52. tGravityAccMagStdev: numerical mean of time domain gravity acceleration magnitude standard deviation. 

53. tBodyAccJerkMagStdev: numerical mean of time domain body acceleration jerk magnitude standard deviation. 

54. tBodyGyroMagStdev: numerical mean of time domain body gyroscope magnitude standard deviations. 

55. tBodyGyroJerkMagStdev: numerical mean of time domain body gyroscope jerk magnitude standard deviations. 

56. fBodyAccStdevX: numerical mean of frequency domain body acceleration standard deviation in X dimensions. 

57. fBodyAccStdevY: numerical mean of frequency domain body acceleration standard deviation in Y dimensions.

58. fBodyAccStdevZ: numerical mean of frequency domain body acceleration standard deviation in Z dimensions.

59. fBodyAccJerkStdevX: numerical mean of frequency domain body acceleration jerk standard deviation in X dimension. 

60: fBodyAccJerkStdevY: numerical mean of frequency domain body acceleration jerk standard deviation in Y dimension.

61: fBodyAccJerkStdevY: numerical mean of frequency domain body acceleration jerk standard deviation in Y dimension.

62: fBodyGyroStdevX: numerical mean of frequency domain body gyroscope stadard deviation in X dimension. 

63: fBodyGyroStdevY: numerical mean of frequency domain body gyroscope stadard deviation in Y dimension.

64: fBodyGyroStdevZ: numerical mean of frequency domain body gyroscope stadard deviation in Z dimension.

65. fBodyAccMagStdev: numerical mean of frequency domain body acceleration magnitude standard deviations.

66. fBodyAccJerkMagStdev: numerical mean of frequency omain body acceleration jerk magnitude standard deviation. 

67. fBodyGyroMagStdev: numerical mean of frequency domain body gyroscope magbitude standard deviations. 

68. fBodyGyroJerkMagStdev: numerical mean of frequency domain body gyroscope jerk magnitude standard deviations. 

