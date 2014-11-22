library(reshape2)

# Load the Training Data
trainDataX <- read.table("train/X_train.txt")
trainDataY <- read.table("train/y_train.txt")
trainDataSubj <- read.table("train/subject_train.txt")

# Combine the Training Data into 1 Data Frame
trainData <- cbind(trainDataSubj, trainDataY, trainDataX)

#Load the Test Data
testDataX <- read.table("test/X_test.txt")
testDataY <- read.table("test/y_test.txt")
testDataSubj <- read.table("test/subject_test.txt")

# Combine the Test Data into 1 Data Frame
testData <- cbind(testDataSubj, testDataY, testDataX)

# Combine the Training and Test Data into 1 Data Frame
mergedData <- rbind(trainData, testData)

# Add the Variable Names to the Data Frame
featuresTable <- read.table("features.txt")
features <- append(c("Subject", "Activity"), as.vector(featuresTable[,2]))
names(mergedData) <- features

# Convert the "Activity" Feature into a Factor Variable with Appropriate Labels
mergedData$Activity <- factor(mergedData$Activity, levels = c(1,2,3,4,5,6), labels = c("walking", "walkingUpstairs", "walkingDownstairs", "sitting", "standing", "laying"))

# Extract Only the Columns Containing the Means and Standard Deviations of Each Measurement
mergedData <- mergedData[,append(c(1,2), grep("(mean[^F]|std)", features))]

# Create Tidy Data Set (Long Form)
longData <- melt(mergedData, id.vars = c("Subject", "Activity"), variable.name = "Feature")
tidyData <- dcast(longData, Subject + Feature ~ Activity, fun.aggregate = mean)
tidyData <- melt(tidyData, id.vars = c("Subject", "Feature"), variable.name = "activity", value.name = "meanValue")
names(tidyData) <- c("subject", "feature", "activity", "meanValue")
tidyData$feature <- factor(tidyData$feature)

# Modify "Features" Values for Clarity and Completeness
tidyData[,2] <- sub("\\-mean\\(\\)", "Mean", tidyData[,2])
tidyData[,2] <- sub("\\-std\\(\\)", "StdDev", tidyData[,2])
tidyData[,2] <- sub("^t", "time", tidyData[,2])
tidyData[,2] <- sub("^f", "freq", tidyData[,2])
tidyData[,2] <- sub("\\-([XYZ])$", "\\1", tidyData[,2])


# Save the Tidy Data Set
write.table(tidyData, file = "tidyData.txt", row.names = FALSE)
