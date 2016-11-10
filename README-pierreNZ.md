==================================================================
This is the README file for the Module 3 "Getting and Cleaning Data" Week 4 course assignment
==================================================================

Background
==================================================================
For this assigment the students were provided access to a raw data set. The set represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 
The experiments to collect the data have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 
======================================================================
The task
======================================================================
The Module 3 student assigment consisted of the following tasks based on the above raw data set:
-Create one R script called run_analysis.R that does the following.
-Merges the training and the test sets to create one data set.
-Extracts only the measurements on the mean and standard deviation for each measurement.
-Uses descriptive activity names to name the activities in the data set
-Appropriately labels the data set with descriptive variable names.
-From the extracted data set, create a second, independent tidy data set with the average of each variable for each activity and each subject. 
======================================================================
The shape of the raw data
======================================================================
The raw data was provided in two sets of txt files, one for the training group of volunteers and one for the test group. Each data set consisted of the identifier number for each subject in the group (person), a label for the six activities (1 through 6), and the measurements for 561 features/variables measured. These measurements were normalized and bounded within [-1,1], so no units are involved.
======================================================================
The R script for performing this task follows the following logic
======================================================================
-download and unzip the data from the website provided and save the files in the local working directory (this was done without the R script)
-load the dplyr library necessary for manipulating data tables
-read the three text files for each of the training and testing data sets into data frames
-read a text file with the names of all 561 features/variables. The abbreviations used in these names are explained in the CodeBook associated with this assignment
-add these names to each of the train and test data sets so that each column has a unique variable name in the first row of the data frame
-add two columns to each of train and test data frames - one column with subject/person identifier number and one column with activity code
-combine the train and test data frames by row binding the one set below the other to form one large data frame
-convert this data frame into a data table and name the subject column "Subject" and activity column "Activity"
-select from this data table only the Subject and Activity variables, and all other variables that were calculated as the mean and standard deviation of some measurement
-in the Activity column replace the activity code (1 through 6) with activity descriptions (see Background above)
-remove unnecessary "()" from each variable name that causes clutter. The abbreviations for thes names are explained in the CodeBook
-use the table in the last step to create a second tidy data set by calculating the average for each variable aggregated by subject and activity
-ensure the data table is tidy by removing duplicated columns, that the data is sorted by subject and activity, and each row contains one unique entry
-write the second table as text file to the working directory
======================================================================
The files in the repo associated with this assignment
======================================================================
README-pierreNZ.md
CodeBook.md (explaining the naming convention and units of the variables)
run_analysis.R (the script that performs the task)
======================================================================
Instructions to retrieve the tidy data table
======================================================================  
address <- "https://s3.amazonaws.com/coursera-uploads/peer-review/HkJsxW0yEeWEewoyD2Bc5Q/23543ee0b24b240bf2f924e2c32a906d/My_submission"
address <- sub("^https", "http", address)
data <- read.table(url(address), header = TRUE)
======================================================================
License:
======================================================================
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
