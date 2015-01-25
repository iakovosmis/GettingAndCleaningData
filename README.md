Important Notice:
Script will work correctly only if the samsung data given with the project are in the same folder with the script.Also dplyr package must be installed in order the script to work.

Instructions for how run_analysis script works:
 
1)Reads the data from X_test.txt from test folder.

2)Reads subject data from test folder.

3)Adds data retrieved from subject_test.txt to data reatrieved from X_test.txt 

3)Reads activity type data from y_test.txt

4)Creates final dataset for test folder after binding data of y_test.txt with previous dataset.

5)Reads the data from X_train.txt from train folder

6)Reads subject data from train folder

7)Adds data read from subject_train.txt to data read from X_train.txt 

8)Reads activity type data from y_train.txt

9)Creates final dataset for train folder after binding data of y_train.txt with previous dataset.

10)Creates the  merged dataset binding the datasets from test and train folders.

11)Reads measurement column names from features.txt

12)Keeps only the column containing the actual name of the variable.

13)Sets the names attribute of the merged data set with the desired values

14)Extracts only the measurements on the mean and standard deviation(plus Subject and Activity columns) for each measurement using regular expression with grep. 

15)Reads the activity labels from the file.

16)Merges the activity labels with dataset.

17)Creates final dataset with average of each measurement grouped by subject and activity

18)Exports final dataset to txt file.
