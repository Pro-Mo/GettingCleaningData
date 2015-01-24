#Cleaning data - Samsung Accelerometers
#See CodeBook for descriptions of all variables: CodeBook.md
#See README file on what the codes does an how to run it: README.md

#scripts expects a directory with all the files 'UCI HAR Dataset' present in the wd or you can specify
run_analysis <- function(directory = 'UCI HAR Dataset') {
      require("data.table")
      require("plyr")
      require("dplyr")
      
      ## step 0: get the data from internet (if not already given)
      if(!file.exists(directory)){
            dir.create(directory)
            setwd(directory)
            temp <- tempfile()
            download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip', temp)
            unzip(temp)
      }
      ## Step 1: merging the test and train together
      # initiate empty data.table;
      DT <- data.table()
      ## open train and test set in given directory;
      for(i in c("train", "test")){    
            i_path <- paste(directory,i,paste("X_",i,".txt",sep=""), sep="/")
            i_DT <- data.table(read.table(i_path))
            #add subject and activity as columns 562 and 563;
            i_DT <- mutate(i_DT, subject = readLines(paste(directory,i,paste("subject_",i,".txt",sep=""), sep="/")))
            i_DT <- mutate(i_DT, activity = readLines(paste(directory,i,paste("y_",i,".txt",sep=""), sep="/")))
            #print(i_DT[1,561:563, with=F])
            DT <- rbind(DT, i_DT)
      }
      
      ## Add header to columns from the features file;
      features_file <- read.table(paste(directory,"features.txt", sep="/"))
      setnames(DT,1:561,as.character(features_file[1:561,2]))
      #print(DT[1,561:562, with=F])

      ## Step 2: select only the columns which mention 'mean()' or 'std()'
      ## and of course the subject and activity columns
      DT_subset <- DT[,grep(pattern ="mean\\(|std\\(|subject|activity", names(DT)),with=F]
      #print(DT_subset[1,66:68, with=F])
      
      ## Step 3: Use descriptive activity names to name the activities in the data set
      activity_labels <- read.table(paste(directory,"activity_labels.txt", sep="/"))
      DT_subset <- mutate(DT_subset, activity = activity_labels[activity,2])
      #print(DT_subset[1,66:68, with=F])
      
      ## Step 4: Appropriately label the data set with descriptive variable names
      #print(colnames(DT_subset))
      #replace interpunctions with one underscore
      attr(DT_subset, "names") <- gsub("[-() ]", "_", names(DT_subset))
      attr(DT_subset, "names") <- gsub("___", "_", names(DT_subset))
      attr(DT_subset, "names") <- gsub("_*$", "", names(DT_subset))
      #write out abbreviations
      attr(DT_subset, "names") <- gsub("Acc", "Acceleration", names(DT_subset))
      attr(DT_subset, "names") <- gsub("Gyro", "Gyroscope", names(DT_subset))
      attr(DT_subset, "names") <- gsub("Mag", "Magnitude", names(DT_subset))
      #write out the t and f at the beginning and add underscore for readibility
      attr(DT_subset, "names") <- gsub("^t", "Time_", names(DT_subset))
      attr(DT_subset, "names") <- gsub("^f", "Frequency_", names(DT_subset))
      attr(DT_subset, "names") <- gsub("BodyBody", "Body", names(DT_subset))
      #print(colnames(DT_subset))

      ## Step 5: Create set with the average of each variable for each activity and each subject.
      #group by subject and activity
      by_subject_activity <- group_by(DT_subset, subject, activity)
      DT_means <- unique(mutate_each(by_subject_activity, funs(mean)))
      DT_means <- DT_means[,c(67,68, 1:66),with=F]
      write.table(DT_means, file = paste(directory,"Run_analysis_Output.txt",sep="/"), sep = ",", row.names=F, fileEncoding = "UTF-8")
}