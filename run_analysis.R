features <- read.table("UCI HAR Dataset/features.txt")
labels <- read.table("UCI HAR Dataset/activity_labels.txt")

train <- read.table("UCI HAR Dataset/train/X_train.txt")
train.labels <- read.table("UCI HAR Dataset/train/y_train.txt")
train.subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(train) <- features$V2
train.activities <- merge(train.labels, labels, sort = FALSE)
train <- cbind(subject = train.subjects$V1, activity = train.activities$V2, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")
test.labels <- read.table("UCI HAR Dataset/test/y_test.txt")
test.subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(test) <- features$V2
test.activities <- merge(test.labels, labels, sort = FALSE)
test <- cbind(subject = test.subjects$V1, activity = test.activities$V2, test)

complete <- rbind(train, test)
mean <- aggregate(complete[, 3:length(complete)], list(subject = complete$subject,activity = complete$activity), mean)
subset.mean <- mean[, c(1, 2, sort(union(grep('mean()', features$V2, fixed = TRUE), grep('std()', features$V2, fixed = TRUE))) + 2)]
write.table(subset.mean, "table.txt", row.names = FALSE)
