---
title: "CodeBook.md"
author: "Kevin Siswandi"
date: "24 April 2015"
output:
  html_document:
    keep_md: yes
---

##Original Codebooks
_Original codebooks that described the project and the raw data_

* README.txt
* features_info.txt

##Raw Data
_Raw data used in the cleaning process_
* test/subject_test.txt
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt
* features.txt
* activity_labels.txt

##Variables Description
_Description of variables contained in the tidy data set_

Each variable is written in the format "activity.subject", which describes an activity performed by a particular volunteer (subject) while wearing a Samsung Galaxy S II on her waist. For example, LAYING.30 contains the measurements for subject number 30 performing activity of LAYING.

There are 6 possible activities:

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

There are a total of 30 subjects/volunteers.

The variables in the tidy data set are all the possible combinations (interactions) of activity and subject. For example, LAYING.30 contains the measurements for subject number 30 performing activity of LAYING.


This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
