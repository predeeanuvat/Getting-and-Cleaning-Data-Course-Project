#Import the plyr and dplyr libraries
library(plyr)
library(dplyr)

#Read the raw data
wd_direc <- "##Enter wd directory here##"
setwd(wd_direc)
act_labels <- "/activity_labels.txt"
feat <- "/features.txt"
sub_train <- "/train/subject_train.txt"
xtrain <- "/train/X_train.txt"
ytrain <- "/train/y_train.txt"
sub_test <- "/test/subject_test.txt"
xtest <- "/test/X_test.txt"
ytest <- "/test/y_test.txt"

activity_labels <- read.table(paste(wd_direc,act_labels,sep=""),header=FALSE)
features <- read.table(paste(wd_direc,feat,sep=""),header=FALSE)

subject_train <- read.table(paste(wd_direc,sub_train,sep=""),header=FALSE)
x_train <- read.table(paste(wd_direc,xtrain,sep=""),header=FALSE)
y_train <- read.table(paste(wd_direc,ytrain,sep=""),header=FALSE)

subject_test <- read.table(paste(wd_direc,sub_test,sep=""),header=FALSE)
x_test <- read.table(paste(wd_direc,xtest,sep=""),header=FALSE)
y_test <- read.table(paste(wd_direc,ytest,sep=""),header=FALSE)


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

#Select only the columns with "mean" and "std"
data_mean <- select(total_data,contains("mean"))
data_std <- select(total_data,contains("std"))

#Group by activity and subject 
by_activity <- group_by(total_data,Activity)
by_subject <- group_by(total_data,Subject)

#Work out Variable averages by activity and subject
by_activity_mean <- summarize_each(by_activity,funs(mean(.,na.rm=TRUE)),-Train.Test,-Subject)
by_subject_mean <- summarize_each(by_subject,funs(mean(.,na.rm=TRUE)),-Train.Test,-Activity)

