##Download and unzip the data for the project.

#url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(url, destfile="Dataset.zip", method="curl")

#unzip("Dataset.zip")

#setwd("UCI HAR Dataset")




##Load the data and assign proper labels to variables (step 4 from assignment instructions)

features <- read.table("features.txt")
features[, 2] <- as.character(features[, 2])

subject_test <- read.table("test/subject_test.txt", col.names = "subject")
subject_train <- read.table("train/subject_train.txt", col.names = "subject")

X_test <- read.table("test/X_test.txt", col.names = features[, 2])
Y_test <- read.table("test/Y_test.txt", col.names = "activity")

X_train <- read.table("train/X_train.txt", col.names = features[, 2])
Y_train <- read.table("train/Y_train.txt", col.names = "activity")




##Merging training and test data sets, while extracting only the measurements on the mean and std.
##(Step 1 and 2 from the assignment instructions)

X = rbind(X_test, X_train)
Y = rbind(Y_test, Y_train)
subject = rbind(subject_test, subject_train)

rm(X_test, X_train, Y_test, Y_train, subject_test, subject_train)

X <- X[, grepl("mean", features[, 2]) | grepl("std", features[, 2])]

DF = data.frame("subject" = subject, "X" = X, "Y" = Y)




##Use descriptive activity names for the dataset (step 3)

DF$activity <- factor(DF$activity)
foo <- read.table("activity_labels.txt")
foo <- foo[, 2]
levels(DF$activity) <- foo
rm(foo)




##creates a second, independent tidy data set with the average of each variable
##for each activity and each subject.
s <- split(DF, list(DF$activity, DF$subject))
tidy_set <- lapply(s, function(x) colMeans(x[, 2:80]))

write.table(tidy_set, "tidy.txt", row.names = FALSE)


