Study design
======================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The data was obtained from 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones      
and in particular the dataset from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  
was used.

Data Transformation for tidyData.txt creation
=======================================
The training and the test sets have been merged to create one data set.
The measurements on the mean and standard deviation for each measurement have been extracted and labeled. 
Based on these mean and standard deviation based measurements, the average of each variable have been computed for each activity and each subject.

1. # bind columns of training data variables together from:
		- train/X_train.txt
		- train/Y_train.txt
		- train/subject_train.txt
2. # bind columns of test data variables together
		- test/X_test.txt
		- test/Y_test.txt
		- test/subject_test.txt
3. # add rows of test data set to training data set
4. # extract only the measurements on the mean and std
5. #assign the correct variable names to data_all from:
		- features.txt
6. # add a column for the decoded activity names from:
		- activity_labels.txt
7. #melt data frame based on IDs subject & activity
8. #apply the mean function based on the a subject + activity grouping
9. export to tidyData.txt


Code Book
=======================================

=== identifying variables ===

"subject": the subject ID number
"activity": describes the activity in which the measurement took place 
"Y": contains the encoded activity description 1 = WALKING, 2 = WALKING_UPSTAIRS, 3 = WALKING_DOWNSTAIRS, 4 = SITTING, 5 = STANDING, 6= LAYING

=== measurement variables ===

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

Features are normalized and bounded within [-1,1].
"Mean" subsumes the mean value of the signals and "std" subsumes the standard diviation of the signals.
Each variable is averaged over the respective identification variables.

List of variables:
------------------------------
"tBodyAcc-mean()-X"
"tBodyAcc-mean()-Y"
"tBodyAcc-mean()-Z"
"tBodyAcc-std()-X"
"tBodyAcc-std()-Y"
"tBodyAcc-std()-Z"
------------------------------
"tGravityAcc-mean()-X"
"tGravityAcc-mean()-Y"
"tGravityAcc-mean()-Z"
"tGravityAcc-std()-X"
"tGravityAcc-std()-Y"
"tGravityAcc-std()-Z"
------------------------------
"tBodyAccJerk-mean()-X"
"tBodyAccJerk-mean()-Y"
"tBodyAccJerk-mean()-Z"
"tBodyAccJerk-std()-X"
"tBodyAccJerk-std()-Y"
"tBodyAccJerk-std()-Z"
------------------------------
"tBodyGyro-mean()-X"
"tBodyGyro-mean()-Y"
"tBodyGyro-mean()-Z"
"tBodyGyro-std()-X"
"tBodyGyro-std()-Y"
"tBodyGyro-std()-Z"
------------------------------
"tBodyGyroJerk-mean()-X"
"tBodyGyroJerk-mean()-Y"
"tBodyGyroJerk-mean()-Z"
"tBodyGyroJerk-std()-X"
"tBodyGyroJerk-std()-Y"
"tBodyGyroJerk-std()-Z"
------------------------------
"tBodyAccMag-mean()"
"tBodyAccMag-std()"
------------------------------
"tGravityAccMag-mean()"
"tGravityAccMag-std()"
------------------------------
"tBodyAccJerkMag-mean()"
"tBodyAccJerkMag-std()"
----------
"tBodyGyroMag-mean()"
"tBodyGyroMag-std()"
------------------------------
"tBodyGyroJerkMag-mean()"
"tBodyGyroJerkMag-std()"
------------------------------
"fBodyAcc-mean()-X"
"fBodyAcc-mean()-Y"
"fBodyAcc-mean()-Z"
"fBodyAcc-std()-X"
"fBodyAcc-std()-Y"
"fBodyAcc-std()-Z"
------------------------------
"fBodyAccJerk-mean()-X"
"fBodyAccJerk-mean()-Y"
"fBodyAccJerk-mean()-Z"
"fBodyAccJerk-std()-X"
"fBodyAccJerk-std()-Y"
"fBodyAccJerk-std()-Z"
------------------------------
"fBodyGyro-mean()-X"
"fBodyGyro-mean()-Y"
"fBodyGyro-mean()-Z"
"fBodyGyro-std()-X"
"fBodyGyro-std()-Y"
"fBodyGyro-std()-Z"
------------------------------
"fBodyAccMag-mean()"
"fBodyAccMag-std()"
------------------------------
"fBodyBodyAccJerkMag-mean()"
"fBodyBodyAccJerkMag-std()"
------------------------------
"fBodyBodyGyroMag-mean()"
"fBodyBodyGyroMag-std()"
------------------------------
"fBodyBodyGyroJerkMag-mean()"
"fBodyBodyGyroJerkMag-std()"