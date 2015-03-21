# Variables

* `trainingData_x`,`testingData_x`, `trainingData_y`, `testingData_y`, `trainingSubject`, `testingSubject` contains the data from the raw files
* `xMerged`, `yMerged`, `subjectMerged` merges the training and testing data together
* `features` and `activityLabels` retrieve the features and activity labels from the raw files respectively
* `ColNoToExtract` obtains the relevant features (the mean and standard deviation for each measurement
* `yMergedLabels` contains the y-axis activity labels
* `mergedData` binds the x-axis values, y-axis activity labels and the subject number
* `relevantData` filters the data to only the relevant features
* `finalData` groups the y-axis activity labels and which subject it pertains to and calculates the mean for each group

# Data

The data is taken from the "Human Activity Recognition Using Smartphones Data Set" and is taken from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

# Transformations

The code is divided into 3 parts:

* Importing the raw data from files
This part imports the raw data from the files and stores it as variables. New variables are created to merge the training and testing data together.

* Obtain the Features Needed
The features file is imported into the features variable and the relevant features are extracted -- the mean and the standard deviation for each measurement. The activity labels are imported as well. 

* Extracting the Features
Firstly, the activity labels for each of the y-axis values are retrieved. Secondly, a mergedData variable is created containing the x-axis values, y-axis activity labels and which subject it pertains to. Thirdly, a relevantData variable
is created to retrieve the relevant columns that contain the mean and standard deviation. Fourthly, the data is grouped by the y-axis activity labels and which subject it pertains to, and the mean is calculated. Lastly,
duplicate columns are removed, the column names are written and the output is saved to a file. 
