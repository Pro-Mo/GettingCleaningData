## README on Samsung Accelerometers script run_analysis.R

### 0. Before running the script;
THis script was written as an assignment of the Coursera Getting&Cleaning Data.
For more information on the course, see: [CourseraDataScience](https://www.coursera.org/specialization/jhudatascience/1 "Coursera Data Science Course")
The source of this specif project can be found here: [source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones/ "Samsung Datasets Activity Recognition Using SmartPhones")
- Required packages: 'data.table' and 'plyr';
- Input: directory with all files required in this test, by default will get the directory called 'CHI HAR Dataset' from your wd if present.

### 1. Merge training and testdata into one set
Combined all files; rbind the X_train/test files and adding subject and activity columns;
This is done in a loop, as all files and steps for train and test are identical (with the only difference the actual names "train" and "test")
After this merging, all names are added from the features file.
### 2. Extract measurements on the mean and standard deviation for each measurement.
This script takes all columns which contain "mean()" or "std()". 
This results in a data.table of 66 columns + 2 columns (the subject and activity columns) = 68 columns total
### 3. Use descriptive activity names to name the activities in the data set.
Takes the file 'activity_labels' to rename the activity numbers with their actual descriptions;
### 4. Appropriately label the data set with descriptive variable names.
First replace the 
body acceleration
mean
BodyBody = body

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Testing
For every step, in the script there is a comment which starts with "print(", this way you can test the steps in between.
For testing the end result, run `read.table("output2.txt", sep= "," , fileEncoding = "UTF-8", header=T)[c(1:3),c(1:2,67:68)]`
after running the 
