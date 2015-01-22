## README on Samsung Accelerometers script run_analysis.R

### 0. Before running the script;
THis script was written as an assignment of the Coursera Getting&Cleaning Data.
For more information on the course, see: [CourseraDataScience](https://www.coursera.org/specialization/jhudatascience/1 "Coursera Data Science Course")
The source of this specif project can be found here: [source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones/ "Samsung Datasets Activity Recognition Using SmartPhones")
- Required packages: 'data.table' and 'plyr';
- Input: directory with all files required in this test, by default will get the directory called 'CHI HAR Dataset' from your wd if present.

### 1. Merge training and testdata into one set
I've added one extra column (ID 562) for partion 'train' or 'test' values to distinguish between them still later on.
### 2. Extract measurements on the mean and standard deviation for each measurement.
### 3. Use descriptive activity names to name the activities in the data set.
### 4. Appropriately label the data set with descriptive variable names.
### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
