#loading data
	
	training<- read.table("X_train.txt")
	training_Act <- read.table("y_train.txt", col.names="activity")
	training_Subj <- read.table("subject_train.txt", col.names="subject")
	
	testing <- read.table("X_test.txt")
	testing_Act<-read.table("y_test.txt", col.names="activity")
	testing_Subj<-read.table("subject_test.txt",col.names="subject")
	
#merging the two data sets (training and testing) into one, named "data",
#and naming the variables by labels table

	data <-rbind(training,testing)
	features <- read.table("features.txt")
	labels <- features$V2
	names(data) <- labels

#finding where are the means and sd columns, and subsetting data this way
#I've tried gsubbing the names, but I could not do it. I still need more practice
#with it.
	filter<-grep("[Mm]ean|[Ss]td",names(data))
	filterData<-data[,filter]

#merging the subjects data sets and activities data sets
	subjects <- rbind(training_Subj,testing_Subj)
	activities <- rbind(training_Act,testing_Act)
	actLabels <- read.table("activity_labels.txt")
   	activities[, 1] <- actLabels[activities[, 1], 2]
	

#combining the three datasets - subjects, activities and data of means and sds
mergeData<- cbind(subjects,activities,filterData)

library(reshape2)

#final step: using reshape2 library, I am subsetting the merged data
# by subject and activity columns.  Then using dcas, I am calculating
# mean of each activity measure for each subject and activity.

meltData<-melt(mergeData, id.vars=c("subjectID","activityID","activityLabel"),
        				value.name="mean",
			 variable.name="activityMeasure")

tidyData<-dcast(meltData, subjectID+activityID+activityLabel ~ activityMeasure
	,mean, na.rm = TRUE, value.var="mean")
       write.table(tidyData, "Tidy_Data.txt")



 

