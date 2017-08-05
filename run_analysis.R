#Download file from internet and unzip
setwd("C:\\Users\\Sven\\Desktop\\GettingCleaningData\\") #  set working directory
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("RawData.zip")){download.file(url = URL, destfile = "RawData.zip")}; unzip("RawData.zip"); rm(URL) # if file already exists otherwise download and unzip
setwd("C:\\Users\\Sven\\Desktop\\GettingCleaningData\\UCI HAR Dataset\\") #  set working directory


library(data.table)
#Appropriately labels the data set with descriptive variable names. 
cols <- fread("features.txt"); cols <- cols[, V2] # load colnames and convert data.table to vector


#Merges the training and the test sets to create one data set.
#load train data
xtrain        <- fread("train\\x_train.txt",       col.names = cols)
xsubjecttrain <- fread("train\\subject_train.txt", col.names = "subject")
ytrain        <- fread("train\\y_train.txt",       col.names = "activity")
xtrain        <- cbind(xsubjecttrain, ytrain, xtrain); rm(xsubjecttrain, ytrain) # add subject and activity to train data
#load test data
xtest        <- fread("test\\X_test.txt",          col.names = cols); rm(cols)
xsubjecttest <- fread("test\\subject_test.txt",    col.names = "subject")
ytest        <- fread("test\\y_test.txt",          col.names = "activity")
xtest <- cbind(xsubjecttest, ytest, xtest); rm(xsubjecttest, ytest) # add subject  and activity to test data


Data  <- rbind(xtrain, xtest); rm(xtrain, xtest) # merge train and test


#Extracts only the measurements on the mean and standard deviation for each measurement. 
cols <- grep("subject|activity|mean|std", colnames(Data), value = T) # the mean and std columns and identifiers
Data <- Data[, (cols), with = FALSE]; rm(cols)

#Uses descriptive activity names to name the activities in the data set
activitytable <- fread("E:\\Weiterbildung\\06_Progamming\\R\\Coursera\\GettingData\\Week4\\Projekt\\UCI HAR Dataset\\activity_labels.txt", col.names = c("activity", "activityname"))
Data[activitytable, activityname := activityname, on = .(activity)]; rm(activitytable)

# all columns lowercase and clean name without / and () and -
colnames(Data) <- gsub("\\(|\\)", "", colnames(Data)) # remove paranthesis
colnames(Data) <- gsub("-", "", colnames(Data)) # remove "-"


#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Data[, activity := NULL]
fwrite(Data, file = "C:\\Users\\Sven\\Desktop\\GettingCleaningData\\ProcessedData.csv")
GroupedData <- Data[, lapply(.SD, mean), by = c("subject", "activityname")]
fwrite(GroupedData, file = "C:\\Users\\Sven\\Desktop\\GettingCleaningData\\GroupedData.csv") #write data in a csv
rm(Data, GroupedData)
