# Getting and Cleaning Data - Final assignment - CODEBOOK.MD  
Coursera Data Science, course 3, Getting and cleaning data
CODEBOOK.MD file

Author: ZeroProfanity
Date: April 22nd, 2017

## Changes with respect to the original data  
With respect to the original data, the following actions have been performed to create the big data set:

* The provided training and the test sets have been merged to create one data set, together with the column names and activities, that were initially in separate files.  
* Only measurements on the mean and standard deviation for each observations have been maintained. Other columns were deleted.  
* The numeric labels in the activity column have been replaced by activity names.     
* The columns names were replaced with more descriptive variable names.  

The big data set holds all separate observations.   
A second, independent tidy data set was created, based on the main data set. This set holds the average of each variable in the big data set, grouped per combination of activity and subject.  

## Explanation of the data in the tidied data sets
The columns subject and activity identify the volunteer and the activity that was performed. The other column names have been built up from several parts. 

### Meaning of the column names  
The parts of the column names have the following meanings:  
* Body / Gravity: Describes whether the value describes the actual body movement, or the gravity that was picked up by the accelerometer.  
* Acc / Gyro: Describes whether the measurement of an accelerometer (linear motion) or gyroscope (angular motion) is denoted.  
* Jerk: Indicates that the change in time of the accerelation/gyro is denoted, instead of the acceleration/gyro itself.  
* X/Y/Z/Magnitude: Denotes in which of the three coordinates the measurement is performed. Magnitude indicates that the Euclidean norm was displayed instead of one of the coordinates.  
* Mean / StandardDev: Denotes whether a mean value or a standard deviation is indicated.  
* Time / Frequency: Denotes whether the column contains a value in the time or in the frequency domain (after a Fast Fourier Transform).  

The values in all columns have been normalized, and thus contain unit-less values between -1 and 1.

### Columns of the tidied data set
The tidied data set consists of the following columns:  
* Subject
* Activity
* BodyAcc_X_Mean_Time
* BodyAcc_Y_Mean_Time
* BodyAcc_Z_Mean_Time
* BodyAcc_X_StandardDev_Time
* BodyAcc_Y_StandardDev_Time
* BodyAcc_Z_StandardDev_Time
* GravityAcc_X_Mean_Time
* GravityAcc_Y_Mean_Time
* GravityAcc_Z_Mean_Time
* GravityAcc_X_StandardDev_Time
* GravityAcc_Y_StandardDev_Time
* GravityAcc_Z_StandardDev_Time
* BodyAccJerk_X_Mean_Time
* BodyAccJerk_Y_Mean_Time
* BodyAccJerk_Z_Mean_Time
* BodyAccJerk_X_StandardDev_Time
* BodyAccJerk_Y_StandardDev_Time
* BodyAccJerk_Z_StandardDev_Time
* BodyGyro_X_Mean_Time
* BodyGyro_Y_Mean_Time
* BodyGyro_Z_Mean_Time
* BodyGyro_X_StandardDev_Time
* BodyGyro_Y_StandardDev_Time
* BodyGyro_Z_StandardDev_Time
* BodyGyroJerk_X_Mean_Time
* BodyGyroJerk_Y_Mean_Time
* BodyGyroJerk_Z_Mean_Time
* BodyGyroJerk_X_StandardDev_Time
* BodyGyroJerk_Y_StandardDev_Time
* BodyGyroJerk_Z_StandardDev_Time
* BodyAccMagnitude_Mean_Time
* BodyAccMagnitude_StandardDev_Time
* GravityAccMagnitude_Mean_Time
* GravityAccMagnitude_StandardDev_Time
* BodyAccJerkMagnitude_Mean_Time
* BodyAccJerkMagnitude_StandardDev_Time
* BodyGyroMagnitude_Mean_Time
* BodyGyroMagnitude_StandardDev_Time
* BodyGyroJerkMagnitude_Mean_Time
* BodyGyroJerkMagnitude_StandardDev_Time
* BodyAcc_X_Mean_Frequency
* BodyAcc_Y_Mean_Frequency
* BodyAcc_Z_Mean_Frequency
* BodyAcc_X_StandardDev_Frequency
* BodyAcc_Y_StandardDev_Frequency
* BodyAcc_Z_StandardDev_Frequency
* BodyAccJerk_X_Mean_Frequency
* BodyAccJerk_Y_Mean_Frequency
* BodyAccJerk_Z_Mean_Frequency
* BodyAccJerk_X_StandardDev_Frequency
* BodyAccJerk_Y_StandardDev_Frequency
* BodyAccJerk_Z_StandardDev_Frequency
* BodyGyro_X_Mean_Frequency
* BodyGyro_Y_Mean_Frequency
* BodyGyro_Z_Mean_Frequency
* BodyGyro_X_StandardDev_Frequency
* BodyGyro_Y_StandardDev_Frequency
* BodyGyro_Z_StandardDev_Frequency
* BodyAccMagnitude_Mean_Frequency
* BodyAccMagnitude_StandardDev_Frequency
* BodyBodyAccJerkMagnitude_Mean_Frequency
* BodyBodyAccJerkMagnitude_StandardDev_Frequency
* BodyBodyGyroMagnitude_Mean_Frequency
* BodyBodyGyroMagnitude_StandardDev_Frequency
* BodyBodyGyroJerkMagnitude_Mean_Frequency
* BodyBodyGyroJerkMagnitude_StandardDev_Frequency

