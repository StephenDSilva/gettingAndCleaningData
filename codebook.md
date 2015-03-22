#Codebook for the Getting and Cleaning Data Course Project

##Script Overview
This run_analysis.R script will do the following
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


##Libraries used
1.	dplyr
2.	data.table
3.	tidyr



##Variable description and Examples


###activity_labels_tbl
This is extracted from the activity_labels.txt files and is the master file for the type of activities recorded in this project. The variables are “activityNum” which is a number indicating a code for the activity, and “activity”, which is the name for the activity. Below is an example of the data in the table.



 	activityNum	activity
1	1	WALKING
2	2	WALKING_UPSTAIRS
3	3	WALKING_DOWNSTAIRS
4	4	SITTING
5	5	STANDING
6	6	LAYING


###features_tbl
This table was extracted from the features.txt file. This table contains the variables “featureNum” which is the id for a particular feature and “feature” which is the name of the feature. Below is an example of a subset of the data in the table.

 	featureNum	feature
1	1	tBodyAcc-mean()-X
2	2	tBodyAcc-mean()-Y
3	3	tBodyAcc-mean()-Z
4	4	tBodyAcc-std()-X
5	5	tBodyAcc-std()-Y
6	6	tBodyAcc-std()-Z
7	7	tBodyAcc-mad()-X
8	8	tBodyAcc-mad()-Y
9	9	tBodyAcc-mad()-Z
10	10	tBodyAcc-max()-X
11	11	tBodyAcc-max()-Y
12	12	tBodyAcc-max()-Z
13	13	tBodyAcc-min()-X
14	14	tBodyAcc-min()-Y
15	15	tBodyAcc-min()-Z



###sub_tbl
This table contains the ids of the subjects (30 of them) that are taking the test. The table contains the “subject” variable which is the id that corresponds to each activity and feature readings for each activity. The following is a sample of a subset of this table

 	subject
1	2
2	2
3	2
4	2

	
###x_tbl
This contains all the measurements taken for this project. It starts off with containing the training and test data from the x_test.txt and x_train.txt files. Toward the end of the script this file contains the entire data set. Samples of the structure and data (subset) at different points in the execution of the script are shown below

Structure of the when the file is initially loaded into the table. This table at this stage holds 561 variables. These variables correspond to the 561 features.

 	V1	V2	V3	V4	V5	V6	V7
1	0.25717778	-2.328523e-02	-0.014653762	-0.938404000	-0.9200907800	-0.667683310	-0.952501120
2	0.28602671	-1.316336e-02	-0.119082520	-0.975414690	-0.9674579000	-0.944958170	-0.986798800
3	0.27548482	-2.605042e-02	-0.118151670	-0.993819040	-0.9699255100	-0.962747980	-0.994403450
4	0.27029822	-3.261387e-02	-0.117520180	-0.994742790	-0.9732676100	-0.967090680	-0.995274330
5	0.27483295	-2.784779e-02	-0.129527160	-0.993852480	-0.9674454800	-0.978294990	-0.994111400
6	0.27921995	-1.862040e-02	-0.113901970	-0.994455230	-0.9704168800	-0.965316290	-0.994585140


This following table shows a subset of the final data set. The variables are “subject” which is the id for the subject being tested, “activity” is the type of activity, “feature” is only the mean and standard deviation features selected from the original feature file, and “reading” is the reading for the feature for a given activity and subject

 	subject	activity	feature	reading
1	7	WALKING	tBodyAcc-mean()-X	0.2693013
2	21	WALKING	tBodyAcc-mean()-X	0.2623422
3	7	WALKING	tBodyAcc-mean()-X	0.2383207
4	7	WALKING	tBodyAcc-mean()-X	0.2447143
5	18	WALKING	tBodyAcc-mean()-X	0.2490386
6	7	WALKING	tBodyAcc-mean()-X	0.2046162
7	7	WALKING	tBodyAcc-mean()-X	0.3191731
8	7	WALKING	tBodyAcc-mean()-X	0.3637475
9	11	WALKING	tBodyAcc-mean()-X	0.2708811
10	21	WALKING	tBodyAcc-mean()-X	0.2951976
11	20	WALKING	tBodyAcc-mean()-X	0.2519410


###y_tbl
This table contains the variable “activityNum” which is a list of ids of all activities recorded for the subject for each reading. For example 5 is the code for “Standing”


 	activityNum
1	5
2	5
3	5
4	5
5	5
6	5
7	5


###mean_std_tbl
This table contains only the mean and std deviation feature names and ids and is a subset of the features_tbl. The “featureNum” variable has been prefixed with a “V” to be used in the script to merge with the x_tbl on the featureNum column. The name of the feature is in the “feature” variable. Following is a subset of the data in the mean_std_tbl


 	featureNum	feature
