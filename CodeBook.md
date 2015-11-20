###CodeBook Description
It contains additional information about the variables, data and transformations used in the course project.

####Data Processing:-
The raw data sets are processed with run_analisys.R script which does the following.

1). Merges the training and the test sets to create one data set.
After setting the source directory for the files, read into tables the data located in
   - features.txt
   - activity_labels.txt
   - subject_train.txt
   - X_train.txt
   - y_train.txt
   - subject_test.txt
   - X_test.txt
   - y_test.txt
Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and 
activity ids (y_train.txt, y_test.txt) are merged to obtain a single data set called (final_data).
Variables are labelled with the names assigned by original collectors (features.txt).

2). Extracts only the measurements on the mean and standard deviation for each measurement

From the merged dataset values for mean(variables with labels that contain "mean") and 
standard deviation(variables with labels that contain "std" for each measurement are extracted 
and stored into varaiable (final_data_mean_std)
 
3). Uses descriptive activity names to name the activities in the data set

A new column is added to intermediate data set with the activity description.The data set created is (final_data_mean_std).
 Activity id column is used to look up descriptions in activity_labels.txt.
There are 6 Activity labels.WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

4). Appropriately labels the data set with descriptive variable names.

Labels given from the original collectors are changed to obtain valid and more descriptive(clearer)
labels names without parentheses, dashes and commas. 
Use gsub function for pattern replacement to clean up the data labels.

5.) Create a tidy data set 

Finally an independent tidy data set with the average of each variable for each activity and each subject is created.
The data set is written to the file "tidydataset.txt".
     
#####License:
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones 
using a Multiclass Hardware-Friendly Support Vector Machine. 
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions 
for its use or misuse. Any commercial use is prohibited.
Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
