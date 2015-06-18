      #Importing data from txt files

testSet <- read.table("C:\\Users\\lenovo\\Documents\\data\\UCI HAR Dataset\\test\\X_test.txt")      #stores the TEST SET
trainSet <- read.table("C:\\Users\\lenovo\\Documents\\data\\UCI HAR Dataset\\train\\X_train.txt")   #stores the TRAIN SET

features <- read.table("C:\\Users\\lenovo\\Documents\\data\\UCI HAR Dataset\\features.txt",stringsAsFactors=FALSE)   #stores the names of features
                                                                                                                     #would be used later to name the dataset columns
          #importation complete
###########################################

      #merging the test and training data

mergedSet <- rbind(trainSet,testSet)              #stores the merged data set,combining test and train set
features[,2] <- sub("\\()","",features[,2])       #removing the parenthesis in the feature names 
names(mergedSet) <- features[,2]                  #assigning the columns appropriate names
      
          #merging complete
###########################################

      #extracting only mean and std. deviation measurements

mergedSet <- cbind(mergedSet[,grep("std",features[,2],value=TRUE)],mergedSet[,grep("mean",features[,2],value=TRUE)])    #grep is used for string matching
                                                                                                                        #mergedSet now contains only variables   
                                                                                                                        #that indicate mean or std of some quantity  
rm(testSet)                                 #object created should be deleted after use
rm(features)                                #its a good programming practice
rm(trainSet)

        #extraction complete
###########################################

      #adding subjects to the dataset

Subjects <- read.table("C:\\Users\\lenovo\\Documents\\data\\UCI HAR Dataset\\train\\subject_train.txt")          #stores the Subject number of train set
Subjects_test <- read.table("C:\\Users\\lenovo\\Documents\\data\\UCI HAR Dataset\\test\\subject_test.txt")       #stores the Subject number of test set

Subjects <- rbind(Subjects,Subjects_test)           #combining the two data set to form one
names(Subjects) <- "Subject"                        #suitable name given to the column

mergedSet <- cbind(mergedSet,Subjects)              #merging the Subject column with our working data set

rm(Subjects)
rm(Subjects_test)

        #subject addition complete
###########################################

          #labeling the dataset

act <- read.table("C:\\Users\\lenovo\\Documents\\data\\UCI HAR Dataset\\activity_labels.txt")     #this stores the mapping between 
                                                                                                  #activity and activity number.
act[,2] <- as.character(act[,2])            #changing the activity name for
act[2,2] <- "WALK_UP"                       #more appropriate names
act[3,2] <- "Walk_down"
act[,2] <- factor(act[,2])

labels <- read.table("C:\\Users\\lenovo\\Documents\\data\\UCI HAR Dataset\\train\\y_train.txt")       #currently stores activity number of train set
labels_test <- read.table("C:\\Users\\lenovo\\Documents\\data\\UCI HAR Dataset\\test\\y_test.txt")    #currently stores activity number of test set

labels <- rbind(labels,labels_test)         #combining the activity nnumbers for complete data set
names(labels) <- "Activity"                 #giving suitable name to the variable 

labels[,1] <- factor(labels[,1],labels=act[,2])       #using the mapping,activity number changed to activity name

mergedSet <- cbind(mergedSet,labels)        #Activity column merged with working data set

rm(act)   
rm(labels)
rm(labels_test)

          #labeling complete
###########################################

#creating an independent tidy data set with the average 
#of each variable for each activity and each subject.

library(tidyr)
library(reshape2)

finalSet <- mergedSet                        #finalSet will act as independent data set

finalSet <- melt(finalSet,id.vars=c("Subject","Activity"),variable.name ="variables",value.name="values")         #this is similar to using gather function 
                                                                                                                  #to make the data set narrow

finalSet <- dcast(finalSet,Subject+Activity ~ variables,mean)              #finalSet now has average of each variable
                                                                           #for each activity and each subject

    #independent data set formulated
###########################################

  #writing the final dataset to .txt file

write.table(finalSet,file="C\\Users\\lenovo\\Documents\\data\\final dataset.txt",row.names=FALSE) 

          #writing complete
###########################################
