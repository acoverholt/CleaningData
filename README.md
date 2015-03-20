# Getting and Cleaning Data Course Project
##Overview
This repository contains script "run_analysis.R", which cleans the UCI HAR Dataset. This dataset is collected from Samsung Galaxy S phones and represents accelerometer measurements for various subjects during numerous activities. This code was produced as part of the course project from Coursera's "Getting and Cleaning Data" course.

The goal of this script is to create a tidy dataset from the merged "train" and "test" datasets with the following properties:
* Contains only the mean and standard deviation (std) of each measurement
* Contains the average mean and standard deviation grouped by subject and activity
* Uses proper variable names as described in the codebook

The script accomplishes this goal through the use of three functions:
* mergeDataset, which merges the two datasets into a single dataset with proper column headings. 
* mean_and_std, which extracts only the means and standard deviations for each measurement.
* subject_activity_mean, which creates a tidy dataset of the averages of the cut dataset by subject number and activity

After using these functions to create a tidy dataset, the script writes this dataset to a file named "tidydata.txt" in the working directory.

For more information on how the functions accomplish their intended purposes, please see the comments in the code run_analysis.R

##Using the script
The original UCI HAR Dataset can be downloaded here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After unzipping this file to your chosen directory, download the script run_analysis.R to the same parent directory. Set your working directory in R (or RStudio) to this directory.

Upon sourcing the script, a txt file named "tidydata.txt" will be created in this working directory with the properties stated above.

##Dependencies
The script run_analysis.R requires the use of the "reshape2" package, as shown in the script.
