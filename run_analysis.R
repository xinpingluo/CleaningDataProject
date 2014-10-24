setwd("C:/Users/DE-77691/Documents/1_Work/Tasks/Coursera/Lec3/Course Project")
library(plyr)

#Step 1 - merge training and test data
#######

train_x <- read.table("./data/train/X_train.txt")
train_y <- read.table ("./data/train/Y_train.txt")
train_subject <- read.table ("./data/train/subject_train.txt")
# bind columns of training data variables together
train_data <- (cbind( train_x, train_subject, train_y))

# bind columns of test data variables together
test_x<- read.table("./data/test/X_test.txt")
test_y <- read.table ("./data/test/Y_test.txt")
test_subject <- read.table ("./data/test/subject_test.txt")
test_data <-(cbind( test_x, test_subject, test_y))

# add rows of test data set to training data set
data_all <- rbind(train_data, test_data)

# save it under data_all
#write.table(data_all, file="data_all")


##Step 2 - extract only the measurements on the mean and std
########

features <- read.table("./data/features.txt")
#assign the correct variable names to data_all 
# with the last 2 variables being the subject and the Y variable
names(data_all) <- c(as.vector(features[,2]), "subject", "Y")

#get relevant indices for features with mean or std
index <- grep("mean\\(\\)|std\\(\\)|Mean\\(\\)|Std\\(\\)", features[,2])

# based on the indices -- get the relevant columns only
data_dense <- data_all[,c(index, 562, 563)]


##Step 3 - get the decoded activity names
#########
activity <- read.table("./data/activity_labels.txt")
names(activity) <- c("Y", "activity")
data_dense_dec <- join(data_dense, activity, by="Y", match = "first")


#Step 4
########
#Already Done in Step 2
names(data_dense_dec)

#Step5 
#######
# apply mean function for variables - group by variable activity & subject

library(reshape2)

#melt data frame based on IDs subject & activity
data_dense_dec_melt <- melt (data_dense_dec, id = c("subject", "activity"), measure.vars = c(1:67))

#apply the mean function based on the a subject + activity grouping
tidyData <- dcast(data_dense_dec_melt, subject + activity  ~ variable, mean)
write.table(tidyData, file="tidyData.txt", row.name = FALSE)