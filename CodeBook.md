About the run_analysis.R code 

The code performs 5 steps as described in the course project:
1.All the similar datum that were seperated into "Training" and "Test" groups are merged into the "merged__" data sets with rbind() 
function. By similar, we mean the datum that have the same columns and decribe the same entities. 
2.Then, only those columns containing mean or standard deviation measurement are extracted from the whole dataset, as required in Step 2. 
After extracting these columns, they are named correspondingly.
3.We substitute the original activity data (1:6) with activity names, using activity_labels.txt.
4.We name all variables needed in the whole dataset, which contains the required measurements, activities and subjects.
5.We generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). 
The output file is called averageData.txt.
###################################################################################################################################

About the variables
1.trainingSet, trainingLabels, trainingSubject, testSet, testLabels, testSubject, activityLabels and features are datum from the 
downloaded files.
2.mergedSet, mergedLabels and mergedSubject merge the corresponding previous datasets.
3.mean_or_std_features contains the column index of the required feature in feasures dataset, index which is used to extract desired data.
4.allData merges refined mergedSet, mergedLabels and mergedSubject into a single dataset.
5.averageData contains required averages with ddplyr() function and is stored in "averageData.txt" file.