1	V1	tBodyAcc-mean()-X
2	V2	tBodyAcc-mean()-Y
3	V3	tBodyAcc-mean()-Z
4	V4	tBodyAcc-std()-X
5	V5	tBodyAcc-std()-Y
6	V6	tBodyAcc-std()-Z
7	V41	tGravityAcc-mean()-X
8	V42	tGravityAcc-mean()-Y
9	V43	tGravityAcc-mean()-Z


###tidy_x_summary_tbl
This table is the tidy data set with the “average” of each “feature” for each “activity” and each “subject” that is part of this project


 	subject	activity	feature	average
1	1	LAYING	tBodyAcc-mean()-X	0.2215982439
2	1	LAYING	tBodyAcc-mean()-Y	-0.0405139534
3	1	LAYING	tBodyAcc-mean()-Z	-0.1132035536
4	1	LAYING	tBodyAcc-std()-X	-0.9280564692
5	1	LAYING	tBodyAcc-std()-Y	-0.8368274056
6	1	LAYING	tBodyAcc-std()-Z	-0.8260614016
7	1	LAYING	tGravityAcc-mean()-X	-0.2488817983
8	1	LAYING	tGravityAcc-mean()-Y	0.7055497735
9	1	LAYING	tGravityAcc-mean()-Z	0.4458177198
10	1	LAYING	tGravityAcc-std()-X	-0.8968300184
11	1	LAYING	tGravityAcc-std()-Y	-0.9077200068



##Output Files

The script produces two output files:
1.	a long (not wide) dataset (datasetfile.txt) with meaningful variable names (instead of the original V1, V2…V561). It contains data represented in the x_tbl.
2.	a tidy file (tidyfile,txt). This file contains data grouped by subject/activity/feature and includes the average of the readings for each of them. It contains data represented in the tidy_x_summary_tbl

##The run_analysis.R Script 

This run_analysis script will do the following
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the 
  average of each variable for each activity and each subject.

library(dplyr)
library(data.table)
library(tidyr)

#####Read training and test data files,  

test_sub <- read.table("~/UCI HAR Dataset/test/subject_test.txt")
test_y <- read.table("~/UCI HAR Dataset/test/y_test.txt")
test_x <- read.table("~/UCI HAR Dataset/test/x_test.txt")

train_sub <- read.table("~/UCI HAR Dataset/train/subject_train.txt")
train_y <- read.table("~/UCI HAR Dataset/train/y_train.txt")
train_x <- read.table("~/UCI HAR Dataset/train/x_train.txt")


#####Read features and activity Labels
features_tbl <- read.table("~/UCI HAR Dataset/features.txt")
setnames(features_tbl, names(features_tbl), c("featureNum", "feature"))

activity_labels_tbl <- read.table("~/UCI HAR Dataset/activity_labels.txt")
setnames(activity_labels_tbl, names(activity_labels_tbl), c("activityNum", "activity"))


#####Merge the training and test sets to create one data set
sub_tbl <- rbind(test_sub, train_sub)
rm(test_sub, train_sub)
setnames(sub_tbl, names(sub_tbl), "subject")

y_tbl <- rbind(test_y, train_y)
rm(test_y, train_y)
setnames(y_tbl, names(y_tbl), "activityNum")

x_tbl <- rbind(test_x, train_x)
rm(test_x, train_x)


#####Extract only the measurements on the mean and standard deviation for each measurement

mean_std_tbl <- filter(features_tbl,feature = grepl("mean\\(\\)|std\\(\\)", feature) )
mean_std_tbl <- mutate(mean_std_tbl, featureNum=paste0("V", featureNum))
myselcol <- c(mean_std_tbl$featureNum)
x_tbl <- x_tbl[, myselcol]


#####Combine the Subject, Activity and Data tables (columns)

x_tbl <- sub_tbl %>% cbind(y_tbl) %>% cbind(x_tbl)      


#####Use descriptive activity names to name the activities in the data set

x_tbl <- merge(x_tbl, activity_labels_tbl, by="activityNum")


#####Label the data set with descriptive variable names

setnames(x_tbl, names(x_tbl), c("activityNum", "subject", as.character(mean_std_tbl$feature), "activity"))
x_tbl <- gather(x_tbl, feature, reading, -activityNum, -subject, -activity)

#####Create an independent tidy data set with the average of each variable for each activity and each subject

#####Drop Activity Number column and create the dataset file
x_tbl <- select(x_tbl,-activityNum)
write.table(x_tbl, "~/datasetfile.txt",row.names=FALSE)

#####Create the tidy file
tidy_x_tbl <- group_by(x_tbl, subject, activity, feature)
tidy_x_summary_tbl <- summarize(tidy_x_tbl, average = mean(reading))
write.table(tidy_x_summary_tbl, "~/tidyfile.txt",row.names=FALSE)


