## read data 
# features file
xtest<-read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
xtrain<-read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)

# activity file
ytest<-read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
ytrain<-read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)

# subject file
subtest<-read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
subtrain<-read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

# feature name file
featname<-read.table("./UCI HAR Dataset/features.txt", header = FALSE)

# activity name file
actname<-read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)

## 1. merge data
# merge test and train data
featdata<-rbind(xtrain, xtest)
actdata<-rbind(ytrain, ytest)
subdata<-rbind(subtrain, subtest)

# label columns
names(featdata)<-featname$V2
names(actdata)<-"activity"
names(subdata)<-"subject"

# merge to form giant data set
data<- cbind(subdata, actdata, featdata)

## 2. extract mean and std for each data
meandata<- grep("mean()", names(data), value = TRUE)
stddata<- grep("std()", names(data), value = TRUE)
data<-subset(data, select = c("subject","activity", meandata, stddata))

## 3. use descriptive activity names to name the activities
data$activity<-replace(data$activity, data$activity == 1, "WALKING")
data$activity<-replace(data$activity, data$activity == 2, "WALKING_UPSTAIRS")
data$activity<-replace(data$activity, data$activity == 3, "WALKING_DOWNSTAIRS")
data$activity<-replace(data$activity, data$activity == 4, "SITTING")
data$activity<-replace(data$activity, data$activity == 5, "STANDING")
data$activity<-replace(data$activity, data$activity == 6, "LAYING")

## 4. label the data set with descriptive variable names
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

## 5. create a second, independent tidy data set with the average of each variable for each activity and each subject
data2<- aggregate(x = data, by = list(subject = data$subject, activity = data$activity), FUN = mean)
write.table(data2, file = "tidydata.txt",row.name=FALSE)

