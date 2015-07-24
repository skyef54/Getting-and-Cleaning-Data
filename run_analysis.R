require(dplyr)
require(reshape2)
require(tidyr)

#define input file names
f_features <- "features.txt"
f_activity_labels <- "activity_labels.txt"
f_x_train <- "./train/X_train.txt"
f_y_train <- "./train/y_train.txt"
f_subject_train <- "./train/subject_train.txt"
f_x_test <- "./test/X_test.txt"
f_y_test <- "./test/y_test.txt"
f_subject_test <- "./test/subject_test.txt"

#assemble train set
temp_subject <- scan(f_subject_train)
temp_y <- scan(f_y_train)
temp_x <- read.table(f_x_train)
temp_train <- cbind(temp_subject, temp_y, temp_x)

#assemble test set
temp_subject <- scan(f_subject_test)
temp_y <- scan(f_y_test)
temp_x <- read.table(f_x_test)
temp_test <- cbind(temp_subject, temp_y, temp_x)

#join sets to create one data set
dataset <- rbind(temp_train, temp_test)

#extracts only the measurements on the mean and standard deviation for each measurement
temp_feat_names <- read.table(f_features, stringsAsFactors = FALSE, col.names = c("f_id", "f_name"))
temp_valid_columns_id <- grep("mean|std", temp_feat_names$f_name)
dataset <- select(dataset, c(1, 2, temp_valid_columns_id + 2))

#label the data set with descriptive variable names after cleaning the names from bad characters
temp_valid_columns_names <- gsub("-", "_", gsub("\\(|\\)", "", temp_feat_names$f_name[temp_valid_columns_id]))
names(dataset) <- c("subject_id", "activity_id", temp_valid_columns_names)

#name the activities in the data set
temp_activity <- read.table(f_activity_labels, col.names = c("a_id", "a_name"))
dataset <- mutate(dataset, activity = temp_activity$a_name[activity_id]) %>% select(-activity_id)

#remove temporary data
rm(list = ls(pattern = "^temp"))

#creates a second, independent tidy data set with the average of each variable for each activity and each subject
dataset2 <- dataset %>% 
            melt(id=c("subject_id", "activity"), variable.name="var", value.name="value") %>% 
            group_by(subject_id, activity, var) %>%
            summarise(average = mean(value)) %>% 
            spread(key = var, value = average)

#write results into a file
f_output <- "average_by_subj_and_activity.txt"
write.table(dataset2, f_output, row.names = FALSE)