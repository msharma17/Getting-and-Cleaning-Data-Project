##Getting and Cleaning Data Course Project

###Project Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
A full description of the data used in this project can be found at The UCI Machine Learning Repository.
You will be required to submit:

   1. a tidy data set as described below
   2. a link to a Github repository with your script for performing the analysis, and
   3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. 
   You should also include a README.md in the repo with your scripts. This file explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
 The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
 A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

####Raw Data:-
Raw data are obtained from UCI Machine Learning repository. 
The data set was built from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing 
a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration 
and 3-axial angular velocity were captured at a constant rate of 50Hz. 
The experiments have been video-recorded to label the data manually [4].

The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating 
the training data and 30% the test data.

#### Data Recorded:-
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#### Dataset Files:-
The data set includes the following files.
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent.
Training files are: 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
   Every row shows a 128 element vector. 
   The same description applies for the 'total_acc_y_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
   /body_acc_y_train.txt' ; 
   / body_acc_z_train.txt'
 - 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. 
   The units are radians/second. 
   / body_gyro_y_train.txt' 
   / body_gyro_z_train.txt'; 
   
 Test files with the same description are:-
- 'test/subject_test.txt'
- 'test/Inertial Signals/total_acc_x_test.txt'; /'total_acc_y_test.txt';  /'total_acc_z_test.txt'
- 'test/Inertial Signals/body_acc_x_test.txt'; /body_acc_y_test.txt'; /body_acc_z_test.txt'
- 'test/Inertial Signals/body_gyro_x_test.txt' ; body_gyro_y_test.txt' ; body_gyro_z_test.txt'

####Notes:- 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

The R script called run_analysis.R does the following.

   1. Merges the training and the test sets to create one data set.
   2. Extracts only the measurements on the mean and standard deviation for each measurement.
   3. Uses descriptive activity names to name the activities in the data set.
   4. Appropriately labels the data set with descriptive activity names.
   5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

