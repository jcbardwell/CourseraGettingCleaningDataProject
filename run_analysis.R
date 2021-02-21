# Step 1: Merge the training and the test sets to create one data set

  # Header is not included in test and train data. Read in features.txt as a 
  # vector to use in the col.names argument when reading in the test and train data
table_col_names <- read.delim(file = "features.txt", header=FALSE)
  # Convert column names data frame into a character vector
table_col_names <- table_col_names[,1]

  # Read in all data for test set and merge together
    # Read in test data
test_data <- read.table(file = "X_test.txt", col.names = table_col_names)
    # Read in test labels
test_labels <- read.table(file = "y_test.txt", col.names = "Activity")
    # Read in subject data for test set
test_subject <- read.table(file = "subject_test.txt", col.names = "Subject_ID")
    # Extract only mean and standard deviation measurements
test_data <- select(test_data, grep("mean()|std()", names(test_data)))
    # Merge the test data, labels, and subject IDs
test_table <- cbind(test_subject, test_labels, test_data)

  # Read in all data for training set and merge together
    # Read in training data
train_data <- read.table(file = "X_train.txt", col.names = table_col_names)
    # Read in training labels
train_labels <- read.table(file = "y_train.txt", col.names = "Activity")
    # Read in subject data for training set
train_subject <- read.table(file = "subject_train.txt", col.names = "Subject_ID")
    # Extract only mean and standard deviation measurements
train_data <- select(train_data, grep("mean()|std()", names(train_data)))
    # Merge the training data, labels, and subject IDs
train_table <- cbind(train_subject, train_labels, train_data)

  # Merge the test and training sets
data_table <- rbind(test_table, train_table)

# Step 2: Extract only the measurements on the mean and standard deviation 
#         for each measurement

    # See lines 17-18 and 29-30

# Step 3: Use descriptive activity names to name the activities in the data set

  # Replace the activity codes with activity names
data_table$Activity[data_table$Activity == "1"] <- "WALKING"
data_table$Activity[data_table$Activity == "2"] <- "WALKING_UPSTAIRS"
data_table$Activity[data_table$Activity == "3"] <- "WALKING_DOWNSTAIRS"
data_table$Activity[data_table$Activity == "4"] <- "SITTING"
data_table$Activity[data_table$Activity == "5"] <- "STANDING"
data_table$Activity[data_table$Activity == "6"] <- "LAYING"

# Step 4: Appropriately label the data set with descriptive variable names

  # See lines 6-8 (creating vector of column names using features.txt),
  # lines 11-12 (reading in test data table and using col.names argument w/
  # column names vector), and lines 23-24 (reading in train data table and
  # using col.names argument w/ column names vector)

# Step 5: From  the data set in step 4, create a second, independent tidy data 
#         set with the average of each variable for each activity and each subject

  # Group the data set by Subject and then by activity
grouped_data <- group_by(data_table, Subject_ID, Activity)

  # Apply mean function to each group
summarized_data <- summarize_each(grouped_data, mean)

  # Convert from tibble to data frame
summarized_data <- as.data.frame(summarized_data)

  # View data frame
View(summarized_data)