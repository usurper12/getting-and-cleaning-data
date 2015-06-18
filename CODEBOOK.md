#**__Variable in the script__**

trainSet <- stores the training set "X_train" of the DATASET.

testSet   <- stores the testing set "X_test" of the DATASET.

features <-  stores all the 561 features measured for this DATASET.

mergedSet <- this stores the merged set formed by combining the test and train Set. All the operations required by the project were performed on this set. 

Subjects <- initially subject information in the train Set was read into this but later this was used to store combined subject information of the complete Set and used to merge with mergedSet.

Subjects_test <- stored subject information in the test Set, was merged with "Subjects" to combine both test and train sets. there were in total 30 subjects (1-30).

act <- this variable was used to store the activities namely, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS
, SITTING
, STANDING
, LAYING. this was later used to label the activities.

labels and labels_test <- these stored train and test labels which were initially numbers representing one of the 6 activities. they were merged to the mergedSet and using "act" proper names were assigned.

finalSet <- this stored the independent dataSet asked in step-5 of the assignment. it has tidy data set with the average of each variable for each activity and each subject.

# **__FEATURE SELECTION__**

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

##__------NOTES-----__

1. 't' at the begining of the name means that particular feature was measured in time domain.
2. 'f' at the begining of the name means that particulat feature was measured in frequency domain.
3. "std" at the end of the name means "standard deviation" of that measure was caluclated.
4. "mean" at the end of the name means "average" of that measure was calculated.

##__------FEATURES------__

###__tBodyAcc-std-X__
         standard deviation of body acceleration along X direction.
     
###__tBodyAcc-std-Y__
         standard deviation of body acceleration along Y direction.
     
###__tBodyAcc-std-Z__
         standard deviation of body acceleration along Z direction.
     
###__tGravityAcc-std-X__
         standard deviation of gravitational acceleration along X-axis.

###__tGravityAcc-std-Y__
         standard deviation of gravitational acceleration along Y-axis.

###__tGravityAcc-std-Z__
         standard deviation of gravitational acceleration along Z-axis.

###__tBodyAccJerk-std-X__
         standard deviation of acceleration of body using jerks along X-axis.

###__tBodyAccJerk-std-Y__
         standard deviation of acceleration of body using jerks along Y-axis.

###__tBodyAccJerk-std-Z__
         standard deviation of acceleration of body using jerks along Z-axis.

###__tBodyGyro-std-X__
         standard deviation of gyroscopic movement of body along X-axis.

###__tBodyGyro-std-Y__
         standard deviation of gyroscopic movement of body along Y-axis.

###__tBodyGyro-std-Z"
         standard deviation of gyroscopic movement of body along Z-axis.

###__tBodyGyroJerk-std-X__
         standard deviation of gyroscopic movement of body using jerks along X-axis.

###__tBodyGyroJerk-std-Y__
         standard deviation of gyroscopic movement of body using jerks along Y-axis.

###__tBodyGyroJerk-std-Z__
         standard deviation of gyroscopic movement of body using jerks along Z-axis.

###__tBodyAccMag-std__
         standard deviation of magnitude of body acceleration

###__GravityAccMag-std__
         standard deviation of magnitude of gravitional acceleration.

###__tBodyAccJerkMag-std__
         standard deviation of magnitude of body acceleration due to jerk.

###__tBodyGyroMag-std__
         standard deviation of magnitude of gyroscopic motion of body.

###__tBodyGyroJerkMag-std__
         standard deviation of magnitude of gyroscopic motion of body due to jerk.

###__tBodyAcc-mean-X__
         mean of body acceleration along X-axis 
         
###__tBodyAcc-mean-Y__
         mean of body acceleration along Y-axis

###__tBodyAcc-mean-Z__
         mean of gravitational acceleration along Z-axis

###__tGravityAcc-mean-X__
         mean of gravitational acceleration along X-axis

###__tGravityAcc-mean-Y__
         mean of gravitational acceleration along Y-axis

###__tGravityAcc-mean-Z__
         mean of gravitational acceleration along X-axis

###__tBodyAccJerk-mean-X__
         mean of body acceleration due to jerk along X-axis.

###__tBodyAccJerk-mean-Y__
         mean of body acceleration due to jerk along Y-axis.

