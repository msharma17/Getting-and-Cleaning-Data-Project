# runAnalysis.r File Description:

# This script will perform the following steps on the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

require(plyr)

# Reading the files
features <- read.table("features.txt", colClasses = c("character"))
activity_labels <- read.table("activity_labels.txt",header=FALSE,col.names = c("ActivityId", "Activity"))
x_train <- read.table("./train/X_train.txt",header = FALSE)
y_train <- read.table("./train/y_train.txt",header = FALSE)
subject_train <- read.table("./train/subject_train.txt",header = FALSE)
x_test  <- read.table("./test/X_test.txt",header = FALSE)
y_test  <- read.table("./test/y_test.txt",header = FALSE)
subject_test <- read.table("./test/subject_test.txt",header = FALSE)

##################################################################
# 1. Merges the training and the test sets to create one data set.
##################################################################

# Binding the training and test data
training_data <- cbind(cbind(x_train, subject_train), y_train)
test_data <- cbind(cbind(x_test, subject_test), y_test)
final_data <- rbind(training_data, test_data)

# Label columns
final_labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(final_data) <- final_labels

############################################################################################
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
############################################################################################

final_data_mean_std <- final_data[,grepl("mean|std|Subject|ActivityId", names(final_data))]

###########################################################################
# 3. Uses descriptive activity names to name the activities in the data set
###########################################################################

final_data_mean_std <- join(final_data_mean_std, activity_labels, by = "ActivityId", match = "first")
final_data_mean_std <- final_data_mean_std[,-1]

##############################################################
# 4. Appropriately labels the data set with descriptive names.
##############################################################

# Remove parentheses
names(final_data_mean_std) <- gsub('\\(|\\)',"",names(final_data_mean_std), perl = TRUE)
# Make valid names
names(final_data_mean_std) <- make.names(names(final_data_mean_std))
# Make more clearer names
names(final_data_mean_std) <- gsub('Acc',"Acceleration",names(final_data_mean_std))
names(final_data_mean_std) <- gsub('GyroJerk',"AngularAcceleration",names(final_data_mean_std))
names(final_data_mean_std) <- gsub('Gyro',"AngularSpeed",names(final_data_mean_std))
names(final_data_mean_std) <- gsub('Mag',"Magnitude",names(final_data_mean_std))
names(final_data_mean_std) <- gsub('^t',"TimeDomain.",names(final_data_mean_std))
names(final_data_mean_std) <- gsub('^f',"FrequencyDomain.",names(final_data_mean_std))
names(final_data_mean_std) <- gsub('\\.mean',".Mean",names(final_data_mean_std))
names(final_data_mean_std) <- gsub('\\.std',".StandardDeviation",names(final_data_mean_std))
names(final_data_mean_std) <- gsub('Freq\\.',"Frequency.",names(final_data_mean_std))
names(final_data_mean_std) <- gsub('Freq$',"Frequency",names(final_data_mean_std))

######################################################################################################################
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
######################################################################################################################

final_avg_by_act_sub = ddply(final_data_mean_std, c("Subject","Activity"), numcolwise(mean))
write.table(final_avg_by_act_sub, file = "tidydataset.txt",row.name=FALSE)


