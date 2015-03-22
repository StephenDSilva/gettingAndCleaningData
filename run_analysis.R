## This run_analysis script will do the following
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the 
##    average of each variable for each activity and each subject.

library("dplyr", "data.table", "tidyr")

# Read training and test data files,  

test_sub <- read.table("~/UCI HAR Dataset/test/subject_test.txt")
test_y <- read.table("~/UCI HAR Dataset/test/y_test.txt")
test_x <- read.table("~/UCI HAR Dataset/test/x_test.txt")

train_sub <- read.table("~/UCI HAR Dataset/train/subject_train.txt")
train_y <- read.table("~/UCI HAR Dataset/train/y_train.txt")
train_x <- read.table("~/UCI HAR Dataset/train/x_train.txt")


#Read features and activity Labels
features_tbl <- read.table("~/UCI HAR Dataset/features.txt")
setnames(features_tbl, names(features_tbl), c("featureNum", "feature"))

activity_labels_tbl <- read.table("~/UCI HAR Dataset/activity_labels.txt")
setnames(activity_labels_tbl, names(activity_labels_tbl), c("activityNum", "activity"))


# Merge the training and test sets to create one 
# data set
sub_tbl <- rbind(test_sub, train_sub)
rm(test_sub, train_sub)
setnames(sub_tbl, names(sub_tbl), "subject")

y_tbl <- rbind(test_y, train_y)
rm(test_y, train_y)
setnames(y_tbl, names(y_tbl), "activityNum")

x_tbl <- rbind(test_x, train_x)
rm(test_x, train_x)


# Extract only the measurements on the mean and 
# standard deviation for each measurement

mean_std_tbl <- filter(features_tbl,feature = grepl("mean\\(\\)|std\\(\\)", feature) )
mean_std_tbl <- mutate(mean_std_tbl, featureNum=paste0("V", featureNum))
myselcol <- c(mean_std_tbl$featureNum)
x_tbl <- x_tbl[, myselcol]


# Combine the Subject, Activity and Data tables (columns)

x_tbl <- sub_tbl %>% cbind(y_tbl) %>% cbind(x_tbl)      


# Use descriptive activity names to name the 
# activities in the data set

x_tbl <- merge(x_tbl, activity_labels_tbl, by="activityNum")


# Label the data set with descriptive variable 
# names

setnames(x_tbl, names(x_tbl), c("activityNum", "subject", as.character(mean_std_tbl$feature), "activity"))
x_tbl <- gather(x_tbl, feature, reading, -activityNum, -subject, -activity)

# Create an independent tidy data set with the 
# average of each variable for each activity and 
# each subject

# Drop Activity Number column and create the dataset file
x_tbl <- select(x_tbl,-activityNum)
write.table(x_tbl, "~/datasetfile.txt",row.names=FALSE)

# Create the tidy file
tidy_x_tbl <- group_by(x_tbl, subject, activity, feature)
tidy_x_summary_tbl <- summarize(tidy_x_tbl, average = mean(reading))
write.table(tidy_x_summary_tbl, "~/tidyfile.txt",row.names=FALSE)

