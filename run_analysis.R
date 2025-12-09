directory_path <-"./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset"

# Read txt file check that the separator of columns is a blank space
X_train <- read.csv(paste0(directory_path, "/train/X_train.txt"), sep = " ", header = FALSE)

#check for the number of columns and rows:
# according to the Readme.txt from the dataset each row should have: 
# 3 accelerations X, Y, Z
# 3 estimated body accelerations
# 3 velocities from the gyroscope
# 561 features columns with time and frequency domain variables
# 1 activity label
# 1 subject id.
# total = 662

dim(X_train)

#take a look to the dataframe
head(X_train)

#Get the 561 features names


features <- read.csv(paste0(directory_path, "/features.txt"), sep = " ", header = FALSE)

head(features)

colnames(features) <- c("id", "Feature")

head(features)
