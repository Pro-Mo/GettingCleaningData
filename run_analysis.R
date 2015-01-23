#Cleaning data - Samsung Accelerometers
#See CodeBook for descriptions of all variables: CodeBookSamsungAccelerometers.pdf
#See README file on what the codes does an how to run it: README.md

#scripts expects a directory with all the files 'UCI HAR Dataset' present in the wd or you can specify
run_analysis <- function(directory = 'UCI HAR Dataset') {
      require("data.table")
      require("plyr")
      require("dplyr")
      
      ## open train and test set in given directory;
      train_path <- paste(directory,"train","X_train.txt", sep="/")
      train_DT <- data.table(read.table(train_path, nrows = 100))
      #add column 562 'partition' with value 'train' for good merging later
      train_DT <- mutate(train_DT, partition = "train")
      #add subject and activity as columns 563 and 564;
      train_DT <- mutate(train_DT, subject = readLines("UCI HAR Dataset/train/subject_train.txt")[1:100])
      train_DT <- mutate(train_DT, activity = readLines("UCI HAR Dataset/train/y_train.txt")[1:100])
      #print(train_DT[1,561:564, with=F])
      
      ## do the same as above for test
      test_path <- paste(directory,"test","X_test.txt", sep="/")
      test_DT <- data.table(read.table(test_path, nrows = 100))      
      test_DT <- mutate(test_DT, partition = "test")
      test_DT <- mutate(test_DT, subject = readLines("UCI HAR Dataset/test/subject_test.txt")[1:100])
      test_DT <- mutate(test_DT, activity = readLines("UCI HAR Dataset/test/y_test.txt")[1:100])
      #print(test_DT[1,561:563, with=F])
      
      ## Step 1: merging the test and train together
      DT <- rbind(train_DT, test_DT)
      ## Add header to columns from the features file;
      features_file <- read.table(paste(directory,"features.txt", sep="/"))
      setnames(DT,1:561,as.character(features_file[1:561,2]))
      #print(DT[1,561:562, with=F])

      ## Step 2: select only the columns which mention 'mean()' or 'std()'
      ## and of course the partition, subject and activity columns
      DT_subset <- DT[,grep(pattern ="mean\\(|std\\(|subject|activity", names(DT)),with=F]
      #print(DT_subset[1,66:69, with=F])
      
      ## Step 3: Use descriptive activity names to name the activities in the data set
      activity_labels <- read.table(paste(directory,"activity_labels.txt", sep="/"))
      DT_subset <- mutate(DT_subset, activity = activity_labels[activity,2])
      #print(DT_subset[1,66:69, with=F])
      
      ## Step 4: Appropriately label the data set with descriptive variable names
      #print(colnames(DT_subset[,1,with=F]))
      attr(DT_subset, "names") <- gsub("[-() ]", "_", names(DT_subset)) 

      ## Step 5: Create set with the average of each variable for each activity and each subject.
      #group by subject and activity
      by_subject_activity <- group_by(DT_subset, subject, activity)
      DT_new <- unique(mutate_each(by_subject_activity, funs(mean)))
      print(DT_new[1:5,c(1:3,ncol(DT_new)-1,ncol(DT_new)),with=F])
      write.table(DT_new, file = "output.txt", sep = ",", row.names=F)
}

