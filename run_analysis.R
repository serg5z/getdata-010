library(reshape2)

run_analysis <- function(data_root) {
   data <- read.table(paste(data_root, "test/X_test.txt", sep="/"))
   data <- rbind(data, read.table(paste(data_root, "train/X_train.txt", sep="/")))
   
   column_names <- read.table(paste(data_root, "features.txt", sep="/"))
   
   colnames(data) <- as.character(column_names[[2]])

   # reduce column set to mean and std. deviation of computed magnitudes 
   # both in time and frequency domains
   data <- data[, grep(".*(mean|std)\\(\\)$", column_names[[2]])]

   # add activity column
   activities <- scan(paste(data_root, "test/y_test.txt", sep="/"))
   activities <- c(activities, scan(paste(data_root, "train/y_train.txt", sep="/")))
   activity_labels <- read.table(paste(data_root, "activity_labels.txt", sep="/"))
   data <- cbind(factor(activities, levels=activity_labels[,1], labels=activity_labels[,2]), data)
   colnames(data)[1] <- "Activity"
   
   #add Subject column
   subject <- scan(paste(data_root, "test/subject_test.txt", sep="/"))
   subject <- c(subject, scan(paste(data_root, "train/subject_train.txt", sep="/")))
   data <- cbind(subject, data)
   colnames(data)[1] <- "Subject"

   # calculate mean of each variable for each activity and each subject
   data <- melt(data, id=c("Activity", "Subject"))
   data <- dcast(data, Subject + Activity ~ ..., mean)

   data
}