###__tBodyAccJerk-mean-Z__
         mean of body acceleration due to jerk along Z-axis.

###__tBodyGyro-mean-X__
         mean of gyroscopic measure along X-axis.

###__tBodyGyro-mean-Y__
         mean of gyroscopic measure along Y-axis.

###__tBodyGyro-mean-Z__
         mean of gyroscopic measure along Z-axis.

###__tBodyGyroJerk-mean-X__
         mean of gyroscopic measure due to jerk along X-axis.

###__tBodyGyroJerk-mean-Y__
         mean of gyroscopic measure due to jerk along Y-axis.

###__tBodyGyroJerk-mean-Z__
         mean of gyroscopic measure due to jerk along Z-axis.

###__tBodyAccMag-mean__
         mean of magnitude of body acceleration.

###__tGravityAccMag-mean__
         mean of magnitude of gravitational acceleration.

###__tBodyAccJerkMag-mean__
         mean of magnitude of body acceleration due to jerk.

###__tBodyGyroMag-mean__
         mean of magnitude of gyroscopic acceleration of the body.

###__tBodyGyroJerkMag-mean__
         mean of magnitude of gyroscopic acceleration due to jerk of the body.


## FREQUENCY DOMAIN BASED MEASUREMENTS


###__fBodyAcc-std-X__
         standard deviation of body acceleration along X-axis.

###__fBodyAcc-std-Y__
         standard deviation  of body acceleration along Y-axis.

###__fBodyAcc-std-Z__
         standard deviation of body acceleration along Z-axis.

###__fBodyAccJerk-std-X__
         standard deviation of body acceleration due to jerk along X-axis .

###__fBodyAccJerk-std-Y__
         standard deviation of body acceleration due to jerk along Y-axis.

###__fBodyAccJerk-std-Z__
         standard deviation of body acceleration due to jerk along Z-axis.

###__fBodyGyro-std-X__
         standard deviation of gyrocopic measure along X-axis.

###__fBodyGyro-std-Y__
         standard deviation of gyrocopic measure along Y-axis.

###__fBodyGyro-std-Z__
         standard deviation of gyrocopic measure along Z-axis.

###__fBodyAccMag-std__
         standard deviation of gyrocopic measure along X-axis.

###__fBodyAcc-mean-X__
###__fBodyAcc-mean-Y__
###__fBodyAcc-mean-Z__
          these are mean of body acceleration along X-,Y- and Z-axis.

###__fBodyAcc-meanFreq-X__
###__fBodyAcc-meanFreq-Y__
###__fBodyAcc-meanFreq-Z__
          these are mean frequency of body acceleration along X-,Y- and Z- axis.

###__fBodyAccJerk-mean-X__
###__fBodyAccJerk-mean-Y__
###__fBodyAccJerk-mean-Z__
          these are mean of body acceleration due to jerk along X-,Y- and Z- axis.

###__fBodyAccJerk-meanFreq-X__
###__fBodyAccJerk-meanFreq-Y__
###__fBodyAccJerk-meanFreq-Z__
          these are mean frequency of body acceleration due to jerk along X-,Y- and Z- axis.

###__fBodyGyro-mean-X__
###__fBodyGyro-mean-Y__
###__fBodyGyro-mean-Z__
          these are mean of gyroscopic measure along X-,Y- and Z- axis.

###__fBodyGyro-meanFreq-X__
###__fBodyGyro-meanFreq-Y__
###__fBodyGyro-meanFreq-Z__
          these are mean frequency of gyroscopic measure along X-,Y- and Z- axis.

###__fBodyAccMag-mean__
          mean of magnitude of body acceleration.

###__fBodyAccMag-meanFreq__
          mean frequency magnitude of body acceleration.

###__fBodyBodyAccJerkMag-mean__
          mean magnitude of body acceleration due to jerk.

###__fBodyBodyAccJerkMag-meanFreq__
          mean frequency magnitude of body acceleration due to jerk.

###__fBodyBodyGyroMag-mean__
###__fBodyBodyGyroMag-meanFreq__
###__fBodyBodyGyroJerkMag-mean__
###__fBodyBodyGyroJerkMag-meanFreq__
###__fBodyBodyAccJerkMag-std__
###__fBodyBodyGyroMag-std__
###__fBodyBodyGyroJerkMag-std__

