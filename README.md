# Getting and Cleaning Data Course Project

##How to use the repo
1. Clone this project and set as R Studio working directory
2. Put the UCI HAR Dataset under working directory and run the run_analysis.R script.
3. The required tidy data set will be created under the working directory.

##How does the analysis work
1. read the train and test data sets and merge them
2. read the features table and assign them to the merged dataset as column names
3. extract the columns with mean() and std()
4. read the activities tables and the activity_labels table and join them with data set
5. read the subject tables and join them with the data set
6. aggregate the dataset to calculate mean of each measurement group by subject and activity

#Hope you all pass the course project!
