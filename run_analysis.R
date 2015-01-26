library(reshape2)

data <- read.table("UCI HAR Dataset/test/X_test.txt")
data <- rbind(data, read.table("UCI HAR Dataset/test/X_test.txt"))
