---
title: "CodeBook.md"
author: "Kevin Siswandi"
date: "24 April 2015"
output:
  html_document:
    keep_md: yes
---

__This codebook describes the variables in "tidy.txt" and its values.__


##Variables
_Description of variables contained in the tidy data set_

Each variable is written in the format "activity.subject", which describes an activity performed by a particular volunteer (subject) while wearing a Samsung Galaxy S II on his/her waist. For example, LAYING.30 contains the measurements for subject number 30 performing activity of LAYING.

There are 6 possible activities:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

There are a total of 30 subjects/volunteers.

The variables in the tidy data set are all the possible combinations (interactions) of activity and subject. For example, LAYING.30 contains the measurements for subject number 30 performing activity of LAYING.

There are a total of 180 variables.


##Observations
_Description of each observation/measurement_

Each row in "tidy.txt" corresponds to a measurement involving mean() or std(), sorted according to the order they appear in "features.txt". There are two different kinds of measurements:
* Acceleration is reported in standard gravity units 'g'.
* Angular Velocity is reported in radians/second.

There are a total of 79 observations. Refer to features_info.txt and README.txt for more details on each measurement.

##Summary Choices

###Values
Each value of observation in "tidy.txt" is the average of the corresponding measurement over all records in X_test and X_train. For example, the first row in "tidy.txt" is the average of all records of tBodyAcc-mean()-X, which corresponds to the first column in X_test and X_train.

###Raw Data
_Raw data used in the cleaning process_

* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt
* features.txt
* activity_labels.txt

###Cleaning Process
1. Merging data
    + "X_test" and "X_train" are merged into a single dataset called "X".
    + "y_test" and "y_train" are merged into a single dataset called "Y".
    + "subject_test" and "subject_train" are merged into a single dataset called "subject"
    + "subject", "X", and "Y" are combined into a single data frame
2. Extract only measurements involving mean and standard deviation
    + This is done by pattern matching using grepl on the features name
    + Features names from "features.txt" are used to label the variables/columns of "X"
3. Use descriptive variable names
    + Variable name "subject" is assigned to the first column of the data frame
    + Features names from "features.txt" are used to label the variables/columns of "X"
    + Variable name "activity" is assigned to the last column of the data frame
    + The labels from "activity_labels.txt" are used to replace the numeric labels in the last column.
4. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
    + The data frame is split with split function
    + colMeans() is applied to column number 2 to the second last via lapply.
    + write.table() is used to write the dataset into "tidy.txt" with row.names = FALSE.

###Original Codebooks
_Original codebooks that described the project and the raw data_

* README.txt
* features_info.txt