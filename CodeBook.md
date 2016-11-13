Intructions on running R script:

The R script is uploaded as the file "run_analysis.R"

The user needs to replace the ##Enter wd directory here## in line 6 with the location of the UCI HAR Dataset on their computer.

Then the entire script can be run as is and the data frame "total_data" is the tidy data set created.

Below is a stepwise description of the process:

1 The data was imported and assigned to the following data frames: "features" - the 561 variable names "activity_labels" - the activity description of each label "subject_train" - the label indicating which subject corresponded to each observation in the training set "subject_test" - the label indicating which subject corresponded to each observation in the test set "x_train" - the 561 measurements of the 7,352 observations in the training set "y_train" - the label indicating which activity corresponded to each observation in the training set "x_test" - the 561 measurements of the 2,947 observations in the test set "y_test" - the label indicating which activity corresponded to each observation in the test set

2 The imported data frames were coverted to the tbl_df class.

3 The column names of the "x_train" and "x_test" data frames were assigned the variable names given in the "features" data frame. The column names of the "y_train" and "y_test" data frames were assigned the variable name: Activity. The column names of the "subject_train" and "subject_test" data frames were assigned the variable name: Subject.

4 A new indicator variable was created which was assigned 1 if the observation was from the training set and 0 if from the test set.

5 The indicator variable was merged along with the subject, y and x data frames by columns.

6 The training and test sets were merged by rows.

7 The column names were made "legal", i.e. syntactically valid names.

8 Replaced the 1-6 labels of the Activity column with descriptions of the actual activities.

9 Save down the tidy data set to the file: "total_data.txt"

10 Extract only the variables that contain the measurements on the mean and standard deviation and save the files as "data_mean.txt" and "data_std.txt".

11 Group the data set by activity and subject

12 Create two new separate tidy data sets. One data set for the average of each variable grouped by each activity and the second data set for the average of each variable grouped by each subject.
