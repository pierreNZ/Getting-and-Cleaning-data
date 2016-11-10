#load dplyr library and read txt files as tables
library(dplyr)

#read test tables
x_test <- read.table("./UCI HAR Dataset/test/x_test.txt",header = FALSE,sep = "")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE,sep = "")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE,sep = "")

#read train tables
x_train <- read.table("./UCI HAR Dataset/train/x_train.txt",header = FALSE,sep = "")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE,sep = "")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE,sep = "")

#read features text file as column headings
features <- read.table("./UCI HAR Dataset/features.txt",header = FALSE,sep = "")
features2 <- features[c(2)] #select column 2
features3 <- t(features2)   #transpose to get feature names in a row

#add features data frame as Colnames to x_test
colnames(x_test,do.NULL = TRUE)
colnames(x_test) <- features3

#merge test tables into one data frame
test_data <- data.frame(subject_test,y_test,x_test)

#add features data frame as colnames to x_train
colnames(x_train,do.NULL = TRUE)
colnames(x_train) <- features3

#merge train tables into one data frame
train_data <- data.frame(subject_train,y_train,x_train)

#merge train and test data frames into one data frame
My_df <- rbind(test_data,train_data)

#convert to data table and rename subject and activity variables
My_tbl <- tbl_df(My_df)
colnames(My_tbl)[1] <- "Subject"
colnames(My_tbl)[2] <- "Activity"

#select only subject, Activity variables and variables of mean and std of measurements
My_tbl_subset <- select(My_tbl,  grep("Subject|Activity|mean|std", names(My_tbl)))

#give descriptive names for the activities
act_names <- c("Walking","Walking_upstairs","walking_downstairs","sitting","standing","laying")
My_tbl_subset$Activity <- factor(My_tbl_subset$Activity, labels = act_names)

#remove the () from variable names
sub("()","",names(My_tbl_subset))

#create tidy data set with the average of each variable for each activity and each subject
tbl_summary <-aggregate(My_tbl_subset, by=list(My_tbl_subset$Subject,My_tbl_subset$Activity), FUN=mean, na.rm=TRUE)
tbl_summary2 <- select(tbl_summary,-(Subject:Activity))  #remove columns with NA and Group number
colnames(tbl_summary2)[1] <- "Subject"                   #rename subject variable
colnames(tbl_summary2)[2] <- "Activity"                  #rename activity variable

#write table as txt file
write.table(tbl_summary2,file="My_submission", row.names = FALSE)

#guidelines for reading the submitted txt file
address <- "https://s3.amazonaws.com/coursera-uploads/peer-review/HkJsxW0yEeWEewoyD2Bc5Q/23543ee0b24b240bf2f924e2c32a906d/My_submission"
address <- sub("^https", "http", address)
run_analysis <- read.table(url(address), header = TRUE)



