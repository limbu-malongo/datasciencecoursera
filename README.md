==================================================================================

DATA SCIENCE SPEACIALIZATION: GETTING AND CLEANING DATA PROJECT MAY 2014

Prepared by Me

Reach me through: limbu.malongo at gmail dot com

==================================================================================

Files for the project:

	README.md

	CodeBook.md

	run_analysis.R


CodeBook.md
-----------------------

The file CodeBook.md contain information about the operations perfomed to create the tidy data set as the requirement of the project, the variables in the data, and data produced.


The Script run_analysis.R
-----------------------------------------------

Software, Packages and Environment

	The script was prepared using the R Software Version 3.1.0 (2014-04-10);
	
	The script was tested successful on R Software Version 3.1.0 on Windows 7 Professional Service Pack 1 and Windows 8 and Windows 8.1;
	
	The package plyr which is not included in tha base packages is required by the script, if the machine is connected to the Internet the script will take care of it.

Assumptions:

	The machine which is used to run the script has been installed with R software;

	The person running the script run_analysis.R knows the basics of running R scripts;

	The person who want to use this script knows how to download data when given the url;

	The person using this script knows how to traverse from one folder to another.

	The machine running the script will be connected  to the Internet. If you want to run this script off line make sure you install tha package plyr, by running the command install.packages("plyr")  befor running the script.

Procedure:

	1. If you have not downloaded the project data, download from the following url:
	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

	2. To use this script you can decide to extract the data project or use it as it is in the zip file. The most 	important note is that do not change 
	the name of the original zip file or the extracted data folder.

	3. Make sure either the folder "UCI HAR Dataset" or the file "getdata-projectfiles-UCI HAR Dataset.zip"  or 	both are  present in the working directory of R.

	4. To know location of the working directory of R issue the command:

   	 getwd()

Outputs of the script:

	In the R environment

		The script will create three dat sets:

		The complete data set (samsungData) obtained by combining test and train data,  it has  10299 observations and 563 variables;
		The samsungDatastdm which is a subset containing measurements on mean and standard deviations only it has 10299 observations and 81 variables;
		The tidy_samsungData which contain the mean of measurements on mean and standard deviations per subject per activity, it has 180 observations and 81 variables.

	In the working directory

		The script will create three files:

		tidy_features.txt, file containing the variable names of tidy_samsungData, 81 names;
		samsungData.txt, the complete dataset obtained by combining test and train data. This dataset has 10299 observations and 563 variables;
		samsungDatastdm.txt, it has 10299 observations and 81 variables;
		tidy_samsungData.txt, tidy data set file, it has 180 observations and 81 variables.