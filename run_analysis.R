#Cleaning data - Samsung Accelerometers
#See CodeBook for descriptions of all variables: CodeBook.md
#See README file on what the codes does an how to run it: README.md

#scripts expects a directory with all the files 'UCI HAR Dataset' present in the wd or you can specify
run_analysis <- function(directory = 'UCI HAR Dataset') {
      require("data.table")
      require("plyr")
      require("dplyr")
      
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
      attr(DT_subset, "names") <- gsub("[-() ]", "", names(DT_subset)) 
      #print(colnames(DT_subset[,1,with=F]))

      ## Step 5: Create set with the average of each variable for each activity and each subject.
      #group by subject and activity
      by_subject_activity <- group_by(DT_subset, subject, activity)
      DT_new <- unique(mutate_each(by_subject_activity, funs(mean)))
      #print(DT_new[1:5,c(1:3,ncol(DT_new)-1,ncol(DT_new)),with=F])
      write.table(DT_new, file = "output2.txt", sep = " , ", row.names=F, fileEncoding = "UTF-8")
}

