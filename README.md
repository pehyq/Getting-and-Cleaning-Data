# Getting-and-Cleaning-Data
Course project for Getting and Cleaning Data from JHU Data Science Specialisation

## 0. Preprocessing:
The data from the Zip is first read into R using read.table function.
There are 3 types of data, features files (x), activity files (y), subject files.
Activity names are also read.

## 1. Merge data: 
The training and the test sets are first merged for feature, activity and subjects.
Column labels are added.
The data sets are then combined to form one giant data set.

## 2. Extracts mean and standard deviation
Only functions with mean and std are selected.

## 3. Uses descriptive activity names to name the activities in the data set
Activity names are labelled based on activity_labels.txt.
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING


## 4. Appropriately labels the data set with descriptive variable names.
Data sets are labelled based on features_info.txt.
^t time
^f frequency
Acc Accelerometer
Gyro Gyroscope
Mag Magnitude
BodyBody Body

## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
data2 is created using aggregate function
file is exported as a txt file
