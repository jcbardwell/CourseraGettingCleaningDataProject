---
title: "README"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

This document explains what the R script is doing.

## Note: The X_test.txt and X_train.txt files had to be zipped because they were too big to upload to GitHub. They need to be unzipped in the working directory before running the script or it won't work.

## Explanation of the run_analysis script
Lines 5-8: The column names are read into R using the features.txt file and then converted to a vector from a data frame so it can be used to name the columns in the read.table function using the col.names argument when reading in the test and train data. This also fulfills Step 4 (appropriately label the data set with descriptive variable names).

Lines 11-20: The test data is read into R and Step 2 (extract only the mean and standard deviation measurements) is also fulfilled using regular expressions since the column names have already been added:
```
test_data <- select(test_data, grep("mean()|std()", names(test_data)))
```
The three subsets of test data are then joined together using cbind().

Lines 24-32: Same as lines 11-20 but for the train data instead of the test data.

Line 35: Join the test and train data using rbind(). This fulfills Step 1 (merge the training and the test sets to create one data set).

Lines 45-50: Replace the activity codes with the names of the activity with activity_labels.txt as the reference. This fulfills Step 3 (use descriptive activity names to name the activities in the data set).

Line 63: Group the data table by Subject and Activity so the variables can be averaged.

Line 66: Apply the mean function to each Subject and Activity, resulting in 180 rows (30 subjects x 6 activities) and fulfilling Step 5 (from  the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject).

