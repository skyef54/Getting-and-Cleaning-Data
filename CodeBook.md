#Getting and Cleaning Data Course Project.

This work is intended for collecting, working with, and cleaning a data set. The goal is to prepare tidy data that can be used for later analysis. Human Activity Recognition Using Smartphones Dataset have been used as a original data. The source data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##The data set description.

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
 
The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

##Features info

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
- tBodyAcc- XYZ
- tGravityAcc- XYZ
- tBodyAccJerk- XYZ
- tBodyGyro- XYZ
- tBodyGyroJerk- XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc- XYZ
- fBodyAccJerk- XYZ
- fBodyGyro- XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 
- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'

##The assignment is:
- Merge the training and the test sets to create one data set.
- Extract only the measurements on the mean and standard deviation for each measurement. 
- Use descriptive activity names to name the activities in the data set
- Appropriately label the data set with descriptive variable names. 
- From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

##'Run_analysis.R' script
The script makes the following job:
- Joins train and test data in a single data set using 'train/X_train.txt', 'train/y_train.txt', 'test/X_test.txt' and 'test/y_test.txt' files. Subject ids also includes from the 'train/subject_train.txt' and 'test/subject_test.txt' files.
- Extracts only the measurements on the mean and standard deviation from the data set. Discards other measurements. The measurements conform 'features.txt' file.
- Assings appropriate label to each variable according to 'features.txt' file.
- Fills the activity variable with descriptive names according to 'activity_labels.txt' file
- Creates a second data set with the average of each variable for each activity and each subject. 
- Saves the second data set to 'average_by_subj_and_activity.txt' file.

See 'readme.md' file to get information how to use the script.

=============================================================
##Data Dictionary - Average by subject and activity data set

###Description of the variables

