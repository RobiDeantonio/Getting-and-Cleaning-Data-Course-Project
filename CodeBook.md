## Code Book

This code book will describe the data used in this project, as well as the processing required to create the resulting tidy data set.

### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

Check the `README.txt` file for further details about this dataset.. More information about the features is available in `features_info.txt`.

### Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment.

### Processing steps

1. All of the relevant data files were read into data frames, appropriate column headers were added, and the training and test sets were combined into a single data set.
2. All feature columns were removed that did not contain the exact string "mean()" or "std()". This left 66 feature columns, plus the subjectID and activity columns.
3. The activity column was converted from a integer to a factor, using labels describing the activities.
4. A tidy data set was created containing the mean of each feature for each subject and each activity. Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 66 features for that subject/activity combination. Since there are 30 subjects, there are a total of 180 rows.
5. The tidy data set was output to a CSV file.

### Explanation of each file

- **features.txt :** Only names of the 561 features.
- **activity_labels.txt:** Names and IDs for each of the 6 activities.
#### Train folder
- **X_train.txt:** Observations of 21 of the 30 volunteers, 7352 records with 563 variables
- **subject_train.txt:** A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in X_train.txt.
- **y_train.txt:** ID of the activity related to each of the observations in X_train.txt.
#### Test folder
- **X_test.txt:** Observations of 9 of the 30 volunteers, 2947 records with 563 variables
- **subject_test.txt:** A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in X_test.txt.
- **y_test.txt:** ID of the activity related to each of the observations in X_test.txt. 



