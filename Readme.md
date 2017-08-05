# Course Project: Getting and Cleaning Data

## Data Set Information
It is the data file Smartlab of 2015 available from the [Machine Learning Repository](https://archive.ics.uci.edu/ml/datasets/Smartphone-Based+Recognition+of+Human+Activities+and+Postural+Transitions).
The data is called "Human Activity Recognition Using Smartphones Dataset". The total number of instances in the dataset is 10,929 and the number of attributes is 561.
The dataset can directly be retrieved under [RawData](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Method

* The script was written with the help of the data.table package. Therefore no dplyr package is needed. This included reading the data, merging, updating columns and aggregation.

* After loading and unzipping the dataset, the single unzipped files are loaded in the workspace, the they are labelled  merged together.

* From the dataset only the column with mean and standard deviation are kept. 

* The activity labels were loaded and merged with the data set to have a separate column with the name of each activity. 

* The columns were cleaned from brackets and other symbols.

* The data is then grouped by subject and activity name and finally saved as TidyData.



