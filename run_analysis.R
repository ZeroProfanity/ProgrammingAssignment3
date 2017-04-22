# INTRO
# Run_analysis.R is a script that processes the Samsung smartphone accelerometer and 
# gyroscope data into two tidy data sets. The script performs the following actions:
# 1. It merges the training and the test sets to create one data set.
# 2. It extracts only the measurements on the mean and standard deviation for each measurement.
# 3. It changes the activity names to name the activities in the data set instead of a set of numeric labels.
# 4. It appropriately labels the data set with descriptive variable names, and saves the resulting data set.
# 5. From the saved data set, it creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.
# For more information, see README.MD.

# USER PARAMETERS
# Working directory - replace ONLY this value, if necessary
dir.workingdir <- "~/DataScienceCourse/ProgrammingAssignment3/"

# OPEN LIBRARIES
library(dplyr)
library(stringr)

# SET THE CORRECT DIRECTORIES
setwd(dir.workingdir)
dir.dataset <- "./UCI HAR Dataset/"
dir.dataset.test <- paste0(dir.dataset, "test/")
dir.dataset.train <- paste0(dir.dataset, "train/")
dir.output <- paste0(dir.workingdir, "output/")

# OPEN AUXILIARY FUNCTIONS
source("make_a_better_name.R")

# SET THE INPUT FILE NAMES
# Set dataset filenames
file.dataset.test <- paste0(dir.dataset.test, "X_test.txt")
file.subject.test <- paste0(dir.dataset.test, "subject_test.txt")
file.activity.test <- paste0(dir.dataset.test, "y_test.txt")
file.dataset.train <- paste0(dir.dataset.train, "X_train.txt")
file.subject.train <- paste0(dir.dataset.train, "subject_train.txt")
file.activity.train <- paste0(dir.dataset.train, "y_train.txt")

# Set column name filename and activity row labels
file.dataset.columnnames <- paste0(dir.dataset, "features.txt")
file.activity.names <- paste0(dir.dataset, "activity_labels.txt")

# Output files
file.output.big.dataset <- paste0(dir.output, "big_dataset.txt")
file.output.small.dataset <- paste0(dir.output, "small_dataset.txt")

# OPEN AND READ ALL DATA FILES
dataset.test <- read.table(file.dataset.test)
subject.test <- read.table(file.subject.test)
activity.test <- read.table(file.activity.test)
dataset.train <- read.table(file.dataset.train)
subject.train <- read.table(file.subject.train)
activity.train <- read.table(file.activity.train)

# Read column header file
columnnames <- read.table(file.dataset.columnnames, stringsAsFactors = FALSE)
rownames.activity <- read.table(file.activity.names)

# DATA WRANGLING
# Subset the column header and the data sets to only contain means and std deviatons
columns.mean <- grep("mean\\(\\)", columnnames$V2)
columns.std <- grep("std\\(\\)", columnnames$V2)
columns.select <- sort(c(columns.mean, columns.std))
dataset.test.selected <- dataset.test[,columns.select]
dataset.train.selected <- dataset.train[,columns.select]
columns.columnnames <- columnnames[columns.select, 2]

# Merge data sets and activity and subject columns into one data set (one for training, one for test)
columns.columnnames.full <- c("Subject", "Activity", columns.columnnames)
merge.test <- subject.test %>% bind_cols(activity.test) %>% bind_cols(dataset.test.selected)
merge.train <- subject.train %>% bind_cols(activity.train) %>% bind_cols(dataset.train.selected)
names(merge.test) <- columns.columnnames.full
names(merge.train) <- columns.columnnames.full

# Merge test and training sets into one set
dataset.full <- bind_rows(merge.test, merge.train)

# Replace activity codes by readible labels
dataset.full$Activity <- rownames.activity[dataset.full$Activity,2]

# Replace column headers by readable column headers
names(dataset.full) <- sapply(columns.columnnames.full, make_a_better_name)

# Create limited data set containing only averages per subject/activitity
small.dataset <- aggregate(x = dataset.full[,3:68], by = list(dataset.full$Subject, dataset.full$Activity), FUN = "mean")
names(small.dataset)[1] <- "Subject"
names(small.dataset)[2] <- "Activity"

# SAVING THE RESULTING DATA SETS 
if (dir.exists(dir.output) == FALSE)
  dir.create(dir.output)
write.table(dataset.full, file.output.big.dataset, col.names = TRUE, row.name=FALSE)
write.table(small.dataset, file.output.small.dataset, col.names = TRUE, row.name=FALSE)
