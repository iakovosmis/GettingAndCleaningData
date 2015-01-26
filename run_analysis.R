function(){
        testX<-read.table("./test/X_test.txt",header = FALSE) ## read the data from X_test.txt from test folder
        subjectTest<-read.table("./test/subject_test.txt",header=FALSE) ## read subject data from test folder
        testX<-cbind(testX,subjectTest) ## add data read from subject_test.txt to data read from X_test.txt 
        activitiesTest<-read.table("./test/y_test.txt",header=FALSE) ## read activity type data from y_test.txt
        testX<-cbind(testX,activitiesTest) ## final dataset for test folder after binding data of y_test.txt with previous dataset.
        trainX<-read.table("./train/X_train.txt",header = FALSE) ## read the data from X_train.txt from train folder
        subjectTrain<-read.table("./train/subject_train.txt",header=FALSE) ## read subject data from train folder
        trainX<-cbind(trainX,subjectTrain) ## add data read from subject_train.txt to data read from X_train.txt 
        activitiesTrain<-read.table("./test/y_train.txt",header=FALSE) ## read activity type data from y_train.txt
        trainX<-cbind(trainX,activitiesTrain) ## final dataset for train folder after binding data of y_train.txt with previous dataset.
        mergedDataset<-rbind(trainX,testX) ## merged dataset
        columnNames<-read.table("features.txt",stringsAsFactors = FALSE) ## read measurement column names from features.txt
        columnNames<-columnNames[['V2']] ##keep only the name of the column
        names(mergedDataset)=c(columnNames,"Subject","Activity") ## set the names attribute of the merged data set with the desired values
        mergedDataset<-mergedDataset[,grep(".*mean().*|.*std().*|.*Subject.*|.*Activity.*",names(mergedDataset))] ## Extract only the measurements on the mean and standard deviation(plus Subject and Activity columns) for each measurement using regular expression with grep 
        activitiesNames<-read.table("activity_labels.txt",header = FALSE) ##read the activity labels from the file
        mergedDataset<-merge(mergedDataset,activitiesNames,by.x="Activity",by.y="V1",all=TRUE) ## merge the activity labels with dataset
        finalDataSet<-summarise_each(group_by(mergedDataset,Subject,Activity),funs(mean)) ##final dataset with average of each measurement grouped by subject and activity
        file<- write.table(finalDataSet,"./tinyDataSet.txt",row.names=FALSE) ##export final dataset to txt file.
        
}
