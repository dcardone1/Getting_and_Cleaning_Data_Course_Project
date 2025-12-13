# Getting_and_Cleaning_Data_Course_Project by Diego Cardone.
It is a final project for the getting and cleaning data course given by Coursera in a data science specialization of Johns Hopkins university


Data Origin:
-------------------------------------------------------------------------------------
"http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
Reyes-Ortiz, J., Anguita, D., Ghio, A., Oneto, L., & Parra, X. (2013). 
Human Activity Recognition Using Smartphones [Dataset]. 
UCI Machine Learning Repository. https://doi.org/10.24432/C54S4K.

It is strongly adviced to read the README.txt and features_info.txt files from the original data set.

The project is composed of one R script "run_analysis.R". The purpose of the script is the deliver two tidy data sets called X_reduced and X_summarized

X_reduced (As obtained in line 107) contains all mean and standard deviation of the variables(Features) sample windows as described in README.txt.

X_summarized (As obtained in line 115) contains the mean values for every variable grouped by subject and activity.

Read CodeBook.md for details on the structure of both data frames.

Steps:
--------------------------------------------------------------------------------------

The steps are described in the comments of each line of the script. 

     1) Set the directory path to reach the original data set files
    
     2) Read txt file. See help to check for the sep argument of read.table. If you take a look to the file X_train.txt you see the numbers are separated by blank spaces.
        If you try to set the sep parameter to for example sep=" " you will get a lot of NA and a wrong structure of the data.
        The data don't have a header.
    
     3) Check the dimension of both train and test data sets
        There are 561 columns and 7352 rows in X_train
        There are 561 columns and 2947 rows in X_test
    
     4) Take a look to the dataframes to see if everything looks ok
    
     5) Check for NA values, in this data sets the result is 0 for both
    
     6) Read the subject and activity columns
    
     7) check if the train subjects are different from the test subject. according to the README.txt file subjects are different people for test and for train
    
     8)Add the new columns to the data sets
    
     9) Verify the new columns were added
    
     10) Concatenate both data sets to one using rbind() (complete rows from one are added to the other) asign result to X_total
    
     11) Read the activity labels to convert indices to labels
    
        Change activity indices for the corresponding label
    
     12) Get the 561 features names
    
     13) Add column names (features) except for the last two columns 
    
     14) Create a new data set that keeps only the means and standard deviations of each variable using regular expressions.
    
     15) Install dplyr package to summarize the dataset
    
     16) Put subject and activity first, the function everything get every other column that is not named in the arguments. 
    
     17) Check the result
    
     18) Use dplyr package and pipelines to obtain the tidy data set. two new funtions were used here everything and across to get the mean for each group across all variables
    
        Check results
    
     19) Save the tidy data set as a .txt file


