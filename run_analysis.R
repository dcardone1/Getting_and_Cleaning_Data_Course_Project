directory_path <-"./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset"

# Read txt file. See help to check for the sep argument of read.table. If you take a look to the file X_train.txt you see the numbers are separated by blank spaces.
# If you try to set the sep parameter to for example sep=" " you will get a lot of NA and a wrong structure of the data.
# The data don't have a header.
X_train <- read.table(paste0(directory_path, "/train/X_train.txt"), header = FALSE)
X_test <- read.table(paste0(directory_path, "/test/X_test.txt"), header = FALSE)

dim(X_train)
#There are 561 columns and 7352 rows

dim(X_test)
#There are 561 columns and 2947 rows

#take a look to the dataframes
head(X_train)

X_train[1,]

head(X_test)

X_test[1,]

# Check for NA values, in this dataset the result is 0
sum(is.na(X_train))

sum(is.na(X_test))


#Read the subject and activity columns
subject_train <- read.table(paste0(directory_path, "/train/subject_train.txt"), header = FALSE)
labels_train <- read.table(paste0(directory_path, "/train/y_train.txt"), header = FALSE)
subject_test <- read.table(paste0(directory_path, "/test/subject_test.txt"), header = FALSE)
labels_test <- read.table(paste0(directory_path, "/test/y_test.txt"), header = FALSE)

head(labels_test)

#check dimensions  for consistency
dim(subject_train)
dim(subject_test)
dim(labels_train)
dim(labels_test)

#check if the train subjects are different from the test subject. according to the README.txt file subjects are different people for test and for train
intersect(subject_test$V1, subject_train$V1)

#Add the new columns to the data sets
X_train['subject'] = subject_train

X_test['subject'] = subject_test

X_train['activity'] = labels_train

X_test['activity'] = labels_test

#Verify the new columns were added
X_train[1,]
X_test[67,]

#Concatenate both data sets to one
X_total <- rbind(X_train, X_test)

#Check for the right dimension
dim(X_total)[1] == dim(X_train)[1] + dim(X_test)[1]

#Read the activity labels
activity_labels <- read.table(paste0(directory_path, "/activity_labels.txt"), header = FALSE)

head(activity_labels)

#verify if the indices are integer
class(activity_labels$V1)

#Change activity indices for the corresponding label
X_total$activity <- sapply(X_total$activity, function(x) {activity_labels[activity_labels$V1 == x,2]})

head(X_total$activity)


#Get the 561 features names
features <- read.table(paste0(directory_path, "/features.txt"), header = FALSE)

head(features)

#Check if the number of features is consistent.
dim(features)


#add column names except for the last two columns 
colnames(X_total)[1:561] <- features[,2]
# Check the names
X_total[1,]

#Create a new data set that keeps only the means and standard deviations of each variable.
X_reduced <- X_total[,grepl("mean\\(\\)|std\\(\\)|activity|subject", colnames(X_total))]

head(X_reduced)

dim(X_reduced)

#Install dplyr package to summarize the dataset
install.packages("dplyr")

library(dplyr)

#Put subject and activity first, the function everything get every other column that is not named in the arguments 
X_reduced <- select(X_reduced, subject, activity, everything())

head(X_reduced)

dim(X_reduced)

names(X_reduced)[3:ncol(X_reduced)]

X_summarized <- X_reduced %>% group_by(subject, activity) %>% summarize(across(everything(), mean))

head(X_summarized)

dim(X_summarized)

#Save the tidy data set as a .txt file
write.table(X_summarized, paste0(directory_path, "/X_summarized.txt"), row.name=FALSE)
                     