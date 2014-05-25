train<-read.table("./UCI HAR Dataset/train/x_train.txt",col.names=1:561)
trainlables<-read.table("./UCI HAR Dataset/train/y_train.txt",header=F,col.names=c("activity"))
trainsuject<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=F,col.names=c("subject"))
train<-data.frame(cbind(trainsuject1,trainlables1,train1))

test<-read.table("./UCI HAR Dataset/test/x_test.txt",header=F,col.names=1:561)
testlables<-read.table("./UCI HAR Dataset/test/y_test.txt",header=F,col.names=c("activity"))
testsuject<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=F,col.names=c("subject"))
test<-data.frame(cbind(testsuject1,testlables1,test1))

mergedData1<-data.frame(rbind(train1[,],test1[,]))

mergedData1<-transform(mergedData1,subject=as.factor(mergedData1$subject) , activity=as.factor(mergedData1$activity))

mergedData2<-mergedData1[order(c(mergedData1$suject,mergedData1$activity)),]

mergedData2$Avg<-rowSums(mergedData2[,3:563])/561

write.table(mergedData2, file = "./tidyDataset.csv", sep = ",", col.names = NA,qmethod = "double")
