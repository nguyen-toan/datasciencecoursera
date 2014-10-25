#CodeBook

This file explains the required input and expected output when running the `run_analysis.R` script.

*Notice*: The dataset and input, output are in the same R working environment.

##Input

Here is the data used in this analysis:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

After unzipping the data, we have a folder called `UCI HAR Dataset` and we will only need the following files:
  
* `features.txt`: list of names of features
* `activity_labels.txt`: class labels with their activity name
* `train/subject_train.txt`: subjects in training dataset
* `train/X_train.txt`: training set data
* `train/y_train.txt`: training set labels
* `test/subject_test.txt`: subjects in test dataset
* `test/X_test.txt`: test set data
* `test/y_test.txt`: test set labels


##Output

The required tidy dataset `tidy_data.txt` is generated, with the average of each variable for each activity and each subject.


##Variables

The variables in the tidy dataset include:

- activityName: contain the activity names.
  
  Activity ID | Activity Name
  ------------|--------------
  1 | WALKING
  2 | WALKING_UPSTAIRS
  3 | WALKING_DOWNSTAIRS
  4 | SITTING
  5 | STANDING
  6 | LAYING


- subjectID: contain the subject IDs.

- variables in the 3rd to 81th column, which are extracted from the [features_info.txt](https://github.com/nguyen-toan/datasciencecoursera/blob/master/03_GettingData/PeerAssessment/features_info.txt) file on the original dataset.

## Description of analysis process:

- For step 1 to step 4, create `create.dataset` function with argument _data.name_  which can be either 'test' or 'train'. The function merges the features, activitiy labels, subject IDs from _.txt_ files and uses `grep` function to extract only measurements of means and standard deviations. Then create trainging and test datasets, and merge them into one tidy dataset.
- In step 5, use functions in `reshape2` package to calculate the average of each variable for each activity. The result is written into [tidy_data.txt](https://github.com/nguyen-toan/datasciencecoursera/blob/master/03_GettingData/PeerAssessment/tidy_data.txt).
