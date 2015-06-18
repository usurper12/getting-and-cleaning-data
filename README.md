###########################################
#Human Activity Recognition Using Smartphones Dataset
#Version 1.0
###########################################

##**__-----ABOUT THE DATASET-----__**

The experiments have been carried out with a group of 30 volunteers 
within an age bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a 
constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 
The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers
was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters 
and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion components, was separated 
using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed 
to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency
domain. 

###########################################

##**__-----ABOUT THE PROJECT-----__**

It was required to create one R script called run_analysis.R that does the following. 

1.  Merges the training and the test sets to create one data set.
2.  Extracts only the measurements on the mean and standard deviation for each measurement. 
3.  Uses descriptive activity names to name the activities in the data set
4.  Appropriately labels the data set with descriptive variable names. 
5.  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

###########################################

##**__-----WALKTHROUGH-----__**

1.  Train and test data set is separately imported using read.table().(please make sure you have the correct file path     when running on your system)
    also variable "features" is used to store the features recorded for each subject.  
    "mergedSet" is used to store the combined data set and is obtained using rbind().
    Using features column names of the mergedSet are assigned for easier handling of the data set.

2.  grep() on features was used to extract measurements that indicated mean or standard deviation of any quantity.
    79 such measurements were obtained from the initial 561 measurements.

3.  Next task was to add subjects(the participants) who took part in the experiment. There were 30 in total.
    "Subjects" & "Subjects_test" stored the values of subjects of train and test set respectively. rbind() on subjects     to combine them 
    and cbind() to merge them with "mergedSet" was applied.
    at this point mergedSet had 79 columns indicating measurements and 1 column to indicate the subjects

4.  "activity_labels.txt" file along with the data set showed the factorisation of activities.
    
      1. WALKING
      2. WALKING_UPSTAIRS
      3. WALKING_DOWNSTAIRS
      4. SITTING
      5. STANDING
      6. LAYING

    
  to label "mergedSet" data from "y_train.txt" and "y_test.txt" was extracted and stored in "labels" and "labels_test"   respectively.
  they were combined using rbind() and using factor() the character part of the mapping was stored and merged with      "mergedSet" using cbind()

  at this point "mergedSet" has 79 columns indicating measurements which indicate mean or standard deviation of some    quantity, 1 column indicating subjects named "Subject" and 1 column indicating the activity named "Activity".  mergedSet looks like this -----

  **__head(mergedSet[,1:5],5)__**
```
tBodyAcc-std-X  tBodyAcc-std-Y      tBodyAcc-std-Z   tGravityAcc-std-X   tGravityAcc-std-Y
 -0.9952786       -0.9831106         -0.9135264         -0.9852497    	    -0.9817084
 -0.9982453       -0.9753002         -0.9603220         -0.9974113        	-0.9894474
 -0.9953796       -0.9671870         -0.9789440         -0.9995740        	-0.9928658
 -0.9960915       -0.9834027         -0.9906751         -0.9966456        	-0.9813928
 -0.9981386       -0.9808173         -0.9904816         -0.9984293      	 -0.9880982
```
5.  the variable "finalSet" is used to create the independent tidy data set with the average of each variable for each     activity and each subject.
    using melt() all the measurement are brought together in the same column "variables" whilst their values in a         separate column "values"
    at this point the finalSet looks like ------          
	
  **__head(finalSet)__**
```
Subject   Activity      variables       values
      1 	STANDING   tBodyAcc-std-X   -0.9952786
      1 	STANDING   tBodyAcc-std-X   -0.9982453
      1 	STANDING   tBodyAcc-std-X   -0.9953796
      1 	STANDING   tBodyAcc-std-X   -0.9960915
      1 	STANDING   tBodyAcc-std-X   -0.9981386
      1 	STANDING   tBodyAcc-std-X   -0.9973350
```
 finally dcast(finalSet,Subject+Activity ~ variables,mean) is used. Here formula used is "finalSet,Subject+Activity ~ variables" and mean of the values is calculated. this formula in simple terms can be understood as-- we would like "Subject" to change slowest then "Activity" and so on.

 finalSet now contains 180 rows and 81 columns. finalSet looks like this -----

  **__head(finalSet[,1:4],7)__**
```
  Subject  Activity   tBodyAcc-std-X    tBodyAcc-std-Y
      1    WALKING     -0.28374026        0.114461337
      1    WALK_UP     -0.35470803       -0.002320265
      1  Walk_down      0.03003534       -0.031935943
      1    SITTING     -0.97722901       -0.922618642
      1   STANDING     -0.99575990       -0.973190056
      1     LAYING     -0.92805647       -0.836827406
      2    WALKING     -0.42364284       -0.078091253
```
6.  Finally this finalSet is written to a txt file using write.table() with row.names=FALSE.

###########################################

##**__-----NOTES-----__**

1.  Features are normalized and bounded within [-1,1].
2.  The dataset was downloaded on to the system and then analysed. If the user intends to directly download the           dataset using R changes in the R-script need to be made.
3.  Use Notepad++ or textWrangler for windows and iOS repectively for better view of the data.
4.  data set might appear slightly slanted due to the values and corresponding column names(names being too big at        times).
