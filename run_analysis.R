##### Class Project for "Getting and Cleaning Data"

### STEP 1: Merges the training and the test sets to create one data set

## read data
subject_train <- read.table("./Getting&CleaningData/Dataset/train/subject_train.txt")
subject_test <- read.table("./Getting&CleaningData/Dataset/test/subject_test.txt")
X_train <- read.table("./Getting&CleaningData/Dataset/train/X_train.txt")
X_test <- read.table("./Getting&CleaningData/Dataset/test/X_test.txt")
y_train <- read.table("./Getting&CleaningData/Dataset/train/y_train.txt")
y_test <- read.table("./Getting&CleaningData/Dataset/test/y_test.txt")

featureNames <- read.table("./Getting&CleaningData/Dataset/features.txt")


## STEP 3: Uses descriptive activity names to name the activities
## in the data set.

# add column names
names(subject_train) <- "ID"
names(subject_test) <- "ID"
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2
names(y_train) <- "activity"
names(y_test) <- "activity"

# combine files into one dataset
train <- cbind(subject_train, y_train, X_train)
test <- cbind(subject_test, y_test, X_test)
combined <- rbind(train, test)


## STEP 2: Extracts only the measurements on the mean and standard
## deviation for each measurement.


# determine which columns contain "mean()" or "std()"
meanstdcols <- grepl("mean\\(\\)", names(combined)) |
  grepl("std\\(\\)", names(combined))

# ensure that we also keep the ID and activity columns
meanstdcols[1:2] <- TRUE
combined <- combined[, meanstdcols]


## STEP 4: Appropriately labels the data set with descriptive

combined$activity <- factor(combined$activity, labels=c("Walking", "Walking Upstairs",
                                "Walking Downstairs", "Sitting", "Standing", "Laying"))

## STEP 5: Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.

library(reshape2)

# create the tidy data set
melted <- melt(combined, id=c("ID","activity"))
tidy <- dcast(melted, ID+activity ~ variable, mean)

# write the tidy data set to a file
write.csv(tidy, "tidy.csv", row.names=FALSE)


