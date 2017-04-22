# Getting and Cleaning Data - Final assignment - README.MD  

## Contents:  

* / run_analysis.R -- Main R script  
* / make_a_better_name.R -- R script that converts the column names into more readable column names  
* / README.MD -- This file  
* / CODEBOOK.MD -- File containing information on created tidy data sets and the way these sets were created from the original set  
* / UCI HAR Dataset -- Empty folder, in which the data set should be placed  
* / output -- Folder that contains two output data sets  
* / output / small_dataset.txt -- Contains averaged values for all observations, aggregated by participant and activity  
* / output / big_dataset.txt -- Contains tidied up data, based on the original data set  

## Run_analysis.R
Run_analysis.R is a script that processes the Samsung smartphone accelerometer and gyroscope data into two tidy data sets. The script performs the following actions:  

1. It merges the training and the test sets to create one data set.  
2. It extracts only the measurements on the mean and standard deviation for each measurement.  
3. It changes the activity names to name the activities in the data set instead of a set of numeric labels.  
4. It appropriately labels the data set with descriptive variable names, and saves the resulting data set.  
5. From the saved data set, it creates a second, independent tidy data set with the average of each variable for each activity and each subject.  

## Make_a_better_name.R
Make_a_better_name.R is a script that creates standard readable names for the columns, through the following rules:

* Columns 'subject' and 'activity' are unchanged.  
* The first letter (f or t) is written out to mean time or frequency.  
* The subsequent part of the original name, containing the type of measurement, is copied.   
* If available, the coordinate (X, Y or Z) is copied.  
* A tag is included to indicated whether the column contains a mean or a standard deviation.  
* The word 'mag' in the original set is replaced with the word 'magnitude' if applicable.  
This R script is called from Run_analysis.R. 

## Location original dataset
The original dataset can be downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)