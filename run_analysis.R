setwd("D:/Priyanka/Coursera/3.Getting & Cleaning Data/Data/Assignment/")
library(data.table)
variables <- fread("D:/Priyanka/Coursera/3.Getting & Cleaning Data/Data/Assignment/UCI HAR Dataset/features.txt", col.names = c("feature.id","feature.name"))
features<- as.character(t(variables[,2, with= FALSE]))

Sub_train <- fread("D:/Priyanka/Coursera/3.Getting & Cleaning Data/Data/Assignment/UCI HAR Dataset/train/subject_train.txt", col.names = "subject_id")
Sub_test <- fread("D:/Priyanka/Coursera/3.Getting & Cleaning Data/Data/Assignment/UCI HAR Dataset/test/subject_test.txt", col.names = "subject_id")

Activity <- fread("D:/Priyanka/Coursera/3.Getting & Cleaning Data/Data/Assignment/UCI HAR Dataset/activity_labels.txt", col.names = c("activity_id","activity_label"))

Data_train_x <- fread("D:/Priyanka/Coursera/3.Getting & Cleaning Data/Data/Assignment/UCI HAR Dataset/train/X_train.txt", col.names = features)
Data_test_x <- fread("D:/Priyanka/Coursera/3.Getting & Cleaning Data/Data/Assignment/UCI HAR Dataset/test/X_test.txt", col.names = features)

Data_train <- cbind(Sub_train, Activity, Data_train_x )
Data_test <- cbind(Sub_train, Activity, Data_train_x )
Final_Data <- rbind(Data_train, Data_test)

Final_Data1<- as.data.frame(Final_Data)
mean_sd<- Final_Data1[, c(1,2,3,grep("mean", colnames(Final_Data1)), grep("std", colnames(Final_Data1)))]
View(mean_sd)

tidy_data <- aggregate(.~ subject_id + activity_id + activity_label, data = mean_sd, FUN= mean)
write.csv(tidy_data, "Tidy_data_set.csv", row.names = FALSE)
