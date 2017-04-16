#This code is used for the course project of Getting and Cleaning Data in Coursera

library(plyr)

#read the data sets
features<-read.table("features.txt")
activityLabels<-read.table("activity_labels.txt")

trainingSet<-read.table("./train/X_train.txt")
trainingLabels<-read.table("./train/y_train.txt")
trainingSubject<-read.table("./train/subject_train.txt")

testSet<-read.table("./test/X_test.txt")
testLabels<-read.table("./test/y_test.txt")
testSubject<-read.table("./test/subject_test.txt")

#Step 1
#Merge the training and the test sets to creat one data set

#To creat one set containing training and test sets
mergedSet<-rbind(trainingSet,testSet)

#To creat one set containing training and test labels
mergedLabels<-rbind(trainingLabels,testLabels)

#To creat one set containing training and test subjects
mergedSubject<-rbind(trainingSubject,testSubject)
############################################

#Step 2
#Extract only the measurements on mean and standard deviation for each measurement

#get the names only with mean() or std() in features
mean_or_std_features<-grep("-(mean|std)\\(\\)",features[,2])

#subset the required columns
mergedSet<-mergedSet[,mean_or_std_features]

#name the required columns
names(mergedSet)<-features[mean_or_std_features,2]
###########################################

#Step 3
#Uses descriptive activity names to name the activities in the data set

#substitute the numbers in the "activityLabels" variable with corresponding activities
mergedLabels[,1]<-activityLabels[mergedLabels,2]

#name the column of "mergedLabels"
names(mergedLabels)<-"activity"
###########################################

#Step 4
#Appropriately labels the data set with descriptive variable names

#since the name of the measurements and activities have already labelled, here only name subject
names(mergedSubject)<-"subject"

#combine all the data into a single data set
allData<-cbind(mergedSet,mergedLabels,mergedSubject)
###########################################

#Step 5
#From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject

#last two columns (activity and subject) should be excluded when calculate the mean
averageData<-ddply(allData,.(subject,activity),function(x) colMeans(x[,1:(dim(allData)[2]-2)]))

#write down data
write.table(averageData,"averageData.txt",row.names = FALSE)

