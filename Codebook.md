## A) Project description

## B) Study design and data processing

# B.1) Collection of the raw data

Human Activity Recognition Using Smartphones Dataset (Version 1.0)
Downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

According to it's authors:
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

I kindly recommend to watch the following video, wich shows how the data was collected. It helped me to put the data in a context instead of working with "cold" numbers, and it was a lot meaningful.
https://www.youtube.com/watch?v=XOEN9W05_4A

# B.2) Notes on the original (raw) data

Pleass refer to the "README.txt" file of the original dataset.

# B.3) Creating the tidy datafile

An R script called "run_analysis.R" is used to create the tidy dataset from the raw data (wich is compressed in the file "UCI HAR Dataset.zip")
- This script was created using OS X 10.1.1
- This script uses de dplyr library, wich is required to be loaded before running the function getData in order to work properly.

Please note: 
- The function "unz" is used to read files from the zip without unzipping it, so the file "UCI HAR Dataset.zip" should be in your working directory.
The script will download the zip file if it doesn't find it in the working directory.

Pseudocode
1- Download the zipped data file (if required).
2- Read the required files (based on the discussions on the forums of the project and my interpretation of what is required,
   there are 8 total files to be readed, the files of inertial signals are not used).
3- Add descriptive column names to the files (for the X_test and X_train the second column of the features.txt file is used).
4- Create one dataset for the training data and other for the test data.
5- Create one single dataset combining the training and test data.

Description on how to create the tidy data file (1. download the data, ...)/

B.4) Cleaning of the data

Short, high-level description of what the cleaning script does. link to the readme document that describes the code in greater detail

## C) Description of the variables in the act_tidy.txt file

General description of the file including:

Dimensions of the dataset
Summary of the data
Variables present in the dataset
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

Variable 1 (repeat this section for all variables in the dataset)

Short description of what the variable describes.

Some information on the variable including:

Class of the variable
Unique values/levels of the variable
Unit of measurement (if no unit of measurement list this as well)
In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels).
(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

Notes on variable 1:

If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

## D) Sources

1- Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

2- Codebook template based on JorisSchut's:
https://github.com/JorisSchut/Data-Science/blob/master/Other%20stuff/Codebook%20template.Rmd

## E) Annex

If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)

Procesed data
Information about the variables (including units!) in the data set not contained in the tidy data
Information about the summary choices you made
Information about the experimental study design you used

heir data type:

Continuous
Ordinal
Categorical
Missing
Censored


In some cases it will not be possible to script every step. In that case you should provide instructions like:

Step 1 - take the raw file, run version 3.1.2 of summarize software with parameters a=1, b=2, c=3
Step 2 - run the software separately for each sample
Step 3 - take column three of outputfile.out for each sample and that is the corresponding row in the output data set

called pseudocode. It should look something like:

Step 1 - take the raw file, run version 3.1.2 of summarize software with parameters a=1, b=2, c=3
Step 2 - run the software separately for each sample
Step 3 - take column three of outputfile.out for each sample and that is the corresponding row in the output data set

Study design and data processing

