#The following is a code for the Coursera course "Getting and Cleaning Data"
#This code will:
#1. Merge the training and the test sets to create one set (obtained from UCI HAR Dataset)
#2. Extracts the mean and standard deviation for each measurement.
#3. Use descriptive activity names to name the activities in the data set
#4. Appropriately label the data set with descriptive variable names.
#5. Create a tidy data set with the average of each variable for each activity and each subject.

#This function merges the two data sets (training and test) and outputs a single table with column headers.
#which must be in the directory "UCI HAR Dataset" in the script directory.
#If the dataset is in a different directory, adjust the variable "path" accordingly.

mergeDataset <- function(path) {
  #Load the measurement data (X) for both train and test
  filepath <- paste("./", path, "/train/X_train.txt", sep="")
  X_train <- read.table(filepath)
  filepath <- paste("./", path, "/test/X_test.txt", sep="")
  X_test <- read.table(filepath)
  
  #Load the y labels for both train and test
  filepath <- paste("./", path, "/train/y_train.txt", sep="")
  y_train <- read.table(filepath)
  filepath <- paste("./", path, "/test/y_test.txt", sep="")
  y_test <- read.table(filepath)
  
  
  #Load the activity labels
  filepath <- paste("./", path, "/activity_labels.txt", sep="")
  activity_labels <- read.table(filepath)
  
  #Load the subject labels
  filepath <- paste("./", path, "/train/subject_train.txt", sep="")
  subject_train <- read.table(filepath)
  filepath <- paste("./", path, "/test/subject_test.txt", sep="")
  subject_test <- read.table(filepath)
  
  #Merge the activity labels with the y labels
  y_activity_train <- merge(y_train, activity_labels, by="V1")
  y_activity_test <- merge(y_test, activity_labels, by="V1")
  
  #Add the activity labels and subject labels to the measurement data
  train_merged <- cbind(subject_train, y_activity_train, X_train)
  test_merged <- cbind(subject_test, y_activity_test, X_test)
  
  #Merges the two datasets (test and train)
  merged_data <- rbind(train_merged, test_merged)
  
  #Loads and adds headers to columns for the merged data
  filepath <- paste("./", path, "/features.txt", sep="")
  features <- read.table(filepath)
  colnames(merged_data) <- c("Subject", "Activity_ID", "Activity", as.character(features[,2]))

  return(merged_data)
}

#Extracts just the mean and standard deviation of each measurement
mean_and_std <- function(data) {
  #Find the column numbers of the means and standard deviations
  means <- grep("mean()", colnames(data), fixed=TRUE)
  stds <- grep("std()", colnames(data), fixed=TRUE)
  
  #Sort and create a vector of all desired column numbers
  goodcolumns <- sort(c(1, 3, means, stds))
  
  #Return the data frame for the given columns
  return(data[,goodcolumns])
  
}

#Creates a tidy data set of the average of each variable by subject and activity
subject_activity_mean <- function(data) {
  #Using the melt function from reshape2, making function require that package
  require(reshape2)
  
  #Using melt to melt the data by the ID's (Subject and Activity)
  melted_data <- melt(data, id.vars=c("Subject", "Activity"))
  
  #Taking the mean of each variable
  tidy <- dcast(melted_data, Subject + Activity ~ variable, mean)
  
  return(tidy)
}

#Run the functions from above with the directory UCI HAR Dataset
data <- mergeDataset("UCI HAR Dataset")
cutData <- mean_and_std(data)
tidy <- subject_activity_mean(cutData)

#Write the tidy dataset to file
write.table(tidy, file="./tidyset.txt", row.names=FALSE)