This is the Code Book for the Module 3 Week 4 assignment 
==========================================================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 

Data were normalized and are bound within the range -1 to 1 and are unitless

==========================================================================
The meaning of the abbreviations used in the naming of the variables
==========================================================================
Subject = a number 1 through 30 for each of the volunteers participating in the experiment
Activity = one of six activity categories - walking, walking upstairs, walking downstairs, sitting, standing, laying
t = time
Body = body acceleration
Gravity = gravity acceleration
Acc = accelerometer data
Gyro = gyroscope data
Jerk = a combination of linear acceleration and angular velocity
Mag = magnitude of three-dimensional signals
f = transformed signal using Fast Fourier Transform (FFT)
XYZ = 3-axial signals in the X, Y and Z directions
mean = mean value
std = standard deviation
meanFreq = Weighted average of the frequency components to obtain a mean frequency
Mean = additional vectors obtained by averaging the signals in a signal window sample





