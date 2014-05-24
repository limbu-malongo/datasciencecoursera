++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

COURSERA DATA SCIENCE SPEACIALIZATION: GETTING AND CLEANING DATA PROJECT MAY 2014

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

This code book describe the data set tidy_samsungData which was produced as a project work for the Coursera course, Getting and Cleaning Data.


The purpose of this project was to demonstrate the ability to collect, work with, and clean data. The goal being to prepare tidy data that can be used for later analysis.

The full description of the origional data used for this project can be found:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and the origianl project data url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The following operations were performed on the origional data to create a tidy data set

	1. Merging the training and the test sets to create one data set
	2. Extracting only the measurements on the mean and standard deviation for each measurement. 
	3. To Use descriptive activity names to name the activities in the data set
	4. To appropriately labels the data set with descriptive activity names. 
	5. To create a second, independent tidy data set with the average of each variable for each activity and each subject. 

1. Merging the training and the test sets to create one data set called samsungData
-------------------------------------------------------------------------------------------------------------------
Operations performed:

Merging the different parts of the test data, i.e measuremets, activity perfomed and the subject who performed the activity. A data set (testData) with 2947 rows and 563 columns was produced.

Merging the different parts of the train data, i.e measuremets, activity perfomed and the subject who performed the activity. A data set (trainData) with 7352 rows and 563 columns was produced.

Merging the test and train data to create a single complete data set samsungData with  10299 rows and 563 columns.

Creating a vector of variable names for measurements from features data. This contained 561 names for measurements taken, so to have a completed list of 563 variable names we added the subject and activity column names.

The varible subject was made to be of factor type. The note was also taken to make sure the variable activity is going to be chaged to factor also.

The output of this step was a data set called samsungData with 10299 rows and 563 columns with column names.


2. Extracting only the measurements on the mean and standard deviation for each measurement to create a data set called samsungDatastdm
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Operations performed:

Creating a subset of variable names by taking the variable names for mean and standard deviation (std) of measurements

Creating a subset samsungDatastdm from samsungData which contain data on mean and standard deviation (std) of measurements

A list of measurements judged to be dealing with mean and standard deviation (std):

mean: Mean value
std: Standard deviation
meanFreq: Weighted average of the frequency components to obtain a mean frequency
gravitymean
tbodyaccmean
tbodyaccjerkmean
tbodygyromean
tbodygyrojerkmean

The data set produced in this step was samsungDatastdm with 10299 rows and 81 columns


3. To Use descriptive activity names to name the activities in the data set
----------------------------------------------------------------------------------------------------
Operations perfomed:

The activities in the data set were named with descriptive names as it follows:

	1 ===> WALKING
	2 ===> WALKING_UPSTAIRS
	3 ===> WALKING_DOWNSTAIRS
	4 ===> SITTING
	5 ===> STANDING
	6 ===> LAYING

The 10299 activities were distributed as it follows:

	WALKING				1722
	WALKING_UPSTAIRS	1544
	WALKING_DOWNSTAIRS	1406
	SITTING				1777
	STANDING		 	1906
	LAYING				1944


4. To appropriately labels the data set with descriptive activity names.
-----------------------------------------------------------------------------------------------
Operations performed:

	Removing brackets and dashes in variable names

	Removing dots in variable names
	
	Changing the variable names to all lower cases

The output of this process was the samsungDatastdm with valid coulmn names


5. To creates a second, independent tidy data set with the average of each variable for each activity and each subject.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------

The tidy data set was created by using average summarization of the 10299 observations of the samsangData by grouping them using activity and subject. The data set obtained from this process is tidy_samsungData with 180 observatiions and 81 variables.


Variables in the tidy_samsunData

The tidy_samsungData contain the mean of the following estimations:

mean: Mean value
std: Standard deviation
meanFreq: Weighted average of the frequency components to obtain a mean frequency
gravitymean
tbodyaccmean
tbodyaccjerkmean
tbodygyromean
tbodygyrojerkmean


Here is the complete list of 81 variables contained in the tidy_samsungData:

	subject
	activity
	tbodyaccmeanx
	tbodyaccmeany
	tbodyaccmeanz
	tbodyaccstdx
	tbodyaccstdy
	tbodyaccstdz
	tgravityaccmeanx
	tgravityaccmeany
	tgravityaccmeanz
	tgravityaccstdx
	tgravityaccstdy
	tgravityaccstdz
	tbodyaccjerkmeanx
	tbodyaccjerkmeany
	tbodyaccjerkmeanz
	tbodyaccjerkstdx
	tbodyaccjerkstdy
	tbodyaccjerkstdz
	tbodygyromeanx
	tbodygyromeany
	tbodygyromeanz
	tbodygyrostdx
	tbodygyrostdy
	tbodygyrostdz
	tbodygyrojerkmeanx
	tbodygyrojerkmeany
	tbodygyrojerkmeanz
	tbodygyrojerkstdx
	tbodygyrojerkstdy
	tbodygyrojerkstdz
	tbodyaccmagmean
	tbodyaccmagstd
	tgravityaccmagmean
	tgravityaccmagstd
	tbodyaccjerkmagmean
	tbodyaccjerkmagstd
	tbodygyromagmean
	tbodygyromagstd
	tbodygyrojerkmagmean
	tbodygyrojerkmagstd
	fbodyaccmeanx
	fbodyaccmeany
	fbodyaccmeanz
	fbodyaccstdx
	fbodyaccstdy
	fbodyaccstdz
	fbodyaccmeanfreqx
	fbodyaccmeanfreqy
	fbodyaccmeanfreqz
	fbodyaccjerkmeanx
	fbodyaccjerkmeany
	fbodyaccjerkmeanz
	fbodyaccjerkstdx
	fbodyaccjerkstdy
	fbodyaccjerkstdz
	fbodyaccjerkmeanfreqx
	fbodyaccjerkmeanfreqy
	fbodyaccjerkmeanfreqz
	fbodygyromeanx
	fbodygyromeany
	fbodygyromeanz
	fbodygyrostdx
	fbodygyrostdy
	fbodygyrostdz
	fbodygyromeanfreqx
	fbodygyromeanfreqy
	fbodygyromeanfreqz
	fbodyaccmagmean
	fbodyaccmagstd
	fbodyaccmagmeanfreq
	fbodybodyaccjerkmagmean
	fbodybodyaccjerkmagstd
	fbodybodyaccjerkmagmeanfreq
	fbodybodygyromagmean
	fbodybodygyromagstd
	fbodybodygyromagmeanfreq
	fbodybodygyrojerkmagmean
	fbodybodygyrojerkmagstd
	fbodybodygyrojerkmagmeanfreq