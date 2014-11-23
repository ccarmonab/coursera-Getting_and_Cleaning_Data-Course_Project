Getting and Cleaning Data - Course Project
=================================================

Course Project for the [Getting and Cleaning Data course on Coursera](https://www.coursera.org/course/getdata), November 2014 edition.

## Project Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit:

1. a tidy data set as described below, 
2. a link to a Github repository with your script for performing the analysis, and 
3. a code book that describes the variables, the data, and any transformations or work that you performed to  clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example [[1](#references)]. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Repository content

* __README.md__: current file
* __CodeBook.md__: 
* __run_analysis.R__: 

## Reproducible research

If you want to generate your own tidy data set using the provided _run_analysis.R_ script you should:

1. Download [compressed raw data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).
2. Unzip raw data and copy the directory `UCI HAR Dataset` to your working directory.
3. Clone this repository in your computer: https://github.com/ccarmonab/coursera-Getting_and_Cleaning_Data-Course_Project
4. Copy the run_analysis.R file into your working directory
4. source run_analisys.R script: `source('run_analysis.R')`

It will generate a file named tidy_data.txt in the root of your working directory. If you want to read it and looking it in R, the command is [[2](#references)]: 

```{r}
data <- read.table("tidi_data.txt", header = TRUE) 
View(data)

```

References
----------

### <a name="references"></a>
1. http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/
2. https://class.coursera.org/getdata-009/forum/thread?thread_id=58