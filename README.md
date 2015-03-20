# Getting and Cleaning Data Course Project

The script "run_analysis.R" cleans the UCI HAR Dataset. This dataset is collected from Samsung Galaxy S phones and represents accelerometer measurements for various subjects during numerous activities. This code was produced as part of the course project from Coursera's "Getting and Cleaning Data" course.

The goal of this script is to create a tidy dataset from the merged "train" and "test" datasets with the following qualities:
* Contains only the mean and standard deviation (std) of each measurement
* Contains the average mean and standard deviation grouped by subject and activity
* Uses proper variable names as described in the codebook

The script accomplishes this goal through the use of three functions:
* mergeDataset, which merges the two datasets into a single dataset with proper column headings. 
* mean_and_std, which extracts only the means and standard deviations for each measurement.
* subject_activity_mean, which creates a tidy dataset of the averages of the cut dataset by subject number and activity

After using these functions to create a tidy dataset, the script writes this dataset to a file named "tidydata.txt" in the working directory.

For more information on how the functions accomplish their intended purposes, please see the comments in the code run_analysis.R
