
getData <- function() {
        ## A) Parameters
        ## This script has no parameters
        
        ## B) Objetive
        ## To produce a tidy dataset from rawdata from an activity tracking experiment
        ## See Readme for more details
        
        ## C) Procedure
        
        ## c.1) Initial parameters: url where the data is obtained and the name given to the downloaded file
        
        zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        zipName <- "UCI HAR Dataset.zip"
        
        ## c.2) If required, creates a directory for the file and downloads it (also if required) 
        ##if(!file.exists("./data")){dir.create("./data")}
        if(!file.exists(zipName)){ download.file(zipUrl,destfile=zipName,method="curl")}
        
        ## c.3) Reads the required data from the zipped file
        ## Please note: The script was writed using OS X 10.1.1
        act_labels <- read.table(unz(zipName, filename = "UCI HAR Dataset/activity_labels.txt"))
        features <- read.table(unz(zipName, filename = "UCI HAR Dataset/features.txt"))
        subject_train <- read.table(unz(zipName, filename = "UCI HAR Dataset/train/subject_train.txt"))
        x_train <- read.table(unz(zipName, filename = "UCI HAR Dataset/train/X_train.txt"))
        y_train <- read.table(unz(zipName, filename = "UCI HAR Dataset/train/y_train.txt"))
        subject_test <- read.table(unz(zipName, filename = "UCI HAR Dataset/test/subject_test.txt"))
        x_test <- read.table(unz(zipName, filename = "UCI HAR Dataset/test/X_test.txt"))
        y_test <- read.table(unz(zipName, filename = "UCI HAR Dataset/test/y_test.txt"))
        
        ## c.4) Adds the column names to the previously loaded data in order to 
        ## "appropriately label the data set with descriptive variable names"
        ## c.4.1) For the "train" set
        colnames(subject_train) <- "subject_id"
        colnames(y_train) <- "activity_label"
        colnames(x_train) <- features[,2]
        ## c.4.3) For the "test" set
        colnames(subject_test) <- "subject_id"
        colnames(y_test) <- "activity_label"
        colnames(x_test) <- features[,2]
        
        ## c.5) Merges the training and the test sets to create one data set
        ## c.5.1) First creates one dataset for the "test" data and other for the "train" data
        train <- cbind(subject_train, y_train, x_train)
        test <- cbind(subject_test, y_test, x_test)
        ## c.5.2) Then combines "test" and "train" datasets 
        act_df <- rbind(train, test)
        
        ## c.6) Extracts only the measurements on the mean and standard deviation for each measurement
        act_df <- act_df[,!duplicated(features$V2)]
        act_tbldf <- tbl_df(act_df)
        act_subtbl <- tbl_df(select(act_tbldf, subject_id, activity_label, contains("mean"), contains("std")))

        ## c.7) Uses the names given in the "activity_labels.txt" file to describe activity names in the data set
        act_subtbl$activity_label <- ifelse(act_subtbl$activity_label == 1, "WALKING", act_subtbl$activity_label)
        act_subtbl$activity_label <- ifelse(act_subtbl$activity_label == 2, "WALKING_UPSTAIRS", act_subtbl$activity_label)
        act_subtbl$activity_label <- ifelse(act_subtbl$activity_label == 3, "WALKING_DOWNSTAIRS", act_subtbl$activity_label)
        act_subtbl$activity_label <- ifelse(act_subtbl$activity_label == 4, "SITTING", act_subtbl$activity_label)
        act_subtbl$activity_label <- ifelse(act_subtbl$activity_label == 5, "STANDING", act_subtbl$activity_label)
        act_subtbl$activity_label <- ifelse(act_subtbl$activity_label == 6, "LAYING", act_subtbl$activity_label)
        
        ## c.8) Creates a data set with the average of each variable for each activity and each subject
        ## and writes the data into a file
        act_tidy <- act_subtbl %>%
                        group_by(subject_id, activity_label) %>%
                                summarise_each(funs(mean))     
        write.table(act_tidy,"act_tidy.txt", sep=" ", row.names=FALSE)   
}