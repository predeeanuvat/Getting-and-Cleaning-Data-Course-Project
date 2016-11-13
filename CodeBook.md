Intructions on running R script:

The R script is uploaded as the file "run_analysis.R"

The user needs to replace the ##Enter wd directory here## in line 6 with the location of the UCI HAR Dataset on their computer.

Then the entire script can be run as is and the data frame "total_data" is the tidy data set created.

Description of data set:

The data set contains 10,299 different observations from 30 volunteers performing 6 different activities. These observations are broken down into a Training set (7,352) and a Test set (2,947).
The 30 volunteers are simply labelled 1-30.

The activities are labelled 1-6 corresponding to the following activities:

1 Laying

2 Sitting

3 Standing

4 Walking

5 Walking Downstairs

6 Walking Upstairs

The signals recorded from the accelerometer within the smartphone were manipulated to produce the following measurements:

tBodyAcc-X

tBodyAcc-Y

tBodyAcc-Z

tGravityAcc-X

tGravityAcc-Y

tGravityAcc-Z

tBodyAccJerk-X

tBodyAccJerk-Y

tBodyAccJerk-Z

tBodyGyro-X

tBodyGyro-Y

tBodyGyro-Z

tBodyGyroJerk-X

tBodyGyroJerk-Y

tBodyGyroJerk-Z

tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag

fBodyAcc-X

fBodyAcc-Y

fBodyAcc-Z

fBodyAccJerk-X

fBodyAccJerk-Y

fBodyAccJerk-Z

fBodyGyro-X

fBodyGyro-Y

fBodyGyro-Z

fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

The following statistics were calculated from some of the above measurements:

mean(): Mean value

std(): Standard deviation

mad(): Median absolute deviation

max(): Largest value in array

min(): Smallest value in array

sma(): Signal magnitude area

energy(): Energy measure. Sum of the squares divided by the number of values.

iqr(): Interquartile range

entropy(): Signal entropy

arCoeff(): Autorregresion coefficients with Burg order equal to 4

correlation(): correlation coefficient between two signals

maxInds(): index of the frequency component with largest magnitude

meanFreq(): Weighted average of the frequency components to obtain a mean frequency

skewness(): skewness of the frequency domain signal

kurtosis(): kurtosis of the frequency domain signal

bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.

angle(): Angle between to vectors.

This has resulted in 561 variables for each of the 10,299 observations.
