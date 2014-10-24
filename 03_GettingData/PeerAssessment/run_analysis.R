## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 

# assume that the "UCI HAR Dataset" is put the same working directory
data.rootdir <- "./UCI HAR Dataset"

# Function to create (test or train) dataset
create.dataset <- function(data.name) {
  # data folder path
  data.dir <- paste(data.rootdir, "/", data.name, sep="")
  
  # measure names
  measures <- read.table(paste(data.rootdir, "/features.txt", sep=""))
  names(measures) <- c("measureID", "measureName")
  
  # indices of measurements on the mean and standard deviation for each measurement
  target.measure.idx <- grep("mean|std", measures$measureName)
  
  # subject IDs
  subject <- read.table(paste(data.dir, "/subject_", data.name, ".txt", sep=""))
  names(subject) <- c("subjectID")
  
  # activity IDs
  y.data <- read.table(paste(data.dir, "/y_", data.name, ".txt", sep=""))
  # activity labels
  y.names <- read.table(paste(data.rootdir, "/activity_labels.txt", sep=""))
  # merge activity IDs and labels
  y.data <- merge(y.data, y.names)
  names(y.data) <- c("activityID", "activityName")
  
  # data of target measurements
  x.data <- read.table(paste(data.dir, "/x_", data.name, ".txt", sep=""))
  x.data.subset <- x.data[, target.measure.idx]
  names(x.data.subset) <- measures$measureName[target.measure.idx]
  
  # return a tidy dataset
  data.frame(subject, y.data, x.data.subset)
}

# tidy dataset
train.df <- create.dataset("train")
test.df <- create.dataset("test")
data.df <- rbind(train.df, test.df)


## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.

vars <- c("activityID", "activityName", "subjectID")
measure.vars <- setdiff(colnames(data.df), vars)
data.melt <- melt(data.df, id=vars, measure.vars=measure.vars)
data.df2 <- dcast(data.melt, activityName + subjectID ~ variable, mean)

write.table(data.df2, file="tidy_data.txt", row.name=FALSE)
