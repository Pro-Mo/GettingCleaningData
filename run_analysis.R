#Cleaning data - Samsung Accelerometers
#See CodeBook for descriptions of all variables: CodeBookSamsungAccelerometers.pdf
#See README file on what the codes does an how to run it: README.md

run_analysis <- function(directory = 'UCI HAR Dataset') {
      require("data.table")
      require("plyr")
      train_path <- paste(directory,"train","X_train.txt", sep="/")
      train_DT <- data.table(read.table(train_path, nrows = 10))      
      
      #open test set in given directory
      test_path <- paste(directory,"test","X_test.txt", sep="/")
      test_DT <- data.table(read.table(test_path, nrows = 10))
      
      #add column 'train' for good merging later
      test_DT <- mutate(test_DT, partition = "test")
      train_DT <- mutate(train_DT, partition = "train")
      #print(train_DT[1,561:562, with=FALSE])
      
      ## Step 1: merging the test and train together
      DT <- rbind(train_DT, test_DT)
      print(test_DT[1,561:562, with=F])
      #tables()
      #DT[,list(average(x))]
      
      ## Step 2: select only the mean and std columns; 
}

