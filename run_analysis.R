#### Project #### 

# Merge training and test sets

X_test <- read.table("D:/Coursera/get_clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", quote="\"", comment.char="")
X_train <- read.table("D:/Coursera/get_clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", quote="\"", comment.char="")

#add column names

features <- read.table("D:/Coursera/get_clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt", quote="\"", comment.char="")
features<-features[,2]

names(X_test)<-features
names(X_train)<-features

# Add labels and subjects

y_test <- read.table("D:/Coursera/get_clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt", quote="\"", comment.char="")
y_train <- read.table("D:/Coursera/get_clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt", quote="\"", comment.char="")

names(y_test)<-"label"
names(y_train)<-"label"

subject_test <- read.table("D:/Coursera/get_clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", quote="\"", comment.char="",
                           col.names = "subject")
subject_train <- read.table("D:/Coursera/get_clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", quote="\"", comment.char="",
                            col.names= "subject")


X_test<-cbind(subject_test,y_test,X_test)
X_train<-cbind(subject_train,y_train,X_train)




#merge

merged_sample<-rbind(X_test,X_train)

# extract only the measurements on the mean and standard deviation

library(dplyr)
mean_sd <- merged_sample %>% select(subject,label, contains("mean"), contains("std"))

#uses descriptive activity names to name the activities in the data set

activity_labels <- read.table("D:/Coursera/get_clean_data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt",
                              quote="\"", comment.char="",
                              col.names=c("label", "activity"))

mean_sd_act<-merge(activity_labels,mean_sd, by="label")

#Appropriately labels the data set with descriptive variable names. 

#This was done in line 13 and 14, according to the code book

# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidy_data<-mean_sd_act %>% group_by(activity, subject) %>% 
summarise_all(mean)

write.table(tidy_data,"./data/tidy_data.txt", row.names = FALSE)


