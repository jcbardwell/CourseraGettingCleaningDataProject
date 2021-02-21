---
title: "CodeBook"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

## Data Description
The data comes from "Human Activity Recognition Using Smartphones Dataset" by Reyes-Ortiz et al.

## Variables
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

## Transformations
The data was separated into two set: test and training. Further, each test and training set were further separated into three subsets: data, labels, and subjects. The subsets had to be joined using cbind() to form the test and training sets. Then the test and training sets were joined into one set using rbind().

Only the mean and standard deviation columns were required, so the select() and grep() functions were used (see lines 17-18 and 29-30).

Then the activity codes were replaced with the actual name of the activity. Lastly, the data table was grouped by Subject and Activity and the mean of each column was taken.