| No | Name | Description | Type  | 
|----|---------------|-------|-------------|
|1  | subject_id  | Identifies the subject who performed the activity | Integer, 1 ... 30|
|2 | activity  | The name of activity performed by person wearing a smartphone (Samsung Galaxy S II) on the waist | One of list: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING|
|3 | tBodyAcc_mean_X | Average value of mean body acceleration signal, X direction, time domain  | Numeric |
|4  | tBodyAcc_mean_Y | Average value of mean body acceleration signal, Y direction, time domain| Numeric|
|5  | tBodyAcc_mean_Z | Average value of mean body acceleration signal, Z direction, time domain| Numeric|
|6| tBodyAcc_std_X | Average value of standard deviation body acceleration signal, X direction, time domain| Numeric|
| 7| tBodyAcc_std_Y |  Average value of standard deviation body acceleration signal, Y direction, time domain| Numeric|
|8 | tBodyAcc_std_Z |  Average value of standard deviation body acceleration signal, Z direction, time domain|    Numeric|
|9 |tGravityAcc_mean_X |    Average value of mean gravity acceleration signal, X direction, time domain|    Numeric|
|10 | tGravityAcc_mean_Y |    Average value of mean gravity acceleration signal, Y direction, time domain|    Numeric|
| 11|tGravityAcc_mean_Z |    Average value of mean gravity acceleration signal, Z direction, time domain|    Numeric|
|12 |tGravityAcc_std_X |    Average value of standard deviation gravity acceleration signal, X direction, time domain|    Numeric|
|13 |tGravityAcc_std_Y |    Average value of standard deviation gravity acceleration signal, Y direction, time domain|    Numeric|
|14 |tGravityAcc_std_Z |    Average value of standard deviation gravity acceleration signal, Z direction, time domain|    Numeric|
|15 |tBodyAccJerk_mean_X |    Average value of mean body acceleration Jerk signal, X direction, time domain|    Numeric|
|16 |tBodyAccJerk_mean_Y |    Average value of mean body acceleration Jerk signal, Y direction, time domain|    Numeric|
|17 |tBodyAccJerk_mean_Z |    Average value of mean body acceleration Jerk signal, Z direction, time domain|    Numeric|
|18 | tBodyAccJerk_std_X |    Average value of standard deviation body acceleration Jerk signal, X direction, time domain|    Numeric|
|19| tBodyAccJerk_std_Y |    Average value of standard deviation body acceleration Jerk signal, Y direction, time domain|    Numeric|
|20 |tBodyAccJerk_std_Z |    Average value of standard deviation body acceleration Jerk signal, Z direction, time domain|    Numeric|
|21 |tBodyGyro_mean_X |    Average value of mean body gyroscope signal, X direction, time domain|    Numeric|
|22 |tBodyGyro_mean_Y |    Average value of mean body gyroscope signal, Y direction, time domain|    Numeric|
|23| tBodyGyro_mean_Z |    Average value of mean body gyroscope signal, Z direction, time domain|    Numeric|
|24 |tBodyGyro_std_X |    Average value of standard deviation body gyroscope signal, X direction, time domain|    Numeric|
|25 |tBodyGyro_std_Y |    Average value of standard deviation body gyroscope signal, Y direction, time domain|    Numeric|
|26 |tBodyGyro_std_Z |    Average value of standard deviation body gyroscope signal, Z direction, time domain|    Numeric|
|27 |tBodyGyroJerk_mean_X |    Average value of mean body gyroscope Jerk signal, X direction, time domain|    Numeric|
|28 |tBodyGyroJerk_mean_Y |    Average value of mean body gyroscope Jerk signal, Y direction, time domain|    Numeric|
|29 |tBodyGyroJerk_mean_Z |    Average value of mean body gyroscope Jerk signal, Z direction, time domain|    Numeric|
|30 |tBodyGyroJerk_std_X |    Average value of standard deviation body gyroscope Jerk signal, X direction, time domain|    Numeric|
|31 |tBodyGyroJerk_std_Y |    Average value of standard deviation body gyroscope Jerk signal, Y direction, time domain|    Numeric|
|32 |tBodyGyroJerk_std_Z |    Average value of standard deviation body gyroscope Jerk signal, Z direction, time domain|    Numeric|
|33 |tBodyAccMag_mean |    Average value of mean of magnitude body acceleration signal, time domain|    Numeric|
|34 |tBodyAccMag_std |    Average value of standard deviation of magnitude body acceleration signal, time domain|    Numeric|
|35 |tGravityAccMag_mean |    Average value of mean of magnitude gravity acceleration signal, time domain|    Numeric|
|36 |tGravityAccMag_std |    Average value of standard deviation of magnitude gravity acceleration signal, time domain|    Numeric|
|37 |tBodyAccJerkMag_mean |    Average value of mean of magnitude body acceleration Jerk signal, time domain|    Numeric|
|38 |tBodyAccJerkMag_std |    Average value of standard deviation of magnitude body acceleration Jerk signal, time domain|    Numeric|
|39 |tBodyGyroMag_mean |    Average value of mean of magnitude body gyroscope signal, time domain|    Numeric|
|40 |tBodyGyroMag_std |    Average value of standard deviation of magnitude body gyroscope signal, time domain|    Numeric|
|41 |tBodyGyroJerkMag_mean |    Average value of mean of magnitude body gyroscope Jerk signal, time domain|    Numeric|
|42 |tBodyGyroJerkMag_std |    Average value of standard deviation of magnitude body gyroscope Jerk signal, time domain|    Numeric|
|43 |fBodyAcc_mean_X |    Average value of mean body acceleration signal, X direction, frequency domain|    Numeric|
|44 |fBodyAcc_mean_Y |    Average value of mean body acceleration signal, Y direction, frequency domain|    Numeric|
|45 |fBodyAcc_mean_Z |    Average value of mean body acceleration signal, Z direction, frequency domain|    Numeric|
|46 |fBodyAcc_std_X |    Average value of standard deviation body acceleration signal, X direction, frequency domain|    Numeric|
|47 |fBodyAcc_std_Y |    Average value of standard deviation body acceleration signal, Y direction, frequency domain|    Numeric|
|48 |fBodyAcc_std_Z |    Average value of standard deviation body acceleration signal, Z direction, frequency domain|    Numeric|
|49 |fBodyAcc_meanFreq_X |    Average value of weighted average of the frequency components body acceleration signal, X direction, frequency domain|    Numeric|
|50 |BodyAcc_meanFreq_Y |    Average value of weighted average of the frequency components body acceleration signal, Y direction, frequency domain|    Numeric|
|51 |fBodyAcc_meanFreq_Z |    Average value of weighted average of the frequency components body acceleration signal, Z direction, frequency domain|    Numeric|
|52 |fBodyAccJerk_mean_X |    Average value of mean body acceleration Jerk signal, X direction, frequency domain|    Numeric|
|53 |fBodyAccJerk_mean_Y |    Average value of mean body acceleration Jerk signal, Y direction, frequency domain|    Numeric|
|54 |fBodyAccJerk_mean_Z |    Average value of mean body acceleration Jerk signal, Z direction, frequency domain|    Numeric|
|55 |fBodyAccJerk_std_X |    Average value of standard deviation body acceleration Jerk signal, X direction, frequency domain|    Numeric|
|56 |fBodyAccJerk_std_Y |    Average value of standard deviation body acceleration Jerk signal, Y direction, frequency domain|    Numeric|
|57 |fBodyAccJerk_std_Z |    Average value of standard deviation body acceleration Jerk signal, Z direction, frequency domain|    Numeric|
|58 |fBodyAccJerk_meanFreq_X |    Average value of weighted average of the frequency components body acceleration Jerk signal, X direction, frequency domain|    Numeric|
|59 |fBodyAccJerk_meanFreq_Y |    Average value of weighted average of the frequency components body acceleration Jerk signal, Y direction, frequency domain|    Numeric|
|60 |fBodyAccJerk_meanFreq_Z |    Average value of weighted average of the frequency components body acceleration Jerk signal, Z direction, frequency domain|    Numeric|
|61 |fBodyGyro_mean_X |    Average value of mean body gyroscope signal, X direction, frequency domain|    Numeric|
|62 |fBodyGyro_mean_Y |    Average value of mean body gyroscope signal, Y direction, frequency domain|    Numeric|
|63 |fBodyGyro_mean_Z |    Average value of mean body gyroscope signal, Z direction, frequency domain|    Numeric|
|64 |fBodyGyro_std_X |    Average value of standard deviation body gyroscope signal, X direction, frequency domain|    Numeric|
|65 |fBodyGyro_std_Y |    Average value of standard deviation body gyroscope signal, Y direction, frequency domain|    Numeric|
|66 |fBodyGyro_std_Z |    Average value of standard deviation body gyroscope signal, Z direction, frequency domain|    Numeric|
|67 |fBodyGyro_meanFreq_X |    Average value of weighted average of the frequency components body gyroscope signal, X direction, frequency domain|    Numeric|
|68 |fBodyGyro_meanFreq_Y |    Average value of weighted average of the frequency components body gyroscope signal, Y direction, frequency domain|    Numeric|
|69 |fBodyGyro_meanFreq_Z |    Average value of weighted average of the frequency components body gyroscope signal, Z direction, frequency domain|    Numeric|
|70 |fBodyAccMag_mean |    Average value of mean of magnitude body acceleration signal, frequency domain|    Numeric|
|71 |fBodyAccMag_std |    Average value of standard deviation of magnitude body acceleration signal, frequency domain|    Numeric|
|72 |fBodyAccMag_meanFreq |    Average value of weighted average of the frequency components of magnitude body acceleration signal, frequency domain|    Numeric    |
|73 |fBodyBodyAccJerkMag_mean |    Average value of mean of magnitude body acceleration Jerk signal, frequency domain|    Numeric|
|74 |fBodyBodyAccJerkMag_std |    Average value of standard deviation of magnitude body acceleration Jerk signal, frequency domain|    Numeric|
|75 |fBodyBodyAccJerkMag_meanFreq |    Average value of weighted average of the frequency components of magnitude body acceleration Jerk signal, frequency domain|    Numeric|
|76 |fBodyBodyGyroMag_mean |    Average value of mean of magnitude body gyroscope signal, frequency domain|    Numeric|
|77 |fBodyBodyGyroMag_std |    Average value of standard deviation of magnitude body gyroscope signal, frequency domain|    Numeric|
|78 |fBodyBodyGyroMag_meanFreq |    Average value of weighted average of the frequency components of magnitude body gyroscope signal, frequency domain|    Numeric|
|79 |fBodyBodyGyroJerkMag_mean |    Average value of mean of magnitude body gyroscope Jerk signal, frequency domain|    Numeric|
|80 |fBodyBodyGyroJerkMag_std |    Average value of standard deviation of magnitude body gyroscope Jerk signal, frequency domain|    Numeric|
|81 |fBodyBodyGyroJerkMag_meanFreq |    Average value of weighted average of the frequency components of magnitude body gyroscope Jerk signal, frequency domain|    Numeric|
 
