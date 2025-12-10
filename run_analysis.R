directory_path <-"./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset"

# Read txt file check that the separator of columns is a blank space
X_train <- read.csv(paste0(directory_path, "/train/X_train.txt"), sep = " ", header = FALSE)

dim(X_train)

#take a look to the dataframe
head(X_train)

X_train[78,]
#there are some NA values in the data frame that need to be investigated

sum(is.na(X_train[5,]))
#it looks that every row has the same quantity of NAs (101 so 662 - 101 = 561) it 

#Get the 561 features names
features <- read.csv(paste0(directory_path, "/features.txt"), sep = " ", header = FALSE)

head(features)

colnames(features) <- c("id", "Feature")

head(features)
