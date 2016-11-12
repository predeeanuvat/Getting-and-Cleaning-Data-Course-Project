#Import the plyr and dplyr libraries
library(plyr)
library(dplyr)

#Read the raw data
setwd("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset")
activity_labels <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/activity_labels.txt",header=FALSE)
features <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/features.txt",header=FALSE)
subject_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/subject_train.txt",header=FALSE)
x_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/X_train.txt",header=FALSE)
y_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/y_train.txt",header=FALSE)
#body_acc_x_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt",header=FALSE)
#body_acc_y_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt",header=FALSE)
#body_acc_z_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt",header=FALSE)
#body_gyro_x_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt",header=FALSE)
#body_gyro_y_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt",header=FALSE)
#body_gyro_z_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt",header=FALSE)
#total_acc_x_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt",header=FALSE)
#total_acc_y_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt",header=FALSE)
#total_acc_z_train <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt",header=FALSE)
subject_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/subject_test.txt",header=FALSE)
x_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/X_test.txt",header=FALSE)
y_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/y_test.txt",header=FALSE)
#body_acc_x_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt",header=FALSE)
#body_acc_y_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt",header=FALSE)
#body_acc_z_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt",header=FALSE)
#body_gyro_x_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt",header=FALSE)
#body_gyro_y_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt",header=FALSE)
#body_gyro_z_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt",header=FALSE)
#total_acc_x_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt",header=FALSE)
#total_acc_y_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt",header=FALSE)
#total_acc_z_test <- read.table("C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt",header=FALSE)

#convert to tbl_df
x_train <- tbl_df(x_train)
y_train <- tbl_df(y_train)
x_test <- tbl_df(x_test)
y_test <- tbl_df(y_test)
subject_test <- tbl_df(subject_test)
subject_train <- tbl_df(subject_train)

#Label the columns of x and y train and test sets
colnames(x_train) <- features[,2]
colnames(y_train) <- "Activity"
colnames(subject_train) <- "Subject"
colnames(x_test) <- features[,2]
colnames(y_test) <- "Activity"
colnames(subject_test) <- "Subject"

#Create new variable indicating whether training or test set
train_indic <- tbl_df(seq(1:1,length=7352,by=0))
colnames(train_indic) <- "Train/Test"
test_indic <- tbl_df(seq(0:0,length=2947,by=0))
colnames(test_indic) <- "Train/Test"

#Merge this new variable with the subject indicators
y_train <- bind_cols(y_train,train_indic,subject_train)
y_test <- bind_cols(y_test,test_indic,subject_test)
y_train$`Train/Test` <- ifelse(y_train$`Train/Test` == 0,"TEST","TRAIN")
y_test$`Train/Test` <- ifelse(y_test$`Train/Test` == 0,"TEST","TRAIN")

#Merge the y_train w/ x_train and y_test w/ x_test
train_set <- bind_cols(y_train,x_train)
test_set <- bind_cols(y_test,x_test)

#Merge the train and test sets
total_data <- bind_rows(train_set,test_set)

#Make the column names legal
colnames(total_data) <- make.names(colnames(tota_data),unique=TRUE,allow_=TRUE)

#Match the Activity descriptions with the labels
total_data$`Activity` <- ifelse(total_data$`Activity` == 1,"WALKING",ifelse(total_data$`Activity` ==2,"WALKING_UPSTAIRS",ifelse(total_data$`Activity`==3,"WALKING_DOWNSTAIRS",ifelse(total_data$`Activity`==4,"SITTING",ifelse(total_data$`Activity`==5,"STANDING","LAYING"))))) 
View(total_data)

#Save the tidy data set
write.table(total_data,file="C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/total_data.txt",row.names = FALSE)

#Select only the columns with "mean" and "std"
data_mean <- select(total_data,contains("mean"))
data_std <- select(total_data,contains("std"))
write.table(total_data,file="C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/data_mean.txt",row.names = FALSE)
write.table(total_data,file="C:/Users/Predee/Desktop/Getting and Cleaning Data/Project/data_std.txt",row.names = FALSE)

#Group by activity and subject 
by_activity <- group_by(total_data,Activity)
by_subject <- group_by(total_data,Subject)

#Work out Variable averages by activity and subject
by_activity_mean <- summarize_each(by_activity,funs(mean(.,na.rm=TRUE)),-Train.Test,-Subject)
by_subject_mean <- summarize_each(by_subject,funs(mean(.,na.rm=TRUE)),-Train.Test,-Activity)

