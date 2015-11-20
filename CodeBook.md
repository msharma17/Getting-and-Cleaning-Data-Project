###CodeBook Description
It contains additional information about the variables, data and transformations used in the course project.
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

####Notes:- 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

####Data Processing:-
The raw data sets are processed with run_analisys.R script which does the following.

1. Merges the training and the test sets to create one data set.

Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and activity ids (y_train.txt, y_test.txt) 
are merged to obtain a single data set.Variables are labelled with the names assigned by original collectors (features.txt).

2. Extracts only the measurements on the mean and standard deviation for each measurement

From the merged dataset values for mean(variables with labels that contain "mean") and 
standard deviation(variables with labels that contain "std" for each measurement are extracted.
 
3. Uses descriptive activity names to name the activities in the data set

A new column is added to intermediate data set with the activity description. Activity id column is used to look up descriptions in activity_labels.txt.
There are 6 Activity labels.WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

4. Appropriately labels the data set with descriptive variable names.

Labels given from the original collectors were changed: to obtain valid R names without parentheses, dashes and commas to obtain more descriptive labels.
Use gsub function for pattern replacement to clean up the data labels.

5. Create a tidy data set 

Finally a tidy data set with the average of each variable for each activity and each subject is created.
     
####License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones 
using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions 
for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
