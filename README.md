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
