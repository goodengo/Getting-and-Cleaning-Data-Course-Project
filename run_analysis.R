#load library
library(plyr)
#1. Merges the training and the test sets to create one data set.
test_set <- read.table("UCI HAR Dataset/test/X_test.txt", header=FALSE)
train_set <- read.table("UCI HAR Dataset/train/X_train.txt", header=FALSE)
merged <- rbind(train_set,test_set)
#4. Appropriately labels the data set with descriptive variable names.
header_table <- read.table("UCI HAR Dataset/features.txt",header=FALSE)
colnames(merged) <- header_table$V2
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
extract <- merged[,grep("mean\\(\\)|std\\(\\)",names(merged))]
#3. Uses descriptive activity names to name the activities in the data set
test_activities <- read.table("UCI HAR Dataset/test/y_test.txt", header=FALSE)
train_activities <- read.table("UCI HAR Dataset/train/y_train.txt", header=FALSE)
activities <- rbind(train_activities,test_activities)
labels <- read.table("UCI HAR Dataset/activity_labels.txt", header=FALSE)
activity_labels <- join(activities,labels)
data_set <- cbind(activity_labels$V2,extract)
colnames(data_set)[1] <- "activity"
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- aggregate(data_set[,2:67],list(data_set$activity),mean)
colnames(tidy_data)[1] <- "activity"
write.table(tidy_data, "tidy_data.txt", row.name=FALSE)