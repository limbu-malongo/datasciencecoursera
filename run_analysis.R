# Coursera Data Science Specialization:Getting and Cleaning Data Project
# May, 2014
#
#Download the Poroject data from the follwing url
#https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
#Unzip the data in the working directory
# 
#This script was created to answer the following questions
#
#You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
#
#
# 1. Merging the training and the test sets to create one data set.
#
# 1.1 Merging different parts of test data
#
#Check to See the necessary folder containing the data exist in the working directory

if (!file.exists("UCI HAR Dataset")) {
  if (!file.exists("getdata-projectfiles-UCI HAR Dataset.zip")) {
    stop("Please make sure the folder UCI HAR Dataset or zip file is in the working directory")
  } else {
    unzip("getdata-projectfiles-UCI HAR Dataset.zip")
  }
}

#Read the test measurements data into R
testData00 = read.table("./UCI HAR Dataset/test/X_test.txt")
head(testData00)
dim(testData00)

#Read the acitivity performed
test_activityId = read.table("./UCI HAR Dataset/test/y_test.txt")
head(test_activityId)
dim(test_activityId)

#Read the subject identification data
test_subjectsId= read.table("./UCI HAR Dataset/test/subject_test.txt")
head(test_subjectsId)
dim(test_subjectsId)

#Combining testData00, subjectId and testactivityId to create a complete set of 
#testData
testData = cbind(testData00,test_subjectsId,test_activityId)

head(testData)
dim(testData)

# 1.2 Merging different parts of train data
#
#Read the train measurements into data into R
trainData00 = read.table("./UCI HAR Dataset/train/X_train.txt")
head(trainData00)
dim(trainData00)

train_activityId = read.table("./UCI HAR Dataset/train/y_train.txt")
head(train_activityId)
dim(train_activityId)

train_subjectsId= read.table("./UCI HAR Dataset/train/subject_train.txt")
head(train_subjectsId)
dim(train_subjectsId)

#Combining trainData00, train_subjectId and train_activityId to create a complete set of 
#trainData
trainData = cbind(trainData00,train_subjectsId,train_activityId)

head(trainData)
dim(trainData)

#1.3 Combining testData and trainData to create a single complete samsungData data set
samsungData = rbind(testData,trainData)

#Checking to see if all the subjects and Activities are present
table(samsungData[,562])
table(samsungData[,563])

#1.4 Read the features data set into memory. This data set contain variable names which we need to add to the
#complete data set, samsungData
features = read.table("./UCI HAR Dataset/features.txt")
dim(features)
head(features, 3)

#The column V2 of features00 (i.e features00$V2) contain the 561 variable names which we need. We going to extract
#this column combine it with "subject" and "activity" so as to get the 563 variable names for complete data set
#
variablenames = c(as.vector(features$V2), c("subject", "activity"))
head(variablenames)
tail(variablenames)
length(variablenames)

names(samsungData)=variablenames
head(samsungData)
str(samsungData$subject)

#Finally changing the subject variable to factor instead of being of type int
samsungData$subject = as.factor(samsungData$subject)
str(samsungData$subject)

#2. Extracting only the measurements on the mean and standard deviation for each measurement.
#
head(names(samsungData),10)
tail(names(samsungData),10)

#Let's create a subset of variable names containing mean and std (standard deviation)
#
sub_variable_names = names(samsungData)[grep("mean|std", names(samsungData), per=TRUE)]
head(sub_variable_names)
length(sub_variable_names)

#Creating a data set samsungDatastdm from samsungData data set, samsungDatastdm is a subset which contain measurements on mean and standard deviation only
#
samsungDatastdm=samsungData[,c(sub_variable_names,"subject", "activity")]
head(samsungDatastdm,3)
dim(samsungDatastdm)


# 3. To Use descriptive activity names to name the activities in the data set
#
samsungDatastdm$activity=as.character(samsungDatastdm$activity)
samsungDatastdm$activity[samsungDatastdm$activity == "1"] = "WALKING"
samsungDatastdm$activity[samsungDatastdm$activity == "2"] = "WALKING_UPSTAIRS"
samsungDatastdm$activity[samsungDatastdm$activity == "3"] = "WALKING_DOWNSTAIRS"
samsungDatastdm$activity[samsungDatastdm$activity == "4"] = "SITTING"
samsungDatastdm$activity[samsungDatastdm$activity == "5"] = "STANDING"
samsungDatastdm$activity[samsungDatastdm$activity == "6"] = "LAYING"
samsungDatastdm$activity=as.factor(samsungDatastdm$activity)

table(samsungDatastdm$activity)

#Confirm all the 10299 are present
sum(table(samsungDatastdm$activity))

#4. To Appropriately label the data set with descriptive activity names
#
#Removing the - and () from variable names using make.names
#
names(samsungDatastdm)=make.names(names(samsungDatastdm),unique=T)
names(samsungDatastdm)

#Removing the dot (.) from variable names
names(samsungDatastdm) = gsub("\\.", "", names(samsungDatastdm),)

#Changing the variable names to all lower cases
names(samsungDatastdm) = tolower(names(samsungDatastdm))

#Clearing the intermediate steps data from the memory
rm("test_activityId","test_subjectsId", "train_activityId", "train_subjectsId", "testData00", 
   "trainData00", "testData", "trainData", "features", "variablenames", "sub_variable_names")

#5. To Create a second, independent tidy data set with the average of each variable for each activity and each subject.
#
#We are going to use the function ddply() function wich is in the package plyr
#
#The codes below will check if the package is installed and load, and if it is not installed it is going 
#download plyr, install and load it
#
if(require("plyr")){
  print("plyr is loaded correctly")
} else {
  print("trying to install plyr")
  install.packages("plyr")
  if(require(plyr)){
    print("plyr installed and loaded")
  } else {
    stop("could not install plyr")
  }
}

#colwise is a function that operates on a vector into a function that operates column-wise on a data.frame
tidy_samsungData = ddply(samsungDatastdm, .(subject, activity), colwise(mean))

#The following codes will create files in the working directory

#Creating a text file which contain the variable names to be used on CodeBook.
write.table(names(tidy_samsungData), file = "tidy_features.txt", row.names = FALSE, col.names = FALSE)


#Creating a text file of tidy data set to uploaded for grading
write.table(tidy_samsungData, file = "tidy_samsugnData.txt", row.names = FALSE)

#Miscellaneous
#Creating a text file of the complete data set prior to subsetting
write.table(samsungData, file = "samsugnData.txt", row.names = FALSE)

#Creating a text file of the samsungDatastdm set 
write.table(samsungDatastdm, file = "samsugnDatastdm.txt", row.names = FALSE)