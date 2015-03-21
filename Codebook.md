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

Please refer to the "README.txt" file of the original dataset.
The dataset doesn't contain missing values.

# B.3) Creating the tidy datafile

An R script called "run_analysis.R" is used to create the tidy dataset from the raw data (wich is compressed in the file "UCI HAR Dataset.zip")
- This script was created using OS X 10.1.1
- This script uses de dplyr library, wich is required to be loaded before running the function getData in order to work properly.

Please note: 
- The function "unz" is used to read files from the zip without unzipping it, so the file "UCI HAR Dataset.zip" should be in your working directory. The script will download the zip file if it doesn't find it in the working directory.

Pseudocode
1- Download the zipped data file (if required).
2- Read the required files (based on the discussions on the forums of the project and my interpretation of what is required,
   there are 8 total files to be readed, the files of inertial signals are not used).
3- Add descriptive column names to the files (for the X_test and X_train the second column of the features.txt file is used).
4- Create one dataset for the training data and other for the test data.
5- Create one single dataset combining the training and test data.
6- Select the columns that contain "mean" and "std" (the case of each term is ignored by default by the function used).
   - Columns with duplicated names where removed, since none of these were required by the project parameters.
7- Replace the activity numbers by its correspondant name as defined in the "activity_labels.txt" file.
8- Summarise the data (the mean of each variable, i.e. the columns selected on the step 6), by volunteer and by activity.
9. Write the summarized data into a file called "act_tidy.txt".

The expected output is a dataset with 180 rows (30 volunteers, 6 activities per volunteer) and 88 variables.

B.4) Cleaning of the data

No further work to "clean" is done to the data, however steps 6 and 7 could be considered as "cleaning", because they are done in order to obtain a more readable and understandable dataset.
There aren't any other variable transformations apart from the described in the steps 6 to 8.

## C) Description of the variables in the act_tidy.txt file

# C.1) Dimensions: 
   180 rows x 88 columns
   The firs 6 rows and first 6 columns are shown below as an example:
   
   subject_id     activity_label tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tGravityAcc-mean()-X
          1             LAYING         0.2215982      -0.040513953        -0.1132036           -0.2488818
          1            SITTING         0.2612376      -0.001308288        -0.1045442            0.8315099
          1           STANDING         0.2789176      -0.016137590        -0.1106018            0.9429520
          1            WALKING         0.2773308      -0.017383819        -0.1111481            0.9352232
          1 WALKING_DOWNSTAIRS         0.2891883      -0.009918505        -0.1075662            0.9318744
          1   WALKING_UPSTAIRS         0.2554617      -0.023953149        -0.0973020            0.8933511
   
# C.2) Summary:



# C.3) Variables present in the dataset
[01] subject_id
- Class: int
- Type: Categorical
- Description: Identification number given to each of the 30 volunteers for the experiment
- Levels: Values 1 to 30
- Schema: None

[02] activity_label
- Class: chr
- Type: Categorical
- Description: One of the six activities done by the volunteers of the experiment.
- Levels: 
   [1]
   [2]
   [3]
   [4]
   [5]
   [6]
- Schema: None

[03]	tBodyAcc-mean()-X
- Class: num
- Type: Continuous
- Description:
- Lavels:
- Schema: 

[04]	tBodyAcc-mean()-Y
[05]	tBodyAcc-mean()-Z
[06]	tGravityAcc-mean()-X
[07]	tGravityAcc-mean()-Y
[08]	tGravityAcc-mean()-Z
[09]	tBodyAccJerk-mean()-X
[10]	tBodyAccJerk-mean()-Y
[11]	tBodyAccJerk-mean()-Z
[12]	tBodyGyro-mean()-X
[13]	tBodyGyro-mean()-Y
[14]	tBodyGyro-mean()-Z
[15]	tBodyGyroJerk-mean()-X
[16]	tBodyGyroJerk-mean()-Y
[17]	tBodyGyroJerk-mean()-Z
[18]	tBodyAccMag-mean()
[19]	tGravityAccMag-mean()
[20]	tBodyAccJerkMag-mean()
[21]	tBodyGyroMag-mean()
[22]	tBodyGyroJerkMag-mean()
[23]	fBodyAcc-mean()-X
[24]	fBodyAcc-mean()-Y
[25]	fBodyAcc-mean()-Z
[26]	fBodyAcc-meanFreq()-X
[27]	fBodyAcc-meanFreq()-Y
[28]	fBodyAcc-meanFreq()-Z
[29]	fBodyAccJerk-mean()-X
[30]	fBodyAccJerk-mean()-Y
[31]	fBodyAccJerk-mean()-Z
[32]	fBodyAccJerk-meanFreq()-X
[33]	fBodyAccJerk-meanFreq()-Y
[34]	fBodyAccJerk-meanFreq()-Z
[35]	fBodyGyro-mean()-X
[36]	fBodyGyro-mean()-Y
[37]	fBodyGyro-mean()-Z
[38]	fBodyGyro-meanFreq()-X
[39]	fBodyGyro-meanFreq()-Y
[40]	fBodyGyro-meanFreq()-Z
[41]	fBodyAccMag-mean()
[42]	fBodyAccMag-meanFreq()
[43]	fBodyBodyAccJerkMag-mean()
[44]	fBodyBodyAccJerkMag-meanFreq()
[45]	fBodyBodyGyroMag-mean()
[46]	fBodyBodyGyroMag-meanFreq()
[47]	fBodyBodyGyroJerkMag-mean()
[48]	fBodyBodyGyroJerkMag-meanFreq()
[49]	angle(tBodyAccMean,gravity)
[50]	angle(tBodyAccJerkMean),gravityMean)
[51]	angle(tBodyGyroMean,gravityMean)
[52]	angle(tBodyGyroJerkMean,gravityMean)
[53]	angle(X,gravityMean)
[54]	angle(Y,gravityMean)
[55]	angle(Z,gravityMean)
[56]	tBodyAcc-std()-X
[57]	tBodyAcc-std()-Y
[58]	tBodyAcc-std()-Z
[59]	tGravityAcc-std()-X
[60]	tGravityAcc-std()-Y
[61]	tGravityAcc-std()-Z
[62]	tBodyAccJerk-std()-X
[63]	tBodyAccJerk-std()-Y
[64]	tBodyAccJerk-std()-Z
[65]	tBodyGyro-std()-X
[66]	tBodyGyro-std()-Y
[67]	tBodyGyro-std()-Z
[68]	tBodyGyroJerk-std()-X
[69]	tBodyGyroJerk-std()-Y
[70]	tBodyGyroJerk-std()-Z
[71]	tBodyAccMag-std()
[72]	tGravityAccMag-std()
[73]	tBodyAccJerkMag-std()
[74]	tBodyGyroMag-std()
[75]	tBodyGyroJerkMag-std()
[76]	fBodyAcc-std()-X
[77]	fBodyAcc-std()-Y
[78]	fBodyAcc-std()-Z
[79]	fBodyAccJerk-std()-X
[80]	fBodyAccJerk-std()-Y
[81]	fBodyAccJerk-std()-Z
[82]	fBodyGyro-std()-X
[83]	fBodyGyro-std()-Y
[84]	fBodyGyro-std()-Z
[85]	fBodyAccMag-std()
[86]	fBodyBodyAccJerkMag-std()
[87]	fBodyBodyGyroMag-std()
[88]	fBodyBodyGyroJerkMag-std()

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

