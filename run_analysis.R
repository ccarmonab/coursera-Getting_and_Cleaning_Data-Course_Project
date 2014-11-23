## HEADER DEL DOCUMENTO <- PONERLO BONITO

# load required libraries
if (!require("dplyr")) {
  install.packages("dplyr")
}

library(dplyr)

## 1. Merge the training and the test sets to create one data set.
#Read the train data
subject_train_file <- "./UCI HAR Dataset/train/subject_train.txt"
X_train_file <- "./UCI HAR Dataset/train/X_train.txt"
y_train_file <- "./UCI HAR Dataset/train/y_train.txt"
subject_train <- read.table(subject_train_file)
X_train <- read.table(X_train_file)
y_train <- read.table(y_train_file)

#Read the test data
subject_test_file <- "./UCI HAR Dataset/test/subject_test.txt"
X_test_file <- "./UCI HAR Dataset/test/X_test.txt"
y_test_file <- "./UCI HAR Dataset/test/y_test.txt"
subject_test <- read.table(subject_test_file)
X_test <- read.table(X_test_file)
y_test <- read.table(y_test_file)

#Bind the data
#First, test data is bound
training_sensor_data <- cbind(subject_train, y_train,X_train)

#Second, train data is bound
test_sensor_data <- cbind(subject_test, y_test,X_test)

#Finally, both data set are merged
sensor_data <- rbind(training_sensor_data, test_sensor_data)

#The previous data frames are removed from memory
remove(training_sensor_data)
remove(test_sensor_data)
remove(X_test)
remove(y_test)
remove(subject_test)
remove(X_train)
remove(y_train)
remove(subject_train)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement
feature_file <- "./UCI HAR Dataset/features.txt"
features <- read.table(feature_file, colClasses = c("character"))
#Add the two columns corresponding to the subject and the activity
features<-c("subject","activity",features[,2])
columns_mean_std<-grep("subject|activity|mean\\(\\)|std\\(\\)",features)
sensor_data_2<-sensor_data[,columns_mean_std]

## 3. Uses descriptive activity names to name the activities in the data set
activities_descr_file <- "./UCI HAR Dataset/activity_labels.txt"
activities_descr <- read.table(activities_descr_file)
sensor_data_2$V1.1 <- activities_descr$V2[match(sensor_data_2$V1.1, activities_descr$V1)]

## 4. Appropriately labels the data set with descriptive variable names
names(sensor_data_2) <- features[columns_mean_std]

## 5. From the data set in step 4, creates a second, independent tidy data set with the 
##    average of each variable for each activity and each subject
tidy.data <- group_by(sensor_data_2, subject, activity) %>% summarise_each(funs(mean))

# Write that data out to a file
write.table(tidy.data, "tidy_data.txt", row.name=FALSE)