#Getting and Cleaning Data - Course Project
class.coursera.org/getdata-013

##Summary
Deliverables:
* run_analysis.R
* tidy.txt
* CodeBook.md
* README.md


All other files in this repository are obtained from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full description of the data is available from README.txt and
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


##Description

###The Script
run_analysis.R produces "tidy.txt", a tidy data set as specified in the requirements of the assignment in the following way.
* First, it loads the features, test and training data into memory by using the read.table() function. Important objects are "subject", "X_test", "X_train", "Y_test", and "Y_train". The features are needed for assigning variable names to X. Variable names (column names) are specified explicitly with the read.table() function to comply with tidy data principles.
* It then merges the test and train data together by using the rbind() function. Objects are removed as necessary to save memory. After this step, only "subject", "X", and "Y" are needed.
* It extracts measurements on the mean and standard deviation by selecting (pattern matching via grepl) and keeping only the subset of X consisting of the column names "mean" OR "std".
* It creates a data frame that contains "subject", "X", and "Y".
* It replaces the activity column in the data frame by the names given in "activity_labels.txt". This is done by first converting the entire column into factor and then renaming the levels.
* It splits the data frame (via the split function) by the activity and subject. It then uses lapply to calculate the column means for each variable for each activity and each subject.
* Finally, it writes into a file named "tidy.txt" via the write.table() function using row.names = FALSE.

###The tidy data set
tidy.txt is written using write.table() with row.names = FALSE.
To read the file back into R, use the following command:
```{r}
data <- read.table("tidy.txt", header = TRUE)
```
More details on the variables can be found in CodeBook.md

###The Code Book