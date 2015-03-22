## Getting and Cleaning Data Course Project


#Project Description and Requirement

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The project submission includes:
 
1.	a tidy data set as described below, 
2.	a link to a Github repository with a script for performing the analysis, and 
3.	a code book that describes the variables, the data, and any transformations or work that was performed to clean up the data called CodeBook.md. 
4.	also included is a README.md in the repo with the scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 A R script called run_analysis.R has been created that does the following. 
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Project Setup and Execution

1.	Open the run_analysis.R file
2.	Edit the path and file names if the location of the files have changed
3.	Run the run_analysis.R script


# Outputs produced
1.	A text file created using write.table() without row names called “datasetfile.txt” is created. This file is the dataset file and is a long (not wide table file)
2.	 A text file created using write.table() without row names called “tidyfile.txt” is created. This file is the tidy file and is grouped by subject/activity/feature and includes the average of the readings for each of them



