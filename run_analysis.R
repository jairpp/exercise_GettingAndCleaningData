
#01 Merges the training and the test sets to create one data set.
#02 Extracts only the measurements on the mean and standard deviation for each measurement.
#03 Uses descriptive activity names to name the activities in the data set
#04 Appropriately labels the data set with descriptive variable names.
#05 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each 
#   activity and each subject.

#Set Working Directory
#setwd("exercise_GettingAndCleaningData")

#Download data
if(!file.exists(".\\downloadedData.zip")){
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, destfile= "downloadedData.zip")    
}


#Stores Dwnload date
downloadedDataDate <- date()
write(downloadedDataDate,file = "downloadedDataDate.txt")

#Unzips data files
unzip("downloadedData.zip")

#read train and test data files
features <- read.table(file = "UCI HAR Dataset\\features.txt")
trainX <- read.table(file = "UCI HAR Dataset\\train\\X_train.txt",col.names = features[,2])
trainY <- read.table(file = "UCI HAR Dataset\\train\\Y_train.txt",col.names = "activity")
trainSubject <- read.table(file = "UCI HAR Dataset\\train\\subject_train.txt",col.names = "subject")
testX <- read.table(file = "UCI HAR Dataset\\test\\X_test.txt",col.names = features[,2])
testY <- read.table(file = "UCI HAR Dataset\\test\\Y_test.txt",col.names = "activity")
testSubject <- read.table(file = "UCI HAR Dataset\\test\\subject_test.txt",col.names = "subject")


#####  01 Merges the training and the test sets to create one data set.
#bind rows
X <- rbind(trainX,testX)
Y <- rbind(trainY,testY)
subject <- rbind(trainSubject,testSubject)
str(X)

# remove separated data frames
rm(trainX,trainY,trainSubject,testX,testY,testSubject)

#bind columns
mergeddataset <- cbind(subject,Y,X)
#write.table(mergeddataset, file="mergedDataset.txt", col.names = FALSE, row.names = FALSE)

# remove separated data frames
rm(X,Y,subject)


#####  02 Extracts only the measurements on the mean and standard deviation for each measurement.
library(dplyr)
tidydata <- tbl_df(mergeddataset) %>% select(subject,activity, contains("mean"), contains("std"))
str(tidydata)

#####  03 Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table(file = "UCI HAR Dataset\\activity_labels.txt", col.names = c("code","label"))
tidydata$activity <- factor(tidydata$activity, levels = activity_labels$code, labels = activity_labels$label)
table(tidydata$activity)


#####  04 Appropriately labels the data set with descriptive variable names.
str(tidydata)
names(tidydata) <- tolower(gsub(x = names(tidydata), pattern = '\\.', replacement = ''))


#####  05 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each 
#   activity and each subject.

tidyGroupedData <- group_by(tidydata, activity, subject) %>% summarise_all(mean)
write.table(x=tidyGroupedData,file = "tidyGroupedData.txt", row.names = FALSE)
str(tidyGroupedData)






