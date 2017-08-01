# Course Project: Getting and Cleaning Data

## Introduction
This vignette gives an example for the analysis of a typical social science data set. It is the data file of the American National Election Study of 19481 available from the American National Election Studies website.
The data file contains data from to USA-wide surveys conducted October and November 1948 by the Survey Research Centre, University Michigan (principal investigators: Angus Campbell and Robert L. Kahn).
The total number of cases in the data set is 662 and the number of variables is 65 (more details about this data set can be found at http://www.electionstudies.org/studypages/1948prepost/1948prepost.htm).

With 662 cases and 65 variables, the 1948 ANES data set is relatively small as compared to current social science data sets. Such larger data sets can be processed along the same lines as in this vignette.
Unlike the 1948 ANES data, their size as well as, in some cases, legal restrictions prohibit the inclusion of such a data set into the package, however.

This vignette starts with a demontration how a data file can be examined before loading it and how a subset of the data can be loaded into memory.
After loading this subset into memory, some desciptive analyses are conducted that showcase the construction of contingency tables and of general tables of desriptive statistics using the genTable function.
In addition, a logit analysis is demonstrated and the collection of several logit coefficients into a comprehensive table by the mtable function.

It should be noted that the analyses reported in the following are conducted only for purpose of demonstrating the features of the package and are not to be considered of conclusive scientific evidence of any kind.

This vignette is run with the help of the data.table package. Therefore no dplyr package is needed. This included reading the data, merging, updating columns and aggregation.
Before we start, we adjust knitr’s output (with which this vignette is formatted) to produce HTML where possible.

## Raw Data

The data to process is retrieved from the following website [DataWebsite](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
or directly the data under [Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Method

* First I have loaded the feature labels. As I load them with "fread" there are stored as a data.table. I need them as a vector, what I do with the following snippet.

* Then I load train data and assigning in the same step the feature labels as columns. I load the subject and activity data and bind all three data to one data set. I do the same for the test data. 
In parallel, I remove unneeded data to clean the workspace. Finally I bind the train and test set together to have one data set.

* The mean and standard deviation columns were found with a grep command and saved as a variable. This variable was then placed within a data.table command to only retrieve the columns defined with the grep command.

* The activity labels were loaded and merged with the data set to have a separate column with the name of each activity. This was done with a data.table command by reference.

* As an identifier there are now the subject, the activity and the activity name column in the data set. With these identifier the grouping was done to calculate the mean on each remaing column, which was done
with the .SD command and lapply again inside a data.table command. This was saved as a separate data set (= Data2).



