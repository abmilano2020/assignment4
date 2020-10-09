### step 1: uploading the needed library
library(reshape2)
### step 2: getting activity measurements, labels and features 
activity_labels <- read.csv("UCI HAR Dataset\\activity_labels.txt",
                            sep="", header=FALSE)
features <- read.csv("UCI HAR Dataset\\features.txt",
                     sep="", header=FALSE)

measurements_rows <- grep(".*mean.*|.*std.*", features[,2])
measurements = features[measurements_rows,2]
measurements = gsub('-mean', 'Mean', measurements)
measurements = gsub('-std', 'Std', measurements)
measurements = gsub('[-()]', '', measurements)

### step 3: loading and merging training data
training_set <- read.table("UCI HAR Dataset\\train\\X_train.txt")[measurements_rows]
training_labels <- read.table("UCI HAR Dataset\\train\\Y_train.txt")
subject_train <- read.table("UCI HAR Dataset\\train\\subject_train.txt")
train <- cbind(subject_train, training_labels, training_set)

### step 4: loading and merging test data
test_set <- read.table("UCI HAR Dataset\\test\\X_test.txt")[measurements_rows]
test_labels <- read.table("UCI HAR Dataset\\test\\Y_test.txt")
subject_test <- read.table("UCI HAR Dataset\\test\\subject_test.txt")
test <- cbind(subject_test, test_labels, test_set)

###step 5: merging training and test data
joint_data <- rbind(train, test)
colnames(joint_data) <- c("subject", "activity", measurements)

### step 6: turning into factors
joint_data$activity <- factor(joint_data$activity, levels = activity_labels[,1],
                              labels = activity_labels[,2])
joint_data$subject <- as.factor(joint_data$subject)

### step 7: ordering data
melt_data <- melt(joint_data, id = c("subject", "activity"))
mean_data <- dcast(melt_data, subject + activity ~ variable, mean)

### step 8: writing the tidy data .txt file
write.table(mean_data, "tidy_data.txt", row.names = FALSE, quote = FALSE)