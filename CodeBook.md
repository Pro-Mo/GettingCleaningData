## Codebook on Samsung Accelerometers script run_analysis.R
See for more details about specifics of the script: README.md
This document describes the variables, the data, and any transformations or work that is performed to clean up the data
### description of the Data/Introduction
The source of this specif project can be found here: [source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones/ "Information on Samsung Activity Recognition Using SmartPhones")

The data set can be found here: [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "Samsung Datasets Activity Recognition Using SmartPhones")
(For more information about this dataset contact: activityrecognition@smartlab.ws)

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Output file description
The output file of the script contains the average (mean) of each mean() and std() variable 
grouped by each activity and each subject.
The training and testing sets are combined and only the columns with "mean()" and "std()" 
were selected as required by the course project.

### Description of the Variables

| Variable Name | Orig Variable name | Description |
|:------------------|:---------------|:-------------------------------|
|tBodyAcc_mean_X |tBodyAcc-mean()-X | Mean value of BodyAcc|Mean of time signal of the Body Acceleration in the X direction|
|subject      |Subject [1-30]	|Participants in the project, numbered|
|activity	|Activity [1-6]	|Activities (was number, is translated as follows:)
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING|
|Time_BodyAcceleration_mean_X	|tBodyAcc-mean()-X	|Mean of time signal domain with Body Accelerator, X-as position|
|Time_BodyAcceleration_mean_Y	|tBodyAcc-mean()-Y	|Mean of time signal domain with Body Accelerator, Y-as position|
|Time_BodyAcceleration_mean_Z	|tBodyAcc-mean()-Z	|Mean of time signal domain with Body Accelerator, Z-as position|
|Time_BodyAcceleration_std_X	|tBodyAcc-std()-X	|Standard deviation of time signal domain with Body Accelerator, X-as position|
|Time_BodyAcceleration_std_Y	|tBodyAcc-std()-Y	|Standard deviation of time signal domain with Body Accelerator, Y-as position|
|Time_BodyAcceleration_std_Z	|tBodyAcc-std()-Z	|Standard deviation of time signal domain with Body Accelerator, Z-as position|
|Time_GravityAcceleration_mean_X	|tGravityAcc-mean()-X	|Mean of time signal domain with Gravity Accelerator, X-as position|
|Time_GravityAcceleration_mean_Y	|tGravityAcc-mean()-Y	|Mean of time signal domain with Gravity Accelerator, Y-as position|
|Time_GravityAcceleration_mean_Z	|tGravityAcc-mean()-Z	|Mean of time signal domain with Gravity Accelerator, Z-as position|
|Time_GravityAcceleration_std_X	|tGravityAcc-std()-X	|Standard deviation of time signal domain with Gravity Accelerator, X-as position|
|Time_GravityAcceleration_std_Y	|tGravityAcc-std()-Y	|Standard deviation of time signal domain with Gravity Accelerator, Y-as position|
|Time_GravityAcceleration_std_Z	|tGravityAcc-std()-Z	|Standard deviation of time signal domain with Gravity Accelerator, Z-as position|
|Time_BodyAccelerationJerk_mean_X	|tBodyAccJerk-mean()-X	|Mean of time signal domain with Jerk Body Accelerator, X-as position|
|Time_BodyAccelerationJerk_mean_Y	|tBodyAccJerk-mean()-Y	|Mean of time signal domain with Jerk Body Accelerator, Y-as position|
|Time_BodyAccelerationJerk_mean_Z	|tBodyAccJerk-mean()-Z	|Mean of time signal domain with Jerk Body Accelerator, Z-as position|
|Time_BodyAccelerationJerk_std_X	|tBodyAccJerk-std()-X	|Standard deviation of time signal domain with Jerk Body Accelerator, X-as position|
|Time_BodyAccelerationJerk_std_Y	|tBodyAccJerk-std()-Y	|Standard deviation of time signal domain with Jerk Body Accelerator, Y-as position|
|Time_BodyAccelerationJerk_std_Z	|tBodyAccJerk-std()-Z	|Standard deviation of time signal domain with Jerk Body Accelerator, Z-as position|
|Time_BodyGyroscope_mean_X	|tBodyGyro-mean()-X	|Mean of time signal domain with Body Gyroscope, X-as position|
|Time_BodyGyroscope_mean_Y	|tBodyGyro-mean()-Y	|Mean of time signal domain with Body Gyroscope, Y-as position|
|Time_BodyGyroscope_mean_Z	|tBodyGyro-mean()-Z	|Mean of time signal domain with Body Gyroscope, Z-as position|
|Time_BodyGyroscope_std_X	|tBodyGyro-std()-X	|Standard deviation of time signal domain with Body Gyroscope, X-as position|
|Time_BodyGyroscope_std_Y	|tBodyGyro-std()-Y	|Standard deviation of time signal domain with Body Gyroscope, Y-as position|
|Time_BodyGyroscope_std_Z	|tBodyGyro-std()-Z	|Standard deviation of time signal domain with Body Gyroscope, Z-as position|
|Time_BodyGyroscopeJerk_mean_X	|tBodyGyroJerk-mean()-X	|Mean of time signal domain with Jerk Body Gyroscope, X-as position|
|Time_BodyGyroscopeJerk_mean_Y	|tBodyGyroJerk-mean()-Y	|Mean of time signal domain with Jerk Body Gyroscope, Y-as position|
|Time_BodyGyroscopeJerk_mean_Z	|tBodyGyroJerk-mean()-Z	|Mean of time signal domain with Jerk Body Gyroscope, Z-as position|
|Time_BodyGyroscopeJerk_std_X	|tBodyGyroJerk-std()-X	|Standard deviation of time signal domain with Jerk Body Gyroscope, X-as position|
|Time_BodyGyroscopeJerk_std_Y	|tBodyGyroJerk-std()-Y	|Standard deviation of time signal domain with Jerk Body Gyroscope, Y-as position|
|Time_BodyGyroscopeJerk_std_Z	|tBodyGyroJerk-std()-Z	|Standard deviation of time signal domain with Jerk Body Gyroscope, Z-as position|
|Time_BodyAccelerationMagnitude_mean	|tBodyAccMag-mean()	|Mean of time signal domain with Body Accelerator, Magnitude|
|Time_BodyAccelerationMagnitude_std	|tBodyAccMag-std()	|Standard deviation of time signal domain with Body Accelerator, Magnitude|
|Time_GravityAccelerationMagnitude_mean	|tGravityAccMag-mean()	|Mean of time signal domain with Gravity Accelerator, Magnitude|
|Time_GravityAccelerationMagnitude_std	|tGravityAccMag-std()	|Standard deviation of time signal domain with Gravity Accelerator, Magnitude|
|Time_BodyAccelerationJerkMagnitude_mean	|tBodyAccJerkMag-mean()	|Mean of time signal domain with Jerk Body Accelerator, Magnitude|
|Time_BodyAccelerationJerkMagnitude_std	|tBodyAccJerkMag-std()	|Standard deviation of time signal domain with Jerk Body Accelerator, Magnitude|
|Time_BodyGyroscopeMagnitude_mean	|tBodyGyroMag-mean()	|Mean of time signal domain with Body Gyroscope, Magnitude|
|Time_BodyGyroscopeMagnitude_std	|tBodyGyroMag-std()	|Standard deviation of time signal domain with Body Gyroscope, Magnitude|
|Time_BodyGyroscopeJerkMagnitude_mean	|tBodyGyroJerkMag-mean()	|Mean of time signal domain with Jerk Body Gyroscope, Magnitude|
|Time_BodyGyroscopeJerkMagnitude_std	|tBodyGyroJerkMag-std()	|Standard deviation of time signal domain with Jerk Body Gyroscope, Magnitude|
|Frequency_BodyAcceleration_mean_X	|fBodyAcc-mean()-X	|Mean of frequency signal domain with Body Accelerator, X-as position|
|Frequency_BodyAcceleration_mean_Y	|fBodyAcc-mean()-Y	|Mean of frequency signal domain with Body Accelerator, Y-as position|
|Frequency_BodyAcceleration_mean_Z	|fBodyAcc-mean()-Z	|Mean of frequency signal domain with Body Accelerator, Z-as position|
|Frequency_BodyAcceleration_std_X	|fBodyAcc-std()-X	|Standard deviation of frequency signal domain with Body Accelerator, X-as position|
|Frequency_BodyAcceleration_std_Y	|fBodyAcc-std()-Y	|Standard deviation of frequency signal domain with Body Accelerator, Y-as position|
|Frequency_BodyAcceleration_std_Z	|fBodyAcc-std()-Z	|Standard deviation of frequency signal domain with Body Accelerator, Z-as position|
|Frequency_BodyAccelerationJerk_mean_X	|fBodyAccJerk-mean()-X	|Mean of frequency signal domain with Jerk Body Accelerator, X-as position|
|Frequency_BodyAccelerationJerk_mean_Y	|fBodyAccJerk-mean()-Y	|Mean of frequency signal domain with Jerk Body Accelerator, Y-as position|
|Frequency_BodyAccelerationJerk_mean_Z	|fBodyAccJerk-mean()-Z	|Mean of frequency signal domain with Jerk Body Accelerator, Z-as position|
|Frequency_BodyAccelerationJerk_std_X	|fBodyAccJerk-std()-X	|Standard deviation of frequency signal domain with Jerk Body Accelerator, X-as position|
|Frequency_BodyAccelerationJerk_std_Y	|fBodyAccJerk-std()-Y	|Standard deviation of frequency signal domain with Jerk Body Accelerator, Y-as position|
|Frequency_BodyAccelerationJerk_std_Z	|fBodyAccJerk-std()-Z	|Standard deviation of frequency signal domain with Jerk Body Accelerator, Z-as position|
|Frequency_BodyGyroscope_mean_X	|fBodyGyro-mean()-X	|Mean of frequency signal domain with Body Gyroscope, X-as position|
|Frequency_BodyGyroscope_mean_Y	|fBodyGyro-mean()-Y	|Mean of frequency signal domain with Body Gyroscope, Y-as position|
|Frequency_BodyGyroscope_mean_Z	|fBodyGyro-mean()-Z	|Mean of frequency signal domain with Body Gyroscope, Z-as position|
|Frequency_BodyGyroscope_std_X	|fBodyGyro-std()-X	|Standard deviation of frequency signal domain with Body Gyroscope, X-as position|
|Frequency_BodyGyroscope_std_Y	|fBodyGyro-std()-Y	|Standard deviation of frequency signal domain with Body Gyroscope, Y-as position|
|Frequency_BodyGyroscope_std_Z	|fBodyGyro-std()-Z	|Standard deviation of frequency signal domain with Body Gyroscope, Z-as position|
|Frequency_BodyAccelerationMagnitude_mean	|fBodyAccMag-mean()	|Mean of frequency signal domain with Body Accelerator, Magnitude|
|Frequency_BodyAccelerationMagnitude_std	|fBodyAccMag-std()	|Standard deviation of frequency signal domain with Body Accelerator, Magnitude|
|Frequency_BodyAccelerationJerkMagnitude_mean	|fBodyBodyAccJerkMag-mean()	|Mean of frequency signal domain with Jerk Body Accelerator, Magnitude|
|Frequency_BodyAccelerationJerkMagnitude_std	|fBodyBodyAccJerkMag-std()	|Standard deviation of frequency signal domain with Jerk Body Accelerator, Magnitude|
|Frequency_BodyGyroscopeMagnitude_mean	|fBodyBodyGyroMag-mean()	|Mean of frequency signal domain with Body Gyroscope, Magnitude|
|Frequency_BodyGyroscopeMagnitude_std	|fBodyBodyGyroMag-std()	|Standard deviation of frequency signal domain with Body Gyroscope, Magnitude|
|Frequency_BodyGyroscopeJerkMagnitude_mean	|fBodyBodyGyroJerkMag-mean()	|Mean of frequency signal domain with Jerk Body Gyroscope, Magnitude|
|Frequency_BodyGyroscopeJerkMagnitude_std	|fBodyBodyGyroJerkMag-std()	|Standard deviation of frequency signal domain with Jerk Body Gyroscope, Magnitude|
