# Importing the data from the files
trainingData_x = read.table("C:\\Users\\Joel\\Desktop\\MOOC Course\\Getting and Cleaning Data\\getdata-projectfiles-UCI HAR Dataset\\train\\X_train.txt")
testingData_x = read.table("C:\\Users\\Joel\\Desktop\\MOOC Course\\Getting and Cleaning Data\\getdata-projectfiles-UCI HAR Dataset\\test\\X_test.txt")

trainingData_y = read.table("C:\\Users\\Joel\\Desktop\\MOOC Course\\Getting and Cleaning Data\\getdata-projectfiles-UCI HAR Dataset\\train\\y_train.txt")
testingData_y = read.table("C:\\Users\\Joel\\Desktop\\MOOC Course\\Getting and Cleaning Data\\getdata-projectfiles-UCI HAR Dataset\\test\\y_test.txt")

trainingSubject = read.table("C:\\Users\\Joel\\Desktop\\MOOC Course\\Getting and Cleaning Data\\getdata-projectfiles-UCI HAR Dataset\\train\\subject_train.txt")
testingSubject = read.table("C:\\Users\\Joel\\Desktop\\MOOC Course\\Getting and Cleaning Data\\getdata-projectfiles-UCI HAR Dataset\\test\\subject_test.txt")

xMerged = rbind(trainingData_x, testingData_x)
yMerged = rbind(trainingData_y, testingData_y)
subjectMerged = rbind(trainingSubject, testingSubject)

# Obtain the Needed Features

features = read.table("C:\\Users\\Joel\\Desktop\\MOOC Course\\Getting and Cleaning Data\\getdata-projectfiles-UCI HAR Dataset\\features.txt")
ColNoToExtract <- grep(".*Mean.*|.*mean.*|.*Std.*|.*std.*", features[,2])
activityLabels = read.table("C:\\Users\\Joel\\Desktop\\MOOC Course\\Getting and Cleaning Data\\getdata-projectfiles-UCI HAR Dataset\\activity_labels.txt")

#Extracting the Features
yMergedLabels = vector()
for(i in 1:nrow(yMerged)){
  yMergedLabels[i] <- as.character(activityLabels[yMerged[i,],2])
}
mergedData <- cbind(xMerged, yMergedLabels, subjectMerged)
relevantData <- mergedData[,c(563,562,ColNoToExtract)]
features[ColNoToExtract,2]

finalData <- aggregate(relevantData, by=list(relevantData$yMergedLabels,relevantData$V1), FUN=mean, na.rm=TRUE)
finalData[,3] = NULL # remove duplicate columns
finalData[,3] = NULL # remove duplicate columns
colnames(finalData) <- c("Activity","Subject",as.character(features[ColNoToExtract,2])) # Add in the column names

write.table(finalData, "finalData.txt", sep="\t")
