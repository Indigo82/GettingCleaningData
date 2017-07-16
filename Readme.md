The task was mainly build with the data.table package. Therefore no dplyr is needed. This included reading the data, merging, updating columns and aggregation.

First I have loaded the feature labels. As I load them with "fread" there are stored as a data.table. I need them as a vector, what I do with the following snippet.

Then I load train data and assigning in the same step the feature labels as columns. I load the subject and activity data and bind all three data to one data set. I do the same for the test data. 
In parallel, I remove unneeded data to clean the workspace. Finally I bind the train and test set together to have one data set.

The mean and standard deviation columns were found with a grep command and saved as a variable. This variable was then placed within a data.table command to only retrieve the columns defined with the grep command.

The activity labels were loaded and merged with the data set to have a separate column with the name of each activity. This was done with a data.table command by reference.

As an identifier there are now the subject, the activity and the activity name column in the data set. With these identifier the grouping was done to calculate the mean on each remaing column, which was done
with the .SD command and lapply again inside a data.table command. This was saved as a separate data set (= Data2).



