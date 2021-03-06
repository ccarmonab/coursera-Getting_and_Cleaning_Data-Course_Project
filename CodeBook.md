Code Book
=========

Code book for the Course Project for the [Getting and Cleaning Data course on Coursera](https://www.coursera.org/course/getdata), November 2014 edition.

Raw data collection
-------------------

The experiments [[1](#references)] have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


###Features

The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

No unit of measures is reported as all features were normalized and bounded within [-1,1].

Data transformation
-------------------

The raw data sets are processed with run_analisys.R script to create a tidy data set. The process followed to generated this new tidy data set is described in the following sections.

###Step 1: Merges the training and the test sets 

The test and train data are bound into an unique data set. The resulting data set contains 10299 observations with 563 variables

###Step 2: Extracts only the measurements on the mean and standard deviation

From the data set obtained from the previous step, only those columns corresponding to mean and standard deviation measurements, the subject and the activities are selected. The resulting data set contains 10299 observations with 68 variables.

###Step 3: Uses descriptive activity names

The activity numeric labels are replaced using the descriptive activity names defined in the activiy_labels.txt file.

###Step 4: Appropriately labels the data set

The columns names are replaced from undrescriptive names as V1 to some more descriptive, using the feature labels defined in the features.txt file.

###Step 5: Creates a tidy data set with the average of each variable

From the data set in the previous step, a tidy data set is created, with the average of each variable for each activity and each subject.

The tidy data set contains __180 observations with 68 variables__ divided in:

* _subject_: Identifier of the subject who carried out the experiment. Values from 1 to 30.
* _activity_: Activity label. Values: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS,WALKING_UPSTAIRS

For each of the next variables, for each of the 3 directions (X,Y,Z), a columns exists with its mean, and another one for its standard deviation, for each activity and each subject.
* _tBodyAcc_  
* _tGravityAcc_
* _tBodyAccJerk_
* _tBodyGyro_
* _tBodyGyroJerk_
* _fBodyAcc_
* _fBodyAccJerk_
* _fBodyGyro_

Finally, for each each of the next variables, a columns exists with its mean, and another one for its standard deviation, for each activity and each subject

* _tBodyAccMag_
* _tGravityAccMag_
* _tBodyAccJerkMag_
* _tBodyGyroMag_
* _tBodyGyroJerkMag_
* _fBodyAccMag_
* _fBodyAccJerkMag_
* _fBodyGyroMag_
* _fBodyGyroJerkMag_

References
----------

###<a href="references"></a>
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
